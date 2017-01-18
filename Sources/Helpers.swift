//
//  Helpers.swift
//  SwinjectAutoregistration
//
//  Created by Tomas Kohout on 18/01/2017.
//  Copyright © 2017 Swinject Contributors. All rights reserved.
//

import Foundation

var optionalCheckRegex = try! NSRegularExpression(pattern: "^Optional<.*>$", options: [])

var optionalMessage:(String)->String = { _ in "AutoRegistration for services with optional dependencies is not supported. Split to multiple initializers or use regular `register` method. " }

//Check whether a type is optional by converting it to a string and matching it with regular expression

func isOptional(_ service: Any) -> Bool {
    let serviceType = String(describing: service.self)
    return optionalCheckRegex.firstMatch(in: serviceType, options: [], range: NSMakeRange(0, serviceType.characters.count)) != nil
}
