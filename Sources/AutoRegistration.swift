//
//  Sources/AutoRegistration.swift
//  Swinject
//
//  Generated using Swinject AutoRegistration generator.
//


 import Swinject 


extension Container {

/** Registers a factory that resolves the Service based on dependencies infered from the Service initializer.
 
 Usage: `autoregister(MyService.self), initializer: MyService.init`
 - Parameters:
    - service: Registered service type
    - name: Optional name of the service

    - initializer: Initializer of the registered service
 - Returns: The registered service entry 
 - Important: Might fail if one of the dependencies is unresolvable.
 */
@discardableResult
public func autoregister<Service>(_ service: Service.Type, name: String? = nil, initializer: @escaping () -> Service) -> ServiceEntry<Service> {
   return self.register(service.self, name: name, factory: { r in 
       initializer()
   } as (ResolverType) -> Service)
}

/** Registers a factory that resolves the Service based on dependencies infered from the Service initializer.
 
 Usage: `autoregister(MyService.self), initializer: MyService.init`
 - Parameters:
    - service: Registered service type
    - name: Optional name of the service

    - initializer: Initializer of the registered service
 - Returns: The registered service entry 
 - Important: Might fail if one of the dependencies is unresolvable.
 */
@discardableResult
public func autoregister<Service, A>(_ service: Service.Type, name: String? = nil, initializer: @escaping (A) -> Service) -> ServiceEntry<Service> {
   return self.register(service.self, name: name, factory: { r in 
       let a: A? = r.resolve()
       checkResolved(initializer: initializer, services: a)
       return initializer(a!)
   } as (ResolverType) -> Service)
}

/** Registers a factory that resolves the Service based on dependencies infered from the Service initializer.
 
 Usage: `autoregister(MyService.self, argument: Arg1.self), initializer: MyService.init`
 - Parameters:
    - service: Registered service type
    - name: Optional name of the service
    - argument: Argument type(s) that will be resolved dynamically instead of resolving dependency
    - initializer: Initializer of the registered service
 - Returns: The registered service entry with 1 arguments
 - Important: Might fail if one of the dependencies is unresolvable.
 */
@discardableResult
public func autoregister<Service, Arg1>(_ service: Service.Type, name: String? = nil, argument  arg1: Arg1.Type, initializer: @escaping (Arg1) -> Service) -> ServiceEntry<Service> {
   return self.register(service.self, name: name, factory: { r, arg1 in 
       let arg1: Arg1? = arg1
       checkResolved(initializer: initializer, services: arg1)
       return initializer(arg1!)
   } as (ResolverType, Arg1) -> Service)
}

/** Registers a factory that resolves the Service based on dependencies infered from the Service initializer.
 
 Usage: `autoregister(MyService.self), initializer: MyService.init`
 - Parameters:
    - service: Registered service type
    - name: Optional name of the service

    - initializer: Initializer of the registered service
 - Returns: The registered service entry 
 - Important: Might fail if one of the dependencies is unresolvable.
 */
@discardableResult
public func autoregister<Service, A, B>(_ service: Service.Type, name: String? = nil, initializer: @escaping (A, B) -> Service) -> ServiceEntry<Service> {
   return self.register(service.self, name: name, factory: { r in 
       let a: A? = r.resolve(); let b: B? = r.resolve()
       checkResolved(initializer: initializer, services: a, b)
       return initializer(a!, b!)
   } as (ResolverType) -> Service)
}

/** Registers a factory that resolves the Service based on dependencies infered from the Service initializer.
 
 Usage: `autoregister(MyService.self, argument: Arg1.self), initializer: MyService.init`
 - Parameters:
    - service: Registered service type
    - name: Optional name of the service
    - argument: Argument type(s) that will be resolved dynamically instead of resolving dependency
    - initializer: Initializer of the registered service
 - Returns: The registered service entry with 1 arguments
 - Important: Might fail if one of the dependencies is unresolvable.
 */
@discardableResult
public func autoregister<Service, A, B, Arg1>(_ service: Service.Type, name: String? = nil, argument  arg1: Arg1.Type, initializer: @escaping (A, B) -> Service) -> ServiceEntry<Service> {
   return self.register(service.self, name: name, factory: { r, arg1 in 
       let a: A? = r.resolve(argument: arg1); let b: B? = r.resolve(argument: arg1)
       checkResolved(initializer: initializer, services: a, b)
       return initializer(a!, b!)
   } as (ResolverType, Arg1) -> Service)
}

/** Registers a factory that resolves the Service based on dependencies infered from the Service initializer.
 
 Usage: `autoregister(MyService.self, arguments: Arg1.self, Arg2.self), initializer: MyService.init`
 - Parameters:
    - service: Registered service type
    - name: Optional name of the service
    - arguments: Argument type(s) that will be resolved dynamically instead of resolving dependency
    - initializer: Initializer of the registered service
 - Returns: The registered service entry with 2 arguments
 - Important: Might fail if one of the dependencies is unresolvable.
 */
@discardableResult
public func autoregister<Service, A, B, Arg1, Arg2>(_ service: Service.Type, name: String? = nil, arguments  arg1: Arg1.Type, _ arg2: Arg2.Type, initializer: @escaping (A, B) -> Service) -> ServiceEntry<Service> {
   return self.register(service.self, name: name, factory: { r, arg1, arg2 in 
       let a: A? = r.resolve(arguments: arg1, arg2); let b: B? = r.resolve(arguments: arg1, arg2)
       checkResolved(initializer: initializer, services: a, b)
       return initializer(a!, b!)
   } as (ResolverType, Arg1, Arg2) -> Service)
}

/** Registers a factory that resolves the Service based on dependencies infered from the Service initializer.
 
 Usage: `autoregister(MyService.self), initializer: MyService.init`
 - Parameters:
    - service: Registered service type
    - name: Optional name of the service

    - initializer: Initializer of the registered service
 - Returns: The registered service entry 
 - Important: Might fail if one of the dependencies is unresolvable.
 */
@discardableResult
public func autoregister<Service, A, B, C>(_ service: Service.Type, name: String? = nil, initializer: @escaping (A, B, C) -> Service) -> ServiceEntry<Service> {
   return self.register(service.self, name: name, factory: { r in 
       let a: A? = r.resolve(); let b: B? = r.resolve(); let c: C? = r.resolve()
       checkResolved(initializer: initializer, services: a, b, c)
       return initializer(a!, b!, c!)
   } as (ResolverType) -> Service)
}

/** Registers a factory that resolves the Service based on dependencies infered from the Service initializer.
 
 Usage: `autoregister(MyService.self, argument: Arg1.self), initializer: MyService.init`
 - Parameters:
    - service: Registered service type
    - name: Optional name of the service
    - argument: Argument type(s) that will be resolved dynamically instead of resolving dependency
    - initializer: Initializer of the registered service
 - Returns: The registered service entry with 1 arguments
 - Important: Might fail if one of the dependencies is unresolvable.
 */
@discardableResult
public func autoregister<Service, A, B, C, Arg1>(_ service: Service.Type, name: String? = nil, argument  arg1: Arg1.Type, initializer: @escaping (A, B, C) -> Service) -> ServiceEntry<Service> {
   return self.register(service.self, name: name, factory: { r, arg1 in 
       let a: A? = r.resolve(argument: arg1); let b: B? = r.resolve(argument: arg1); let c: C? = r.resolve(argument: arg1)
       checkResolved(initializer: initializer, services: a, b, c)
       return initializer(a!, b!, c!)
   } as (ResolverType, Arg1) -> Service)
}

/** Registers a factory that resolves the Service based on dependencies infered from the Service initializer.
 
 Usage: `autoregister(MyService.self, arguments: Arg1.self, Arg2.self), initializer: MyService.init`
 - Parameters:
    - service: Registered service type
    - name: Optional name of the service
    - arguments: Argument type(s) that will be resolved dynamically instead of resolving dependency
    - initializer: Initializer of the registered service
 - Returns: The registered service entry with 2 arguments
 - Important: Might fail if one of the dependencies is unresolvable.
 */
@discardableResult
public func autoregister<Service, A, B, C, Arg1, Arg2>(_ service: Service.Type, name: String? = nil, arguments  arg1: Arg1.Type, _ arg2: Arg2.Type, initializer: @escaping (A, B, C) -> Service) -> ServiceEntry<Service> {
   return self.register(service.self, name: name, factory: { r, arg1, arg2 in 
       let a: A? = r.resolve(arguments: arg1, arg2); let b: B? = r.resolve(arguments: arg1, arg2); let c: C? = r.resolve(arguments: arg1, arg2)
       checkResolved(initializer: initializer, services: a, b, c)
       return initializer(a!, b!, c!)
   } as (ResolverType, Arg1, Arg2) -> Service)
}

/** Registers a factory that resolves the Service based on dependencies infered from the Service initializer.
 
 Usage: `autoregister(MyService.self, arguments: Arg1.self, Arg2.self, Arg3.self), initializer: MyService.init`
 - Parameters:
    - service: Registered service type
    - name: Optional name of the service
    - arguments: Argument type(s) that will be resolved dynamically instead of resolving dependency
    - initializer: Initializer of the registered service
 - Returns: The registered service entry with 3 arguments
 - Important: Might fail if one of the dependencies is unresolvable.
 */
@discardableResult
public func autoregister<Service, A, B, C, Arg1, Arg2, Arg3>(_ service: Service.Type, name: String? = nil, arguments  arg1: Arg1.Type, _ arg2: Arg2.Type, _ arg3: Arg3.Type, initializer: @escaping (A, B, C) -> Service) -> ServiceEntry<Service> {
   return self.register(service.self, name: name, factory: { r, arg1, arg2, arg3 in 
       let a: A? = r.resolve(arguments: arg1, arg2, arg3); let b: B? = r.resolve(arguments: arg1, arg2, arg3); let c: C? = r.resolve(arguments: arg1, arg2, arg3)
       checkResolved(initializer: initializer, services: a, b, c)
       return initializer(a!, b!, c!)
   } as (ResolverType, Arg1, Arg2, Arg3) -> Service)
}

/** Registers a factory that resolves the Service based on dependencies infered from the Service initializer.
 
 Usage: `autoregister(MyService.self), initializer: MyService.init`
 - Parameters:
    - service: Registered service type
    - name: Optional name of the service

    - initializer: Initializer of the registered service
 - Returns: The registered service entry 
 - Important: Might fail if one of the dependencies is unresolvable.
 */
@discardableResult
public func autoregister<Service, A, B, C, D>(_ service: Service.Type, name: String? = nil, initializer: @escaping (A, B, C, D) -> Service) -> ServiceEntry<Service> {
   return self.register(service.self, name: name, factory: { r in 
       let a: A? = r.resolve(); let b: B? = r.resolve(); let c: C? = r.resolve(); let d: D? = r.resolve()
       checkResolved(initializer: initializer, services: a, b, c, d)
       return initializer(a!, b!, c!, d!)
   } as (ResolverType) -> Service)
}

/** Registers a factory that resolves the Service based on dependencies infered from the Service initializer.
 
 Usage: `autoregister(MyService.self, argument: Arg1.self), initializer: MyService.init`
 - Parameters:
    - service: Registered service type
    - name: Optional name of the service
    - argument: Argument type(s) that will be resolved dynamically instead of resolving dependency
    - initializer: Initializer of the registered service
 - Returns: The registered service entry with 1 arguments
 - Important: Might fail if one of the dependencies is unresolvable.
 */
@discardableResult
public func autoregister<Service, A, B, C, D, Arg1>(_ service: Service.Type, name: String? = nil, argument  arg1: Arg1.Type, initializer: @escaping (A, B, C, D) -> Service) -> ServiceEntry<Service> {
   return self.register(service.self, name: name, factory: { r, arg1 in 
       let a: A? = r.resolve(argument: arg1); let b: B? = r.resolve(argument: arg1); let c: C? = r.resolve(argument: arg1); let d: D? = r.resolve(argument: arg1)
       checkResolved(initializer: initializer, services: a, b, c, d)
       return initializer(a!, b!, c!, d!)
   } as (ResolverType, Arg1) -> Service)
}

/** Registers a factory that resolves the Service based on dependencies infered from the Service initializer.
 
 Usage: `autoregister(MyService.self, arguments: Arg1.self, Arg2.self), initializer: MyService.init`
 - Parameters:
    - service: Registered service type
    - name: Optional name of the service
    - arguments: Argument type(s) that will be resolved dynamically instead of resolving dependency
    - initializer: Initializer of the registered service
 - Returns: The registered service entry with 2 arguments
 - Important: Might fail if one of the dependencies is unresolvable.
 */
@discardableResult
public func autoregister<Service, A, B, C, D, Arg1, Arg2>(_ service: Service.Type, name: String? = nil, arguments  arg1: Arg1.Type, _ arg2: Arg2.Type, initializer: @escaping (A, B, C, D) -> Service) -> ServiceEntry<Service> {
   return self.register(service.self, name: name, factory: { r, arg1, arg2 in 
       let a: A? = r.resolve(arguments: arg1, arg2); let b: B? = r.resolve(arguments: arg1, arg2); let c: C? = r.resolve(arguments: arg1, arg2); let d: D? = r.resolve(arguments: arg1, arg2)
       checkResolved(initializer: initializer, services: a, b, c, d)
       return initializer(a!, b!, c!, d!)
   } as (ResolverType, Arg1, Arg2) -> Service)
}

/** Registers a factory that resolves the Service based on dependencies infered from the Service initializer.
 
 Usage: `autoregister(MyService.self, arguments: Arg1.self, Arg2.self, Arg3.self), initializer: MyService.init`
 - Parameters:
    - service: Registered service type
    - name: Optional name of the service
    - arguments: Argument type(s) that will be resolved dynamically instead of resolving dependency
    - initializer: Initializer of the registered service
 - Returns: The registered service entry with 3 arguments
 - Important: Might fail if one of the dependencies is unresolvable.
 */
@discardableResult
public func autoregister<Service, A, B, C, D, Arg1, Arg2, Arg3>(_ service: Service.Type, name: String? = nil, arguments  arg1: Arg1.Type, _ arg2: Arg2.Type, _ arg3: Arg3.Type, initializer: @escaping (A, B, C, D) -> Service) -> ServiceEntry<Service> {
   return self.register(service.self, name: name, factory: { r, arg1, arg2, arg3 in 
       let a: A? = r.resolve(arguments: arg1, arg2, arg3); let b: B? = r.resolve(arguments: arg1, arg2, arg3); let c: C? = r.resolve(arguments: arg1, arg2, arg3); let d: D? = r.resolve(arguments: arg1, arg2, arg3)
       checkResolved(initializer: initializer, services: a, b, c, d)
       return initializer(a!, b!, c!, d!)
   } as (ResolverType, Arg1, Arg2, Arg3) -> Service)
}

/** Registers a factory that resolves the Service based on dependencies infered from the Service initializer.
 
 Usage: `autoregister(MyService.self), initializer: MyService.init`
 - Parameters:
    - service: Registered service type
    - name: Optional name of the service

    - initializer: Initializer of the registered service
 - Returns: The registered service entry 
 - Important: Might fail if one of the dependencies is unresolvable.
 */
@discardableResult
public func autoregister<Service, A, B, C, D, E>(_ service: Service.Type, name: String? = nil, initializer: @escaping (A, B, C, D, E) -> Service) -> ServiceEntry<Service> {
   return self.register(service.self, name: name, factory: { r in 
       let a: A? = r.resolve(); let b: B? = r.resolve(); let c: C? = r.resolve(); let d: D? = r.resolve(); let e: E? = r.resolve()
       checkResolved(initializer: initializer, services: a, b, c, d, e)
       return initializer(a!, b!, c!, d!, e!)
   } as (ResolverType) -> Service)
}

/** Registers a factory that resolves the Service based on dependencies infered from the Service initializer.
 
 Usage: `autoregister(MyService.self, argument: Arg1.self), initializer: MyService.init`
 - Parameters:
    - service: Registered service type
    - name: Optional name of the service
    - argument: Argument type(s) that will be resolved dynamically instead of resolving dependency
    - initializer: Initializer of the registered service
 - Returns: The registered service entry with 1 arguments
 - Important: Might fail if one of the dependencies is unresolvable.
 */
@discardableResult
public func autoregister<Service, A, B, C, D, E, Arg1>(_ service: Service.Type, name: String? = nil, argument  arg1: Arg1.Type, initializer: @escaping (A, B, C, D, E) -> Service) -> ServiceEntry<Service> {
   return self.register(service.self, name: name, factory: { r, arg1 in 
       let a: A? = r.resolve(argument: arg1); let b: B? = r.resolve(argument: arg1); let c: C? = r.resolve(argument: arg1); let d: D? = r.resolve(argument: arg1); let e: E? = r.resolve(argument: arg1)
       checkResolved(initializer: initializer, services: a, b, c, d, e)
       return initializer(a!, b!, c!, d!, e!)
   } as (ResolverType, Arg1) -> Service)
}

/** Registers a factory that resolves the Service based on dependencies infered from the Service initializer.
 
 Usage: `autoregister(MyService.self, arguments: Arg1.self, Arg2.self), initializer: MyService.init`
 - Parameters:
    - service: Registered service type
    - name: Optional name of the service
    - arguments: Argument type(s) that will be resolved dynamically instead of resolving dependency
    - initializer: Initializer of the registered service
 - Returns: The registered service entry with 2 arguments
 - Important: Might fail if one of the dependencies is unresolvable.
 */
@discardableResult
public func autoregister<Service, A, B, C, D, E, Arg1, Arg2>(_ service: Service.Type, name: String? = nil, arguments  arg1: Arg1.Type, _ arg2: Arg2.Type, initializer: @escaping (A, B, C, D, E) -> Service) -> ServiceEntry<Service> {
   return self.register(service.self, name: name, factory: { r, arg1, arg2 in 
       let a: A? = r.resolve(arguments: arg1, arg2); let b: B? = r.resolve(arguments: arg1, arg2); let c: C? = r.resolve(arguments: arg1, arg2); let d: D? = r.resolve(arguments: arg1, arg2); let e: E? = r.resolve(arguments: arg1, arg2)
       checkResolved(initializer: initializer, services: a, b, c, d, e)
       return initializer(a!, b!, c!, d!, e!)
   } as (ResolverType, Arg1, Arg2) -> Service)
}

/** Registers a factory that resolves the Service based on dependencies infered from the Service initializer.
 
 Usage: `autoregister(MyService.self, arguments: Arg1.self, Arg2.self, Arg3.self), initializer: MyService.init`
 - Parameters:
    - service: Registered service type
    - name: Optional name of the service
    - arguments: Argument type(s) that will be resolved dynamically instead of resolving dependency
    - initializer: Initializer of the registered service
 - Returns: The registered service entry with 3 arguments
 - Important: Might fail if one of the dependencies is unresolvable.
 */
@discardableResult
public func autoregister<Service, A, B, C, D, E, Arg1, Arg2, Arg3>(_ service: Service.Type, name: String? = nil, arguments  arg1: Arg1.Type, _ arg2: Arg2.Type, _ arg3: Arg3.Type, initializer: @escaping (A, B, C, D, E) -> Service) -> ServiceEntry<Service> {
   return self.register(service.self, name: name, factory: { r, arg1, arg2, arg3 in 
       let a: A? = r.resolve(arguments: arg1, arg2, arg3); let b: B? = r.resolve(arguments: arg1, arg2, arg3); let c: C? = r.resolve(arguments: arg1, arg2, arg3); let d: D? = r.resolve(arguments: arg1, arg2, arg3); let e: E? = r.resolve(arguments: arg1, arg2, arg3)
       checkResolved(initializer: initializer, services: a, b, c, d, e)
       return initializer(a!, b!, c!, d!, e!)
   } as (ResolverType, Arg1, Arg2, Arg3) -> Service)
}

/** Registers a factory that resolves the Service based on dependencies infered from the Service initializer.
 
 Usage: `autoregister(MyService.self), initializer: MyService.init`
 - Parameters:
    - service: Registered service type
    - name: Optional name of the service

    - initializer: Initializer of the registered service
 - Returns: The registered service entry 
 - Important: Might fail if one of the dependencies is unresolvable.
 */
@discardableResult
public func autoregister<Service, A, B, C, D, E, F>(_ service: Service.Type, name: String? = nil, initializer: @escaping (A, B, C, D, E, F) -> Service) -> ServiceEntry<Service> {
   return self.register(service.self, name: name, factory: { r in 
       let a: A? = r.resolve(); let b: B? = r.resolve(); let c: C? = r.resolve(); let d: D? = r.resolve(); let e: E? = r.resolve(); let f: F? = r.resolve()
       checkResolved(initializer: initializer, services: a, b, c, d, e, f)
       return initializer(a!, b!, c!, d!, e!, f!)
   } as (ResolverType) -> Service)
}

/** Registers a factory that resolves the Service based on dependencies infered from the Service initializer.
 
 Usage: `autoregister(MyService.self, argument: Arg1.self), initializer: MyService.init`
 - Parameters:
    - service: Registered service type
    - name: Optional name of the service
    - argument: Argument type(s) that will be resolved dynamically instead of resolving dependency
    - initializer: Initializer of the registered service
 - Returns: The registered service entry with 1 arguments
 - Important: Might fail if one of the dependencies is unresolvable.
 */
@discardableResult
public func autoregister<Service, A, B, C, D, E, F, Arg1>(_ service: Service.Type, name: String? = nil, argument  arg1: Arg1.Type, initializer: @escaping (A, B, C, D, E, F) -> Service) -> ServiceEntry<Service> {
   return self.register(service.self, name: name, factory: { r, arg1 in 
       let a: A? = r.resolve(argument: arg1); let b: B? = r.resolve(argument: arg1); let c: C? = r.resolve(argument: arg1); let d: D? = r.resolve(argument: arg1); let e: E? = r.resolve(argument: arg1); let f: F? = r.resolve(argument: arg1)
       checkResolved(initializer: initializer, services: a, b, c, d, e, f)
       return initializer(a!, b!, c!, d!, e!, f!)
   } as (ResolverType, Arg1) -> Service)
}

/** Registers a factory that resolves the Service based on dependencies infered from the Service initializer.
 
 Usage: `autoregister(MyService.self, arguments: Arg1.self, Arg2.self), initializer: MyService.init`
 - Parameters:
    - service: Registered service type
    - name: Optional name of the service
    - arguments: Argument type(s) that will be resolved dynamically instead of resolving dependency
    - initializer: Initializer of the registered service
 - Returns: The registered service entry with 2 arguments
 - Important: Might fail if one of the dependencies is unresolvable.
 */
@discardableResult
public func autoregister<Service, A, B, C, D, E, F, Arg1, Arg2>(_ service: Service.Type, name: String? = nil, arguments  arg1: Arg1.Type, _ arg2: Arg2.Type, initializer: @escaping (A, B, C, D, E, F) -> Service) -> ServiceEntry<Service> {
   return self.register(service.self, name: name, factory: { r, arg1, arg2 in 
       let a: A? = r.resolve(arguments: arg1, arg2); let b: B? = r.resolve(arguments: arg1, arg2); let c: C? = r.resolve(arguments: arg1, arg2); let d: D? = r.resolve(arguments: arg1, arg2); let e: E? = r.resolve(arguments: arg1, arg2); let f: F? = r.resolve(arguments: arg1, arg2)
       checkResolved(initializer: initializer, services: a, b, c, d, e, f)
       return initializer(a!, b!, c!, d!, e!, f!)
   } as (ResolverType, Arg1, Arg2) -> Service)
}

/** Registers a factory that resolves the Service based on dependencies infered from the Service initializer.
 
 Usage: `autoregister(MyService.self, arguments: Arg1.self, Arg2.self, Arg3.self), initializer: MyService.init`
 - Parameters:
    - service: Registered service type
    - name: Optional name of the service
    - arguments: Argument type(s) that will be resolved dynamically instead of resolving dependency
    - initializer: Initializer of the registered service
 - Returns: The registered service entry with 3 arguments
 - Important: Might fail if one of the dependencies is unresolvable.
 */
@discardableResult
public func autoregister<Service, A, B, C, D, E, F, Arg1, Arg2, Arg3>(_ service: Service.Type, name: String? = nil, arguments  arg1: Arg1.Type, _ arg2: Arg2.Type, _ arg3: Arg3.Type, initializer: @escaping (A, B, C, D, E, F) -> Service) -> ServiceEntry<Service> {
   return self.register(service.self, name: name, factory: { r, arg1, arg2, arg3 in 
       let a: A? = r.resolve(arguments: arg1, arg2, arg3); let b: B? = r.resolve(arguments: arg1, arg2, arg3); let c: C? = r.resolve(arguments: arg1, arg2, arg3); let d: D? = r.resolve(arguments: arg1, arg2, arg3); let e: E? = r.resolve(arguments: arg1, arg2, arg3); let f: F? = r.resolve(arguments: arg1, arg2, arg3)
       checkResolved(initializer: initializer, services: a, b, c, d, e, f)
       return initializer(a!, b!, c!, d!, e!, f!)
   } as (ResolverType, Arg1, Arg2, Arg3) -> Service)
}

/** Registers a factory that resolves the Service based on dependencies infered from the Service initializer.
 
 Usage: `autoregister(MyService.self), initializer: MyService.init`
 - Parameters:
    - service: Registered service type
    - name: Optional name of the service

    - initializer: Initializer of the registered service
 - Returns: The registered service entry 
 - Important: Might fail if one of the dependencies is unresolvable.
 */
@discardableResult
public func autoregister<Service, A, B, C, D, E, F, G>(_ service: Service.Type, name: String? = nil, initializer: @escaping (A, B, C, D, E, F, G) -> Service) -> ServiceEntry<Service> {
   return self.register(service.self, name: name, factory: { r in 
       let a: A? = r.resolve(); let b: B? = r.resolve(); let c: C? = r.resolve(); let d: D? = r.resolve(); let e: E? = r.resolve(); let f: F? = r.resolve(); let g: G? = r.resolve()
       checkResolved(initializer: initializer, services: a, b, c, d, e, f, g)
       return initializer(a!, b!, c!, d!, e!, f!, g!)
   } as (ResolverType) -> Service)
}

/** Registers a factory that resolves the Service based on dependencies infered from the Service initializer.
 
 Usage: `autoregister(MyService.self, argument: Arg1.self), initializer: MyService.init`
 - Parameters:
    - service: Registered service type
    - name: Optional name of the service
    - argument: Argument type(s) that will be resolved dynamically instead of resolving dependency
    - initializer: Initializer of the registered service
 - Returns: The registered service entry with 1 arguments
 - Important: Might fail if one of the dependencies is unresolvable.
 */
@discardableResult
public func autoregister<Service, A, B, C, D, E, F, G, Arg1>(_ service: Service.Type, name: String? = nil, argument  arg1: Arg1.Type, initializer: @escaping (A, B, C, D, E, F, G) -> Service) -> ServiceEntry<Service> {
   return self.register(service.self, name: name, factory: { r, arg1 in 
       let a: A? = r.resolve(argument: arg1); let b: B? = r.resolve(argument: arg1); let c: C? = r.resolve(argument: arg1); let d: D? = r.resolve(argument: arg1); let e: E? = r.resolve(argument: arg1); let f: F? = r.resolve(argument: arg1); let g: G? = r.resolve(argument: arg1)
       checkResolved(initializer: initializer, services: a, b, c, d, e, f, g)
       return initializer(a!, b!, c!, d!, e!, f!, g!)
   } as (ResolverType, Arg1) -> Service)
}

/** Registers a factory that resolves the Service based on dependencies infered from the Service initializer.
 
 Usage: `autoregister(MyService.self, arguments: Arg1.self, Arg2.self), initializer: MyService.init`
 - Parameters:
    - service: Registered service type
    - name: Optional name of the service
    - arguments: Argument type(s) that will be resolved dynamically instead of resolving dependency
    - initializer: Initializer of the registered service
 - Returns: The registered service entry with 2 arguments
 - Important: Might fail if one of the dependencies is unresolvable.
 */
@discardableResult
public func autoregister<Service, A, B, C, D, E, F, G, Arg1, Arg2>(_ service: Service.Type, name: String? = nil, arguments  arg1: Arg1.Type, _ arg2: Arg2.Type, initializer: @escaping (A, B, C, D, E, F, G) -> Service) -> ServiceEntry<Service> {
   return self.register(service.self, name: name, factory: { r, arg1, arg2 in 
       let a: A? = r.resolve(arguments: arg1, arg2); let b: B? = r.resolve(arguments: arg1, arg2); let c: C? = r.resolve(arguments: arg1, arg2); let d: D? = r.resolve(arguments: arg1, arg2); let e: E? = r.resolve(arguments: arg1, arg2); let f: F? = r.resolve(arguments: arg1, arg2); let g: G? = r.resolve(arguments: arg1, arg2)
       checkResolved(initializer: initializer, services: a, b, c, d, e, f, g)
       return initializer(a!, b!, c!, d!, e!, f!, g!)
   } as (ResolverType, Arg1, Arg2) -> Service)
}

/** Registers a factory that resolves the Service based on dependencies infered from the Service initializer.
 
 Usage: `autoregister(MyService.self, arguments: Arg1.self, Arg2.self, Arg3.self), initializer: MyService.init`
 - Parameters:
    - service: Registered service type
    - name: Optional name of the service
    - arguments: Argument type(s) that will be resolved dynamically instead of resolving dependency
    - initializer: Initializer of the registered service
 - Returns: The registered service entry with 3 arguments
 - Important: Might fail if one of the dependencies is unresolvable.
 */
@discardableResult
public func autoregister<Service, A, B, C, D, E, F, G, Arg1, Arg2, Arg3>(_ service: Service.Type, name: String? = nil, arguments  arg1: Arg1.Type, _ arg2: Arg2.Type, _ arg3: Arg3.Type, initializer: @escaping (A, B, C, D, E, F, G) -> Service) -> ServiceEntry<Service> {
   return self.register(service.self, name: name, factory: { r, arg1, arg2, arg3 in 
       let a: A? = r.resolve(arguments: arg1, arg2, arg3); let b: B? = r.resolve(arguments: arg1, arg2, arg3); let c: C? = r.resolve(arguments: arg1, arg2, arg3); let d: D? = r.resolve(arguments: arg1, arg2, arg3); let e: E? = r.resolve(arguments: arg1, arg2, arg3); let f: F? = r.resolve(arguments: arg1, arg2, arg3); let g: G? = r.resolve(arguments: arg1, arg2, arg3)
       checkResolved(initializer: initializer, services: a, b, c, d, e, f, g)
       return initializer(a!, b!, c!, d!, e!, f!, g!)
   } as (ResolverType, Arg1, Arg2, Arg3) -> Service)
}

/** Registers a factory that resolves the Service based on dependencies infered from the Service initializer.
 
 Usage: `autoregister(MyService.self), initializer: MyService.init`
 - Parameters:
    - service: Registered service type
    - name: Optional name of the service

    - initializer: Initializer of the registered service
 - Returns: The registered service entry 
 - Important: Might fail if one of the dependencies is unresolvable.
 */
@discardableResult
public func autoregister<Service, A, B, C, D, E, F, G, H>(_ service: Service.Type, name: String? = nil, initializer: @escaping (A, B, C, D, E, F, G, H) -> Service) -> ServiceEntry<Service> {
   return self.register(service.self, name: name, factory: { r in 
       let a: A? = r.resolve(); let b: B? = r.resolve(); let c: C? = r.resolve(); let d: D? = r.resolve(); let e: E? = r.resolve(); let f: F? = r.resolve(); let g: G? = r.resolve(); let h: H? = r.resolve()
       checkResolved(initializer: initializer, services: a, b, c, d, e, f, g, h)
       return initializer(a!, b!, c!, d!, e!, f!, g!, h!)
   } as (ResolverType) -> Service)
}

/** Registers a factory that resolves the Service based on dependencies infered from the Service initializer.
 
 Usage: `autoregister(MyService.self, argument: Arg1.self), initializer: MyService.init`
 - Parameters:
    - service: Registered service type
    - name: Optional name of the service
    - argument: Argument type(s) that will be resolved dynamically instead of resolving dependency
    - initializer: Initializer of the registered service
 - Returns: The registered service entry with 1 arguments
 - Important: Might fail if one of the dependencies is unresolvable.
 */
@discardableResult
public func autoregister<Service, A, B, C, D, E, F, G, H, Arg1>(_ service: Service.Type, name: String? = nil, argument  arg1: Arg1.Type, initializer: @escaping (A, B, C, D, E, F, G, H) -> Service) -> ServiceEntry<Service> {
   return self.register(service.self, name: name, factory: { r, arg1 in 
       let a: A? = r.resolve(argument: arg1); let b: B? = r.resolve(argument: arg1); let c: C? = r.resolve(argument: arg1); let d: D? = r.resolve(argument: arg1); let e: E? = r.resolve(argument: arg1); let f: F? = r.resolve(argument: arg1); let g: G? = r.resolve(argument: arg1); let h: H? = r.resolve(argument: arg1)
       checkResolved(initializer: initializer, services: a, b, c, d, e, f, g, h)
       return initializer(a!, b!, c!, d!, e!, f!, g!, h!)
   } as (ResolverType, Arg1) -> Service)
}

/** Registers a factory that resolves the Service based on dependencies infered from the Service initializer.
 
 Usage: `autoregister(MyService.self, arguments: Arg1.self, Arg2.self), initializer: MyService.init`
 - Parameters:
    - service: Registered service type
    - name: Optional name of the service
    - arguments: Argument type(s) that will be resolved dynamically instead of resolving dependency
    - initializer: Initializer of the registered service
 - Returns: The registered service entry with 2 arguments
 - Important: Might fail if one of the dependencies is unresolvable.
 */
@discardableResult
public func autoregister<Service, A, B, C, D, E, F, G, H, Arg1, Arg2>(_ service: Service.Type, name: String? = nil, arguments  arg1: Arg1.Type, _ arg2: Arg2.Type, initializer: @escaping (A, B, C, D, E, F, G, H) -> Service) -> ServiceEntry<Service> {
   return self.register(service.self, name: name, factory: { r, arg1, arg2 in 
       let a: A? = r.resolve(arguments: arg1, arg2); let b: B? = r.resolve(arguments: arg1, arg2); let c: C? = r.resolve(arguments: arg1, arg2); let d: D? = r.resolve(arguments: arg1, arg2); let e: E? = r.resolve(arguments: arg1, arg2); let f: F? = r.resolve(arguments: arg1, arg2); let g: G? = r.resolve(arguments: arg1, arg2); let h: H? = r.resolve(arguments: arg1, arg2)
       checkResolved(initializer: initializer, services: a, b, c, d, e, f, g, h)
       return initializer(a!, b!, c!, d!, e!, f!, g!, h!)
   } as (ResolverType, Arg1, Arg2) -> Service)
}

/** Registers a factory that resolves the Service based on dependencies infered from the Service initializer.
 
 Usage: `autoregister(MyService.self, arguments: Arg1.self, Arg2.self, Arg3.self), initializer: MyService.init`
 - Parameters:
    - service: Registered service type
    - name: Optional name of the service
    - arguments: Argument type(s) that will be resolved dynamically instead of resolving dependency
    - initializer: Initializer of the registered service
 - Returns: The registered service entry with 3 arguments
 - Important: Might fail if one of the dependencies is unresolvable.
 */
@discardableResult
public func autoregister<Service, A, B, C, D, E, F, G, H, Arg1, Arg2, Arg3>(_ service: Service.Type, name: String? = nil, arguments  arg1: Arg1.Type, _ arg2: Arg2.Type, _ arg3: Arg3.Type, initializer: @escaping (A, B, C, D, E, F, G, H) -> Service) -> ServiceEntry<Service> {
   return self.register(service.self, name: name, factory: { r, arg1, arg2, arg3 in 
       let a: A? = r.resolve(arguments: arg1, arg2, arg3); let b: B? = r.resolve(arguments: arg1, arg2, arg3); let c: C? = r.resolve(arguments: arg1, arg2, arg3); let d: D? = r.resolve(arguments: arg1, arg2, arg3); let e: E? = r.resolve(arguments: arg1, arg2, arg3); let f: F? = r.resolve(arguments: arg1, arg2, arg3); let g: G? = r.resolve(arguments: arg1, arg2, arg3); let h: H? = r.resolve(arguments: arg1, arg2, arg3)
       checkResolved(initializer: initializer, services: a, b, c, d, e, f, g, h)
       return initializer(a!, b!, c!, d!, e!, f!, g!, h!)
   } as (ResolverType, Arg1, Arg2, Arg3) -> Service)
}

/** Registers a factory that resolves the Service based on dependencies infered from the Service initializer.
 
 Usage: `autoregister(MyService.self), initializer: MyService.init`
 - Parameters:
    - service: Registered service type
    - name: Optional name of the service

    - initializer: Initializer of the registered service
 - Returns: The registered service entry 
 - Important: Might fail if one of the dependencies is unresolvable.
 */
@discardableResult
public func autoregister<Service, A, B, C, D, E, F, G, H, I>(_ service: Service.Type, name: String? = nil, initializer: @escaping (A, B, C, D, E, F, G, H, I) -> Service) -> ServiceEntry<Service> {
   return self.register(service.self, name: name, factory: { r in 
       let a: A? = r.resolve(); let b: B? = r.resolve(); let c: C? = r.resolve(); let d: D? = r.resolve(); let e: E? = r.resolve(); let f: F? = r.resolve(); let g: G? = r.resolve(); let h: H? = r.resolve(); let i: I? = r.resolve()
       checkResolved(initializer: initializer, services: a, b, c, d, e, f, g, h, i)
       return initializer(a!, b!, c!, d!, e!, f!, g!, h!, i!)
   } as (ResolverType) -> Service)
}

/** Registers a factory that resolves the Service based on dependencies infered from the Service initializer.
 
 Usage: `autoregister(MyService.self, argument: Arg1.self), initializer: MyService.init`
 - Parameters:
    - service: Registered service type
    - name: Optional name of the service
    - argument: Argument type(s) that will be resolved dynamically instead of resolving dependency
    - initializer: Initializer of the registered service
 - Returns: The registered service entry with 1 arguments
 - Important: Might fail if one of the dependencies is unresolvable.
 */
@discardableResult
public func autoregister<Service, A, B, C, D, E, F, G, H, I, Arg1>(_ service: Service.Type, name: String? = nil, argument  arg1: Arg1.Type, initializer: @escaping (A, B, C, D, E, F, G, H, I) -> Service) -> ServiceEntry<Service> {
   return self.register(service.self, name: name, factory: { r, arg1 in 
       let a: A? = r.resolve(argument: arg1); let b: B? = r.resolve(argument: arg1); let c: C? = r.resolve(argument: arg1); let d: D? = r.resolve(argument: arg1); let e: E? = r.resolve(argument: arg1); let f: F? = r.resolve(argument: arg1); let g: G? = r.resolve(argument: arg1); let h: H? = r.resolve(argument: arg1); let i: I? = r.resolve(argument: arg1)
       checkResolved(initializer: initializer, services: a, b, c, d, e, f, g, h, i)
       return initializer(a!, b!, c!, d!, e!, f!, g!, h!, i!)
   } as (ResolverType, Arg1) -> Service)
}

/** Registers a factory that resolves the Service based on dependencies infered from the Service initializer.
 
 Usage: `autoregister(MyService.self, arguments: Arg1.self, Arg2.self), initializer: MyService.init`
 - Parameters:
    - service: Registered service type
    - name: Optional name of the service
    - arguments: Argument type(s) that will be resolved dynamically instead of resolving dependency
    - initializer: Initializer of the registered service
 - Returns: The registered service entry with 2 arguments
 - Important: Might fail if one of the dependencies is unresolvable.
 */
@discardableResult
public func autoregister<Service, A, B, C, D, E, F, G, H, I, Arg1, Arg2>(_ service: Service.Type, name: String? = nil, arguments  arg1: Arg1.Type, _ arg2: Arg2.Type, initializer: @escaping (A, B, C, D, E, F, G, H, I) -> Service) -> ServiceEntry<Service> {
   return self.register(service.self, name: name, factory: { r, arg1, arg2 in 
       let a: A? = r.resolve(arguments: arg1, arg2); let b: B? = r.resolve(arguments: arg1, arg2); let c: C? = r.resolve(arguments: arg1, arg2); let d: D? = r.resolve(arguments: arg1, arg2); let e: E? = r.resolve(arguments: arg1, arg2); let f: F? = r.resolve(arguments: arg1, arg2); let g: G? = r.resolve(arguments: arg1, arg2); let h: H? = r.resolve(arguments: arg1, arg2); let i: I? = r.resolve(arguments: arg1, arg2)
       checkResolved(initializer: initializer, services: a, b, c, d, e, f, g, h, i)
       return initializer(a!, b!, c!, d!, e!, f!, g!, h!, i!)
   } as (ResolverType, Arg1, Arg2) -> Service)
}

/** Registers a factory that resolves the Service based on dependencies infered from the Service initializer.
 
 Usage: `autoregister(MyService.self, arguments: Arg1.self, Arg2.self, Arg3.self), initializer: MyService.init`
 - Parameters:
    - service: Registered service type
    - name: Optional name of the service
    - arguments: Argument type(s) that will be resolved dynamically instead of resolving dependency
    - initializer: Initializer of the registered service
 - Returns: The registered service entry with 3 arguments
 - Important: Might fail if one of the dependencies is unresolvable.
 */
@discardableResult
public func autoregister<Service, A, B, C, D, E, F, G, H, I, Arg1, Arg2, Arg3>(_ service: Service.Type, name: String? = nil, arguments  arg1: Arg1.Type, _ arg2: Arg2.Type, _ arg3: Arg3.Type, initializer: @escaping (A, B, C, D, E, F, G, H, I) -> Service) -> ServiceEntry<Service> {
   return self.register(service.self, name: name, factory: { r, arg1, arg2, arg3 in 
       let a: A? = r.resolve(arguments: arg1, arg2, arg3); let b: B? = r.resolve(arguments: arg1, arg2, arg3); let c: C? = r.resolve(arguments: arg1, arg2, arg3); let d: D? = r.resolve(arguments: arg1, arg2, arg3); let e: E? = r.resolve(arguments: arg1, arg2, arg3); let f: F? = r.resolve(arguments: arg1, arg2, arg3); let g: G? = r.resolve(arguments: arg1, arg2, arg3); let h: H? = r.resolve(arguments: arg1, arg2, arg3); let i: I? = r.resolve(arguments: arg1, arg2, arg3)
       checkResolved(initializer: initializer, services: a, b, c, d, e, f, g, h, i)
       return initializer(a!, b!, c!, d!, e!, f!, g!, h!, i!)
   } as (ResolverType, Arg1, Arg2, Arg3) -> Service)
}


}
public extension ResolverType {


