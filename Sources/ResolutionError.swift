//
//  Warnings.swift
//  SwinjectAutoregistration
//
//  Created by Tomas Kohout on 18/01/2017.
//  Copyright © 2017 Swinject Contributors. All rights reserved.
//

import Foundation

enum ResolutionError {
    case optional(String)
    case implicitlyUnwrappedOptional(String)
    case tooManyDependencies(Int)
    var message: String {
        switch self {
        case .optional(let name):
            return "⚠ Autoregistration of optional dependency (\(name))? is not supported. Split to multiple initializers or use regular `register` method. "
        case .implicitlyUnwrappedOptional(let name):
            return "⚠ Autoregistration of implicitly unwrapped optional dependency (\(name))! is not supported. Use regular `register` method. "
        case .tooManyDependencies(let dependencyCount):
            return "⚠ Autoregistration is limited to maximum of \(maxDependencies) dependencies, tried to resolve \(dependencyCount). Use regular `register` method instead. "
        }
    }
}

/// Shows warnings based on information parsed from initializers description

func resolutionErrors<Service, Parameters>(forInitializer initializer: (Parameters) -> Service) -> [ResolutionError] {
    #if os(Linux)
        //Warnings are not supported on Linux
        return []
    #endif
    let parser = TypeParser(string: String(describing: Parameters.self))
    guard let type = parser.parseType() else { return [] }
    
    let dependencies: [Type]
    
    //Multiple arguments
    if case .tuple(let types) = type {
        dependencies = types
    //Single argument
    } else if case .identifier(_) = type {
        dependencies = [type]
    } else {
        return []
    }
    
    var warnings: [ResolutionError]  = []
    
    
    if dependencies.count > maxDependencies {
        warnings.append(.tooManyDependencies(dependencies.count))
    }
    
    for dependency in dependencies {
        if case .identifier(let dependencyType) = dependency, let generic = dependencyType.genericTypes.first {
            if dependencyType.name == "Optional" {
                warnings.append(.optional("\(generic)"))
            } else if dependencyType.name == "ImplicitlyUnwrappedOptional" {
                warnings.append(.implicitlyUnwrappedOptional("\(generic)"))
            }
        }
    }
    
    return warnings
}

func hasUnique(arguments: [Any.Type]) -> Bool {
    for (index, arg) in arguments.enumerated() {
        if (arguments.enumerated().filter { index != $0 && arg == $1 }).count > 0 {
            return false
        }
    }
    return true
}
