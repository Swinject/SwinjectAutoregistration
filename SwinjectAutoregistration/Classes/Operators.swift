//
//  Swinject+Operators.swift
//  Pods
//
//  Created by Tomas Kohout on 8/30/16.
//
//

import Swinject
import Foundation

//infix operator ~ { associativity left precedence 160 }
postfix operator ~> {}

/** Unary operator which automatically resolves the return type
 Usage: `SomeClass(dependencyA: r~>, dependencyB: r~>)`
 - Parameters:
 - r: Resolver
 - Returns: The resolved service type instance.
 - Important: Fails on unresolvable service.
 */
public postfix func ~> <Service>(r: ResolverType) -> Service {
    return r.resolve(Service.self)!
}

/** Binary operator ~> equivalent to `r.resolve(Service.Type)!`
 
 Usage: `SomeClass(dependencyA: r ~> DependencyA.self)`
 - Parameters:
 - r: Resolver
 - service: Type of service to resolve.
 
 - Returns: The resolved service type instance.
 - Important: Fails on unresolvable service.
 */
public func ~> <Service>(r: ResolverType, service: Service.Type) -> Service {
    return r.resolve(service)!
}

/** Binary operator ~> equivalent to `r.resolve(Service.Type, argument: Arg1)!`
 
 Usage: `SomeClass(dependencyA: r ~> (DependencyA.self, argument: arg))`
 - Parameters:
 - r: Resolver
 - o.service: Type of service to resolve.
 - o.argument: Argument to pass
 
 - Returns: The resolved service type instance.
 - Important: Fails on unresolvable service.
 */
public func ~> <Service, Arg1>(r: ResolverType, o: (service: Service.Type, argument: Arg1) ) -> Service {
    return r.resolve(o.service, argument: o.argument)!
}

/** Binary operator ~> equivalent to `r.resolve(Service.Type, arguments: (Arg1, Arg2))!`
 
 Usage: `SomeClass(dependencyA: r ~> (DependencyA.self, arguments: (arg1, arg2)))`
 - Parameters:
 - r: Resolver
 - o.service: Type of service to resolve.
 - o.arguments: Arguments to pass
 
 - Returns: The resolved service type instance.
 - Important: Fails on unresolvable service.
 */
public func ~> <Service, Arg1, Arg2>(r: ResolverType, o: (Service.Type, arguments: (Arg1, Arg2)) ) -> Service {
    return r.resolve(o.0, arguments: o.arguments)!
}