    fileprivate func resolve<Service>() -> Service? {
       return self.resolve(Service.self)
    }

    fileprivate func resolve<Service, Arg1>(argument  arg1: Arg1) -> Service? {
       return (arg1 as? Service) ?? self.resolve(Service.self)
    }

    fileprivate func resolve<Service, Arg1, Arg2>(arguments  arg1: Arg1, _ arg2: Arg2) -> Service? {
       return (arg1 as? Service) ?? (arg2 as? Service) ?? self.resolve(Service.self)
    }

    fileprivate func resolve<Service, Arg1, Arg2, Arg3>(arguments  arg1: Arg1, _ arg2: Arg2, _ arg3: Arg3) -> Service? {
       return (arg1 as? Service) ?? (arg2 as? Service) ?? (arg3 as? Service) ?? self.resolve(Service.self)
    }
}


fileprivate func unresolvedService<A>(_ a: A?) -> String? {
   return ( a == nil ? "\(A.self)" : nil )
}

fileprivate func checkResolved<Service, A>(initializer: (A) -> Service, services a: A?){
   let unresolved = ( [a] as [Any?] ).filter { $0 == nil }
   if unresolved.count > 0 {
       fatalError("Failed to resolve \(unresolvedService(a)!), initializer: (\(A.self)) -> \(Service.self)")
   }
}

fileprivate func unresolvedService<A, B>(_ a: A?, _ b: B?) -> String? {
   return unresolvedService(a) ?? ( b == nil ? "\(B.self)" : nil )
}

fileprivate func checkResolved<Service, A, B>(initializer: (A, B) -> Service, services a: A?, _ b: B?){
   let unresolved = ( [a, b] as [Any?] ).filter { $0 == nil }
   if unresolved.count > 0 {
       fatalError("Failed to resolve \(unresolvedService(a, b)!), initializer: (\(A.self), \(B.self)) -> \(Service.self)")
   }
}

fileprivate func unresolvedService<A, B, C>(_ a: A?, _ b: B?, _ c: C?) -> String? {
   return unresolvedService(a, b) ?? ( c == nil ? "\(C.self)" : nil )
}

fileprivate func checkResolved<Service, A, B, C>(initializer: (A, B, C) -> Service, services a: A?, _ b: B?, _ c: C?){
   let unresolved = ( [a, b, c] as [Any?] ).filter { $0 == nil }
   if unresolved.count > 0 {
       fatalError("Failed to resolve \(unresolvedService(a, b, c)!), initializer: (\(A.self), \(B.self), \(C.self)) -> \(Service.self)")
   }
}

fileprivate func unresolvedService<A, B, C, D>(_ a: A?, _ b: B?, _ c: C?, _ d: D?) -> String? {
   return unresolvedService(a, b, c) ?? ( d == nil ? "\(D.self)" : nil )
}

fileprivate func checkResolved<Service, A, B, C, D>(initializer: (A, B, C, D) -> Service, services a: A?, _ b: B?, _ c: C?, _ d: D?){
   let unresolved = ( [a, b, c, d] as [Any?] ).filter { $0 == nil }
   if unresolved.count > 0 {
       fatalError("Failed to resolve \(unresolvedService(a, b, c, d)!), initializer: (\(A.self), \(B.self), \(C.self), \(D.self)) -> \(Service.self)")
   }
}

fileprivate func unresolvedService<A, B, C, D, E>(_ a: A?, _ b: B?, _ c: C?, _ d: D?, _ e: E?) -> String? {
   return unresolvedService(a, b, c, d) ?? ( e == nil ? "\(E.self)" : nil )
}

fileprivate func checkResolved<Service, A, B, C, D, E>(initializer: (A, B, C, D, E) -> Service, services a: A?, _ b: B?, _ c: C?, _ d: D?, _ e: E?){
   let unresolved = ( [a, b, c, d, e] as [Any?] ).filter { $0 == nil }
   if unresolved.count > 0 {
       fatalError("Failed to resolve \(unresolvedService(a, b, c, d, e)!), initializer: (\(A.self), \(B.self), \(C.self), \(D.self), \(E.self)) -> \(Service.self)")
   }
}

fileprivate func unresolvedService<A, B, C, D, E, F>(_ a: A?, _ b: B?, _ c: C?, _ d: D?, _ e: E?, _ f: F?) -> String? {
   return unresolvedService(a, b, c, d, e) ?? ( f == nil ? "\(F.self)" : nil )
}

fileprivate func checkResolved<Service, A, B, C, D, E, F>(initializer: (A, B, C, D, E, F) -> Service, services a: A?, _ b: B?, _ c: C?, _ d: D?, _ e: E?, _ f: F?){
   let unresolved = ( [a, b, c, d, e, f] as [Any?] ).filter { $0 == nil }
   if unresolved.count > 0 {
       fatalError("Failed to resolve \(unresolvedService(a, b, c, d, e, f)!), initializer: (\(A.self), \(B.self), \(C.self), \(D.self), \(E.self), \(F.self)) -> \(Service.self)")
   }
}

fileprivate func unresolvedService<A, B, C, D, E, F, G>(_ a: A?, _ b: B?, _ c: C?, _ d: D?, _ e: E?, _ f: F?, _ g: G?) -> String? {
   return unresolvedService(a, b, c, d, e, f) ?? ( g == nil ? "\(G.self)" : nil )
}

fileprivate func checkResolved<Service, A, B, C, D, E, F, G>(initializer: (A, B, C, D, E, F, G) -> Service, services a: A?, _ b: B?, _ c: C?, _ d: D?, _ e: E?, _ f: F?, _ g: G?){
   let unresolved = ( [a, b, c, d, e, f, g] as [Any?] ).filter { $0 == nil }
   if unresolved.count > 0 {
       fatalError("Failed to resolve \(unresolvedService(a, b, c, d, e, f, g)!), initializer: (\(A.self), \(B.self), \(C.self), \(D.self), \(E.self), \(F.self), \(G.self)) -> \(Service.self)")
   }
}

fileprivate func unresolvedService<A, B, C, D, E, F, G, H>(_ a: A?, _ b: B?, _ c: C?, _ d: D?, _ e: E?, _ f: F?, _ g: G?, _ h: H?) -> String? {
   return unresolvedService(a, b, c, d, e, f, g) ?? ( h == nil ? "\(H.self)" : nil )
}

fileprivate func checkResolved<Service, A, B, C, D, E, F, G, H>(initializer: (A, B, C, D, E, F, G, H) -> Service, services a: A?, _ b: B?, _ c: C?, _ d: D?, _ e: E?, _ f: F?, _ g: G?, _ h: H?){
   let unresolved = ( [a, b, c, d, e, f, g, h] as [Any?] ).filter { $0 == nil }
   if unresolved.count > 0 {
       fatalError("Failed to resolve \(unresolvedService(a, b, c, d, e, f, g, h)!), initializer: (\(A.self), \(B.self), \(C.self), \(D.self), \(E.self), \(F.self), \(G.self), \(H.self)) -> \(Service.self)")
   }
}

fileprivate func unresolvedService<A, B, C, D, E, F, G, H, I>(_ a: A?, _ b: B?, _ c: C?, _ d: D?, _ e: E?, _ f: F?, _ g: G?, _ h: H?, _ i: I?) -> String? {
   return unresolvedService(a, b, c, d, e, f, g, h) ?? ( i == nil ? "\(I.self)" : nil )
}

fileprivate func checkResolved<Service, A, B, C, D, E, F, G, H, I>(initializer: (A, B, C, D, E, F, G, H, I) -> Service, services a: A?, _ b: B?, _ c: C?, _ d: D?, _ e: E?, _ f: F?, _ g: G?, _ h: H?, _ i: I?){
   let unresolved = ( [a, b, c, d, e, f, g, h, i] as [Any?] ).filter { $0 == nil }
   if unresolved.count > 0 {
       fatalError("Failed to resolve \(unresolvedService(a, b, c, d, e, f, g, h, i)!), initializer: (\(A.self), \(B.self), \(C.self), \(D.self), \(E.self), \(F.self), \(G.self), \(H.self), \(I.self)) -> \(Service.self)")
   }
}