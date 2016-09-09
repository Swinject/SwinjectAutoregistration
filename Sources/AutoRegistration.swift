//
//  Sources/AutoRegistration.swift
//  Swinject
//
//  Generated using Swinject AutoRegistration generator.
//


 import Swinject 


public extension Container {


/** Registers a factory that resolves the Service based on dependencies infered from the Service initializer.
 
 Usage: `register(initializer: MyService.init, service: MyService.self)`
 - Parameters:
    - initializer: Initializer of the registered service
    - service: Registered service type
    - name: Optional name of the service

 - Returns: The registered service entry 
 - Important: Might fail if one of the dependencies is unresolvable.
 */
public func register<Service>(initializer initializer: () -> Service, service: Service.Type, name: String? = nil) -> ServiceEntry<Service> {
   return self.register(service.self, name: name, factory: { r in 
       initializer()
   } as (Resolvable) -> Service)
}

/** Registers a factory that resolves the Service based on dependencies infered from the Service initializer.
 
 Usage: `register(initializer: MyService.init, service: MyService.self)`
 - Parameters:
    - initializer: Initializer of the registered service
    - service: Registered service type
    - name: Optional name of the service

 - Returns: The registered service entry 
 - Important: Might fail if one of the dependencies is unresolvable.
 */
public func register<Service, A>(initializer initializer: (A) -> Service, service: Service.Type, name: String? = nil) -> ServiceEntry<Service> {
   return self.register(service.self, name: name, factory: { r in 
       let a: A? = r.resolve()
       checkResolved(initializer: initializer, services: a)
       return initializer(a!)
   } as (Resolvable) -> Service)
}

/** Registers a factory that resolves the Service based on dependencies infered from the Service initializer.
 
 Usage: `register(initializer: MyService.init, service: MyService.self, argument: Arg1.self)`
 - Parameters:
    - initializer: Initializer of the registered service
    - service: Registered service type
    - name: Optional name of the service
    - argument: Argument type(s) that will be resolved dynamically instead of resolving dependency
 - Returns: The registered service entry with 1 arguments
 - Important: Might fail if one of the dependencies is unresolvable.
 */
public func register<Service, Arg1>(initializer initializer: (Arg1) -> Service, service: Service.Type, name: String? = nil, argument  arg1: Arg1.Type) -> ServiceEntry<Service> {
   return self.register(service.self, name: name, factory: { r, arg1 in 
       let arg1: Arg1? = arg1
       checkResolved(initializer: initializer, services: arg1)
       return initializer(arg1!)
   } as (Resolvable, Arg1) -> Service)
}

/** Registers a factory that resolves the Service based on dependencies infered from the Service initializer.
 
 Usage: `register(initializer: MyService.init, service: MyService.self)`
 - Parameters:
    - initializer: Initializer of the registered service
    - service: Registered service type
    - name: Optional name of the service

 - Returns: The registered service entry 
 - Important: Might fail if one of the dependencies is unresolvable.
 */
public func register<Service, A, B>(initializer initializer: (A, B) -> Service, service: Service.Type, name: String? = nil) -> ServiceEntry<Service> {
   return self.register(service.self, name: name, factory: { r in 
       let a: A? = r.resolve(); let b: B? = r.resolve()
       checkResolved(initializer: initializer, services: a, b)
       return initializer(a!, b!)
   } as (Resolvable) -> Service)
}

/** Registers a factory that resolves the Service based on dependencies infered from the Service initializer.
 
 Usage: `register(initializer: MyService.init, service: MyService.self, argument: Arg1.self)`
 - Parameters:
    - initializer: Initializer of the registered service
    - service: Registered service type
    - name: Optional name of the service
    - argument: Argument type(s) that will be resolved dynamically instead of resolving dependency
 - Returns: The registered service entry with 1 arguments
 - Important: Might fail if one of the dependencies is unresolvable.
 */
public func register<Service, A, B, Arg1>(initializer initializer: (A, B) -> Service, service: Service.Type, name: String? = nil, argument  arg1: Arg1.Type) -> ServiceEntry<Service> {
   return self.register(service.self, name: name, factory: { r, arg1 in 
       let a: A? = r.resolve(argument: arg1); let b: B? = r.resolve(argument: arg1)
       checkResolved(initializer: initializer, services: a, b)
       return initializer(a!, b!)
   } as (Resolvable, Arg1) -> Service)
}

/** Registers a factory that resolves the Service based on dependencies infered from the Service initializer.
 
 Usage: `register(initializer: MyService.init, service: MyService.self, arguments: Arg1.self, Arg2.self)`
 - Parameters:
    - initializer: Initializer of the registered service
    - service: Registered service type
    - name: Optional name of the service
    - arguments: Argument type(s) that will be resolved dynamically instead of resolving dependency
 - Returns: The registered service entry with 2 arguments
 - Important: Might fail if one of the dependencies is unresolvable.
 */
public func register<Service, A, B, Arg1, Arg2>(initializer initializer: (A, B) -> Service, service: Service.Type, name: String? = nil, arguments  arg1: Arg1.Type, _ arg2: Arg2.Type) -> ServiceEntry<Service> {
   return self.register(service.self, name: name, factory: { r, arg1, arg2 in 
       let a: A? = r.resolve(arguments: arg1, arg2); let b: B? = r.resolve(arguments: arg1, arg2)
       checkResolved(initializer: initializer, services: a, b)
       return initializer(a!, b!)
   } as (Resolvable, Arg1, Arg2) -> Service)
}

/** Registers a factory that resolves the Service based on dependencies infered from the Service initializer.
 
 Usage: `register(initializer: MyService.init, service: MyService.self)`
 - Parameters:
    - initializer: Initializer of the registered service
    - service: Registered service type
    - name: Optional name of the service

 - Returns: The registered service entry 
 - Important: Might fail if one of the dependencies is unresolvable.
 */
public func register<Service, A, B, C>(initializer initializer: (A, B, C) -> Service, service: Service.Type, name: String? = nil) -> ServiceEntry<Service> {
   return self.register(service.self, name: name, factory: { r in 
       let a: A? = r.resolve(); let b: B? = r.resolve(); let c: C? = r.resolve()
       checkResolved(initializer: initializer, services: a, b, c)
       return initializer(a!, b!, c!)
   } as (Resolvable) -> Service)
}

/** Registers a factory that resolves the Service based on dependencies infered from the Service initializer.
 
 Usage: `register(initializer: MyService.init, service: MyService.self, argument: Arg1.self)`
 - Parameters:
    - initializer: Initializer of the registered service
    - service: Registered service type
    - name: Optional name of the service
    - argument: Argument type(s) that will be resolved dynamically instead of resolving dependency
 - Returns: The registered service entry with 1 arguments
 - Important: Might fail if one of the dependencies is unresolvable.
 */
public func register<Service, A, B, C, Arg1>(initializer initializer: (A, B, C) -> Service, service: Service.Type, name: String? = nil, argument  arg1: Arg1.Type) -> ServiceEntry<Service> {
   return self.register(service.self, name: name, factory: { r, arg1 in 
       let a: A? = r.resolve(argument: arg1); let b: B? = r.resolve(argument: arg1); let c: C? = r.resolve(argument: arg1)
       checkResolved(initializer: initializer, services: a, b, c)
       return initializer(a!, b!, c!)
   } as (Resolvable, Arg1) -> Service)
}

/** Registers a factory that resolves the Service based on dependencies infered from the Service initializer.
 
 Usage: `register(initializer: MyService.init, service: MyService.self, arguments: Arg1.self, Arg2.self)`
 - Parameters:
    - initializer: Initializer of the registered service
    - service: Registered service type
    - name: Optional name of the service
    - arguments: Argument type(s) that will be resolved dynamically instead of resolving dependency
 - Returns: The registered service entry with 2 arguments
 - Important: Might fail if one of the dependencies is unresolvable.
 */
public func register<Service, A, B, C, Arg1, Arg2>(initializer initializer: (A, B, C) -> Service, service: Service.Type, name: String? = nil, arguments  arg1: Arg1.Type, _ arg2: Arg2.Type) -> ServiceEntry<Service> {
   return self.register(service.self, name: name, factory: { r, arg1, arg2 in 
       let a: A? = r.resolve(arguments: arg1, arg2); let b: B? = r.resolve(arguments: arg1, arg2); let c: C? = r.resolve(arguments: arg1, arg2)
       checkResolved(initializer: initializer, services: a, b, c)
       return initializer(a!, b!, c!)
   } as (Resolvable, Arg1, Arg2) -> Service)
}

/** Registers a factory that resolves the Service based on dependencies infered from the Service initializer.
 
 Usage: `register(initializer: MyService.init, service: MyService.self, arguments: Arg1.self, Arg2.self, Arg3.self)`
 - Parameters:
    - initializer: Initializer of the registered service
    - service: Registered service type
    - name: Optional name of the service
    - arguments: Argument type(s) that will be resolved dynamically instead of resolving dependency
 - Returns: The registered service entry with 3 arguments
 - Important: Might fail if one of the dependencies is unresolvable.
 */
public func register<Service, A, B, C, Arg1, Arg2, Arg3>(initializer initializer: (A, B, C) -> Service, service: Service.Type, name: String? = nil, arguments  arg1: Arg1.Type, _ arg2: Arg2.Type, _ arg3: Arg3.Type) -> ServiceEntry<Service> {
   return self.register(service.self, name: name, factory: { r, arg1, arg2, arg3 in 
       let a: A? = r.resolve(arguments: arg1, arg2, arg3); let b: B? = r.resolve(arguments: arg1, arg2, arg3); let c: C? = r.resolve(arguments: arg1, arg2, arg3)
       checkResolved(initializer: initializer, services: a, b, c)
       return initializer(a!, b!, c!)
   } as (Resolvable, Arg1, Arg2, Arg3) -> Service)
}

/** Registers a factory that resolves the Service based on dependencies infered from the Service initializer.
 
 Usage: `register(initializer: MyService.init, service: MyService.self)`
 - Parameters:
    - initializer: Initializer of the registered service
    - service: Registered service type
    - name: Optional name of the service

 - Returns: The registered service entry 
 - Important: Might fail if one of the dependencies is unresolvable.
 */
public func register<Service, A, B, C, D>(initializer initializer: (A, B, C, D) -> Service, service: Service.Type, name: String? = nil) -> ServiceEntry<Service> {
   return self.register(service.self, name: name, factory: { r in 
       let a: A? = r.resolve(); let b: B? = r.resolve(); let c: C? = r.resolve(); let d: D? = r.resolve()
       checkResolved(initializer: initializer, services: a, b, c, d)
       return initializer(a!, b!, c!, d!)
   } as (Resolvable) -> Service)
}

/** Registers a factory that resolves the Service based on dependencies infered from the Service initializer.
 
 Usage: `register(initializer: MyService.init, service: MyService.self, argument: Arg1.self)`
 - Parameters:
    - initializer: Initializer of the registered service
    - service: Registered service type
    - name: Optional name of the service
    - argument: Argument type(s) that will be resolved dynamically instead of resolving dependency
 - Returns: The registered service entry with 1 arguments
 - Important: Might fail if one of the dependencies is unresolvable.
 */
public func register<Service, A, B, C, D, Arg1>(initializer initializer: (A, B, C, D) -> Service, service: Service.Type, name: String? = nil, argument  arg1: Arg1.Type) -> ServiceEntry<Service> {
   return self.register(service.self, name: name, factory: { r, arg1 in 
       let a: A? = r.resolve(argument: arg1); let b: B? = r.resolve(argument: arg1); let c: C? = r.resolve(argument: arg1); let d: D? = r.resolve(argument: arg1)
       checkResolved(initializer: initializer, services: a, b, c, d)
       return initializer(a!, b!, c!, d!)
   } as (Resolvable, Arg1) -> Service)
}

/** Registers a factory that resolves the Service based on dependencies infered from the Service initializer.
 
 Usage: `register(initializer: MyService.init, service: MyService.self, arguments: Arg1.self, Arg2.self)`
 - Parameters:
    - initializer: Initializer of the registered service
    - service: Registered service type
    - name: Optional name of the service
    - arguments: Argument type(s) that will be resolved dynamically instead of resolving dependency
 - Returns: The registered service entry with 2 arguments
 - Important: Might fail if one of the dependencies is unresolvable.
 */
public func register<Service, A, B, C, D, Arg1, Arg2>(initializer initializer: (A, B, C, D) -> Service, service: Service.Type, name: String? = nil, arguments  arg1: Arg1.Type, _ arg2: Arg2.Type) -> ServiceEntry<Service> {
   return self.register(service.self, name: name, factory: { r, arg1, arg2 in 
       let a: A? = r.resolve(arguments: arg1, arg2); let b: B? = r.resolve(arguments: arg1, arg2); let c: C? = r.resolve(arguments: arg1, arg2); let d: D? = r.resolve(arguments: arg1, arg2)
       checkResolved(initializer: initializer, services: a, b, c, d)
       return initializer(a!, b!, c!, d!)
   } as (Resolvable, Arg1, Arg2) -> Service)
}

/** Registers a factory that resolves the Service based on dependencies infered from the Service initializer.
 
 Usage: `register(initializer: MyService.init, service: MyService.self, arguments: Arg1.self, Arg2.self, Arg3.self)`
 - Parameters:
    - initializer: Initializer of the registered service
    - service: Registered service type
    - name: Optional name of the service
    - arguments: Argument type(s) that will be resolved dynamically instead of resolving dependency
 - Returns: The registered service entry with 3 arguments
 - Important: Might fail if one of the dependencies is unresolvable.
 */
public func register<Service, A, B, C, D, Arg1, Arg2, Arg3>(initializer initializer: (A, B, C, D) -> Service, service: Service.Type, name: String? = nil, arguments  arg1: Arg1.Type, _ arg2: Arg2.Type, _ arg3: Arg3.Type) -> ServiceEntry<Service> {
   return self.register(service.self, name: name, factory: { r, arg1, arg2, arg3 in 
       let a: A? = r.resolve(arguments: arg1, arg2, arg3); let b: B? = r.resolve(arguments: arg1, arg2, arg3); let c: C? = r.resolve(arguments: arg1, arg2, arg3); let d: D? = r.resolve(arguments: arg1, arg2, arg3)
       checkResolved(initializer: initializer, services: a, b, c, d)
       return initializer(a!, b!, c!, d!)
   } as (Resolvable, Arg1, Arg2, Arg3) -> Service)
}

/** Registers a factory that resolves the Service based on dependencies infered from the Service initializer.
 
 Usage: `register(initializer: MyService.init, service: MyService.self)`
 - Parameters:
    - initializer: Initializer of the registered service
    - service: Registered service type
    - name: Optional name of the service

 - Returns: The registered service entry 
 - Important: Might fail if one of the dependencies is unresolvable.
 */
public func register<Service, A, B, C, D, E>(initializer initializer: (A, B, C, D, E) -> Service, service: Service.Type, name: String? = nil) -> ServiceEntry<Service> {
   return self.register(service.self, name: name, factory: { r in 
       let a: A? = r.resolve(); let b: B? = r.resolve(); let c: C? = r.resolve(); let d: D? = r.resolve(); let e: E? = r.resolve()
       checkResolved(initializer: initializer, services: a, b, c, d, e)
       return initializer(a!, b!, c!, d!, e!)
   } as (Resolvable) -> Service)
}

/** Registers a factory that resolves the Service based on dependencies infered from the Service initializer.
 
 Usage: `register(initializer: MyService.init, service: MyService.self, argument: Arg1.self)`
 - Parameters:
    - initializer: Initializer of the registered service
    - service: Registered service type
    - name: Optional name of the service
    - argument: Argument type(s) that will be resolved dynamically instead of resolving dependency
 - Returns: The registered service entry with 1 arguments
 - Important: Might fail if one of the dependencies is unresolvable.
 */
public func register<Service, A, B, C, D, E, Arg1>(initializer initializer: (A, B, C, D, E) -> Service, service: Service.Type, name: String? = nil, argument  arg1: Arg1.Type) -> ServiceEntry<Service> {
   return self.register(service.self, name: name, factory: { r, arg1 in 
       let a: A? = r.resolve(argument: arg1); let b: B? = r.resolve(argument: arg1); let c: C? = r.resolve(argument: arg1); let d: D? = r.resolve(argument: arg1); let e: E? = r.resolve(argument: arg1)
       checkResolved(initializer: initializer, services: a, b, c, d, e)
       return initializer(a!, b!, c!, d!, e!)
   } as (Resolvable, Arg1) -> Service)
}

/** Registers a factory that resolves the Service based on dependencies infered from the Service initializer.
 
 Usage: `register(initializer: MyService.init, service: MyService.self, arguments: Arg1.self, Arg2.self)`
 - Parameters:
    - initializer: Initializer of the registered service
    - service: Registered service type
    - name: Optional name of the service
    - arguments: Argument type(s) that will be resolved dynamically instead of resolving dependency
 - Returns: The registered service entry with 2 arguments
 - Important: Might fail if one of the dependencies is unresolvable.
 */
public func register<Service, A, B, C, D, E, Arg1, Arg2>(initializer initializer: (A, B, C, D, E) -> Service, service: Service.Type, name: String? = nil, arguments  arg1: Arg1.Type, _ arg2: Arg2.Type) -> ServiceEntry<Service> {
   return self.register(service.self, name: name, factory: { r, arg1, arg2 in 
       let a: A? = r.resolve(arguments: arg1, arg2); let b: B? = r.resolve(arguments: arg1, arg2); let c: C? = r.resolve(arguments: arg1, arg2); let d: D? = r.resolve(arguments: arg1, arg2); let e: E? = r.resolve(arguments: arg1, arg2)
       checkResolved(initializer: initializer, services: a, b, c, d, e)
       return initializer(a!, b!, c!, d!, e!)
   } as (Resolvable, Arg1, Arg2) -> Service)
}

/** Registers a factory that resolves the Service based on dependencies infered from the Service initializer.
 
 Usage: `register(initializer: MyService.init, service: MyService.self, arguments: Arg1.self, Arg2.self, Arg3.self)`
 - Parameters:
    - initializer: Initializer of the registered service
    - service: Registered service type
    - name: Optional name of the service
    - arguments: Argument type(s) that will be resolved dynamically instead of resolving dependency
 - Returns: The registered service entry with 3 arguments
 - Important: Might fail if one of the dependencies is unresolvable.
 */
public func register<Service, A, B, C, D, E, Arg1, Arg2, Arg3>(initializer initializer: (A, B, C, D, E) -> Service, service: Service.Type, name: String? = nil, arguments  arg1: Arg1.Type, _ arg2: Arg2.Type, _ arg3: Arg3.Type) -> ServiceEntry<Service> {
   return self.register(service.self, name: name, factory: { r, arg1, arg2, arg3 in 
       let a: A? = r.resolve(arguments: arg1, arg2, arg3); let b: B? = r.resolve(arguments: arg1, arg2, arg3); let c: C? = r.resolve(arguments: arg1, arg2, arg3); let d: D? = r.resolve(arguments: arg1, arg2, arg3); let e: E? = r.resolve(arguments: arg1, arg2, arg3)
       checkResolved(initializer: initializer, services: a, b, c, d, e)
       return initializer(a!, b!, c!, d!, e!)
   } as (Resolvable, Arg1, Arg2, Arg3) -> Service)
}

/** Registers a factory that resolves the Service based on dependencies infered from the Service initializer.
 
 Usage: `register(initializer: MyService.init, service: MyService.self)`
 - Parameters:
    - initializer: Initializer of the registered service
    - service: Registered service type
    - name: Optional name of the service

 - Returns: The registered service entry 
 - Important: Might fail if one of the dependencies is unresolvable.
 */
public func register<Service, A, B, C, D, E, F>(initializer initializer: (A, B, C, D, E, F) -> Service, service: Service.Type, name: String? = nil) -> ServiceEntry<Service> {
   return self.register(service.self, name: name, factory: { r in 
       let a: A? = r.resolve(); let b: B? = r.resolve(); let c: C? = r.resolve(); let d: D? = r.resolve(); let e: E? = r.resolve(); let f: F? = r.resolve()
       checkResolved(initializer: initializer, services: a, b, c, d, e, f)
       return initializer(a!, b!, c!, d!, e!, f!)
   } as (Resolvable) -> Service)
}

/** Registers a factory that resolves the Service based on dependencies infered from the Service initializer.
 
 Usage: `register(initializer: MyService.init, service: MyService.self, argument: Arg1.self)`
 - Parameters:
    - initializer: Initializer of the registered service
    - service: Registered service type
    - name: Optional name of the service
    - argument: Argument type(s) that will be resolved dynamically instead of resolving dependency
 - Returns: The registered service entry with 1 arguments
 - Important: Might fail if one of the dependencies is unresolvable.
 */
public func register<Service, A, B, C, D, E, F, Arg1>(initializer initializer: (A, B, C, D, E, F) -> Service, service: Service.Type, name: String? = nil, argument  arg1: Arg1.Type) -> ServiceEntry<Service> {
   return self.register(service.self, name: name, factory: { r, arg1 in 
       let a: A? = r.resolve(argument: arg1); let b: B? = r.resolve(argument: arg1); let c: C? = r.resolve(argument: arg1); let d: D? = r.resolve(argument: arg1); let e: E? = r.resolve(argument: arg1); let f: F? = r.resolve(argument: arg1)
       checkResolved(initializer: initializer, services: a, b, c, d, e, f)
       return initializer(a!, b!, c!, d!, e!, f!)
   } as (Resolvable, Arg1) -> Service)
}

/** Registers a factory that resolves the Service based on dependencies infered from the Service initializer.
 
 Usage: `register(initializer: MyService.init, service: MyService.self, arguments: Arg1.self, Arg2.self)`
 - Parameters:
    - initializer: Initializer of the registered service
    - service: Registered service type
    - name: Optional name of the service
    - arguments: Argument type(s) that will be resolved dynamically instead of resolving dependency
 - Returns: The registered service entry with 2 arguments
 - Important: Might fail if one of the dependencies is unresolvable.
 */
public func register<Service, A, B, C, D, E, F, Arg1, Arg2>(initializer initializer: (A, B, C, D, E, F) -> Service, service: Service.Type, name: String? = nil, arguments  arg1: Arg1.Type, _ arg2: Arg2.Type) -> ServiceEntry<Service> {
   return self.register(service.self, name: name, factory: { r, arg1, arg2 in 
       let a: A? = r.resolve(arguments: arg1, arg2); let b: B? = r.resolve(arguments: arg1, arg2); let c: C? = r.resolve(arguments: arg1, arg2); let d: D? = r.resolve(arguments: arg1, arg2); let e: E? = r.resolve(arguments: arg1, arg2); let f: F? = r.resolve(arguments: arg1, arg2)
       checkResolved(initializer: initializer, services: a, b, c, d, e, f)
       return initializer(a!, b!, c!, d!, e!, f!)
   } as (Resolvable, Arg1, Arg2) -> Service)
}

/** Registers a factory that resolves the Service based on dependencies infered from the Service initializer.
 
 Usage: `register(initializer: MyService.init, service: MyService.self, arguments: Arg1.self, Arg2.self, Arg3.self)`
 - Parameters:
    - initializer: Initializer of the registered service
    - service: Registered service type
    - name: Optional name of the service
    - arguments: Argument type(s) that will be resolved dynamically instead of resolving dependency
 - Returns: The registered service entry with 3 arguments
 - Important: Might fail if one of the dependencies is unresolvable.
 */
public func register<Service, A, B, C, D, E, F, Arg1, Arg2, Arg3>(initializer initializer: (A, B, C, D, E, F) -> Service, service: Service.Type, name: String? = nil, arguments  arg1: Arg1.Type, _ arg2: Arg2.Type, _ arg3: Arg3.Type) -> ServiceEntry<Service> {
   return self.register(service.self, name: name, factory: { r, arg1, arg2, arg3 in 
       let a: A? = r.resolve(arguments: arg1, arg2, arg3); let b: B? = r.resolve(arguments: arg1, arg2, arg3); let c: C? = r.resolve(arguments: arg1, arg2, arg3); let d: D? = r.resolve(arguments: arg1, arg2, arg3); let e: E? = r.resolve(arguments: arg1, arg2, arg3); let f: F? = r.resolve(arguments: arg1, arg2, arg3)
       checkResolved(initializer: initializer, services: a, b, c, d, e, f)
       return initializer(a!, b!, c!, d!, e!, f!)
   } as (Resolvable, Arg1, Arg2, Arg3) -> Service)
}

/** Registers a factory that resolves the Service based on dependencies infered from the Service initializer.
 
 Usage: `register(initializer: MyService.init, service: MyService.self)`
 - Parameters:
    - initializer: Initializer of the registered service
    - service: Registered service type
    - name: Optional name of the service

 - Returns: The registered service entry 
 - Important: Might fail if one of the dependencies is unresolvable.
 */
public func register<Service, A, B, C, D, E, F, G>(initializer initializer: (A, B, C, D, E, F, G) -> Service, service: Service.Type, name: String? = nil) -> ServiceEntry<Service> {
   return self.register(service.self, name: name, factory: { r in 
       let a: A? = r.resolve(); let b: B? = r.resolve(); let c: C? = r.resolve(); let d: D? = r.resolve(); let e: E? = r.resolve(); let f: F? = r.resolve(); let g: G? = r.resolve()
       checkResolved(initializer: initializer, services: a, b, c, d, e, f, g)
       return initializer(a!, b!, c!, d!, e!, f!, g!)
   } as (Resolvable) -> Service)
}

/** Registers a factory that resolves the Service based on dependencies infered from the Service initializer.
 
 Usage: `register(initializer: MyService.init, service: MyService.self, argument: Arg1.self)`
 - Parameters:
    - initializer: Initializer of the registered service
    - service: Registered service type
    - name: Optional name of the service
    - argument: Argument type(s) that will be resolved dynamically instead of resolving dependency
 - Returns: The registered service entry with 1 arguments
 - Important: Might fail if one of the dependencies is unresolvable.
 */
public func register<Service, A, B, C, D, E, F, G, Arg1>(initializer initializer: (A, B, C, D, E, F, G) -> Service, service: Service.Type, name: String? = nil, argument  arg1: Arg1.Type) -> ServiceEntry<Service> {
   return self.register(service.self, name: name, factory: { r, arg1 in 
       let a: A? = r.resolve(argument: arg1); let b: B? = r.resolve(argument: arg1); let c: C? = r.resolve(argument: arg1); let d: D? = r.resolve(argument: arg1); let e: E? = r.resolve(argument: arg1); let f: F? = r.resolve(argument: arg1); let g: G? = r.resolve(argument: arg1)
       checkResolved(initializer: initializer, services: a, b, c, d, e, f, g)
       return initializer(a!, b!, c!, d!, e!, f!, g!)
   } as (Resolvable, Arg1) -> Service)
}

/** Registers a factory that resolves the Service based on dependencies infered from the Service initializer.
 
 Usage: `register(initializer: MyService.init, service: MyService.self, arguments: Arg1.self, Arg2.self)`
 - Parameters:
    - initializer: Initializer of the registered service
    - service: Registered service type
    - name: Optional name of the service
    - arguments: Argument type(s) that will be resolved dynamically instead of resolving dependency
 - Returns: The registered service entry with 2 arguments
 - Important: Might fail if one of the dependencies is unresolvable.
 */
public func register<Service, A, B, C, D, E, F, G, Arg1, Arg2>(initializer initializer: (A, B, C, D, E, F, G) -> Service, service: Service.Type, name: String? = nil, arguments  arg1: Arg1.Type, _ arg2: Arg2.Type) -> ServiceEntry<Service> {
   return self.register(service.self, name: name, factory: { r, arg1, arg2 in 
       let a: A? = r.resolve(arguments: arg1, arg2); let b: B? = r.resolve(arguments: arg1, arg2); let c: C? = r.resolve(arguments: arg1, arg2); let d: D? = r.resolve(arguments: arg1, arg2); let e: E? = r.resolve(arguments: arg1, arg2); let f: F? = r.resolve(arguments: arg1, arg2); let g: G? = r.resolve(arguments: arg1, arg2)
       checkResolved(initializer: initializer, services: a, b, c, d, e, f, g)
       return initializer(a!, b!, c!, d!, e!, f!, g!)
   } as (Resolvable, Arg1, Arg2) -> Service)
}

/** Registers a factory that resolves the Service based on dependencies infered from the Service initializer.
 
 Usage: `register(initializer: MyService.init, service: MyService.self, arguments: Arg1.self, Arg2.self, Arg3.self)`
 - Parameters:
    - initializer: Initializer of the registered service
    - service: Registered service type
    - name: Optional name of the service
    - arguments: Argument type(s) that will be resolved dynamically instead of resolving dependency
 - Returns: The registered service entry with 3 arguments
 - Important: Might fail if one of the dependencies is unresolvable.
 */
public func register<Service, A, B, C, D, E, F, G, Arg1, Arg2, Arg3>(initializer initializer: (A, B, C, D, E, F, G) -> Service, service: Service.Type, name: String? = nil, arguments  arg1: Arg1.Type, _ arg2: Arg2.Type, _ arg3: Arg3.Type) -> ServiceEntry<Service> {
   return self.register(service.self, name: name, factory: { r, arg1, arg2, arg3 in 
       let a: A? = r.resolve(arguments: arg1, arg2, arg3); let b: B? = r.resolve(arguments: arg1, arg2, arg3); let c: C? = r.resolve(arguments: arg1, arg2, arg3); let d: D? = r.resolve(arguments: arg1, arg2, arg3); let e: E? = r.resolve(arguments: arg1, arg2, arg3); let f: F? = r.resolve(arguments: arg1, arg2, arg3); let g: G? = r.resolve(arguments: arg1, arg2, arg3)
       checkResolved(initializer: initializer, services: a, b, c, d, e, f, g)
       return initializer(a!, b!, c!, d!, e!, f!, g!)
   } as (Resolvable, Arg1, Arg2, Arg3) -> Service)
}

/** Registers a factory that resolves the Service based on dependencies infered from the Service initializer.
 
 Usage: `register(initializer: MyService.init, service: MyService.self)`
 - Parameters:
    - initializer: Initializer of the registered service
    - service: Registered service type
    - name: Optional name of the service

 - Returns: The registered service entry 
 - Important: Might fail if one of the dependencies is unresolvable.
 */
public func register<Service, A, B, C, D, E, F, G, H>(initializer initializer: (A, B, C, D, E, F, G, H) -> Service, service: Service.Type, name: String? = nil) -> ServiceEntry<Service> {
   return self.register(service.self, name: name, factory: { r in 
       let a: A? = r.resolve(); let b: B? = r.resolve(); let c: C? = r.resolve(); let d: D? = r.resolve(); let e: E? = r.resolve(); let f: F? = r.resolve(); let g: G? = r.resolve(); let h: H? = r.resolve()
       checkResolved(initializer: initializer, services: a, b, c, d, e, f, g, h)
       return initializer(a!, b!, c!, d!, e!, f!, g!, h!)
   } as (Resolvable) -> Service)
}

/** Registers a factory that resolves the Service based on dependencies infered from the Service initializer.
 
 Usage: `register(initializer: MyService.init, service: MyService.self, argument: Arg1.self)`
 - Parameters:
    - initializer: Initializer of the registered service
    - service: Registered service type
    - name: Optional name of the service
    - argument: Argument type(s) that will be resolved dynamically instead of resolving dependency
 - Returns: The registered service entry with 1 arguments
 - Important: Might fail if one of the dependencies is unresolvable.
 */
public func register<Service, A, B, C, D, E, F, G, H, Arg1>(initializer initializer: (A, B, C, D, E, F, G, H) -> Service, service: Service.Type, name: String? = nil, argument  arg1: Arg1.Type) -> ServiceEntry<Service> {
   return self.register(service.self, name: name, factory: { r, arg1 in 
       let a: A? = r.resolve(argument: arg1); let b: B? = r.resolve(argument: arg1); let c: C? = r.resolve(argument: arg1); let d: D? = r.resolve(argument: arg1); let e: E? = r.resolve(argument: arg1); let f: F? = r.resolve(argument: arg1); let g: G? = r.resolve(argument: arg1); let h: H? = r.resolve(argument: arg1)
       checkResolved(initializer: initializer, services: a, b, c, d, e, f, g, h)
       return initializer(a!, b!, c!, d!, e!, f!, g!, h!)
   } as (Resolvable, Arg1) -> Service)
}

/** Registers a factory that resolves the Service based on dependencies infered from the Service initializer.
 
 Usage: `register(initializer: MyService.init, service: MyService.self, arguments: Arg1.self, Arg2.self)`
 - Parameters:
    - initializer: Initializer of the registered service
    - service: Registered service type
    - name: Optional name of the service
    - arguments: Argument type(s) that will be resolved dynamically instead of resolving dependency
 - Returns: The registered service entry with 2 arguments
 - Important: Might fail if one of the dependencies is unresolvable.
 */
public func register<Service, A, B, C, D, E, F, G, H, Arg1, Arg2>(initializer initializer: (A, B, C, D, E, F, G, H) -> Service, service: Service.Type, name: String? = nil, arguments  arg1: Arg1.Type, _ arg2: Arg2.Type) -> ServiceEntry<Service> {
   return self.register(service.self, name: name, factory: { r, arg1, arg2 in 
       let a: A? = r.resolve(arguments: arg1, arg2); let b: B? = r.resolve(arguments: arg1, arg2); let c: C? = r.resolve(arguments: arg1, arg2); let d: D? = r.resolve(arguments: arg1, arg2); let e: E? = r.resolve(arguments: arg1, arg2); let f: F? = r.resolve(arguments: arg1, arg2); let g: G? = r.resolve(arguments: arg1, arg2); let h: H? = r.resolve(arguments: arg1, arg2)
       checkResolved(initializer: initializer, services: a, b, c, d, e, f, g, h)
       return initializer(a!, b!, c!, d!, e!, f!, g!, h!)
   } as (Resolvable, Arg1, Arg2) -> Service)
}

/** Registers a factory that resolves the Service based on dependencies infered from the Service initializer.
 
 Usage: `register(initializer: MyService.init, service: MyService.self, arguments: Arg1.self, Arg2.self, Arg3.self)`
 - Parameters:
    - initializer: Initializer of the registered service
    - service: Registered service type
    - name: Optional name of the service
    - arguments: Argument type(s) that will be resolved dynamically instead of resolving dependency
 - Returns: The registered service entry with 3 arguments
 - Important: Might fail if one of the dependencies is unresolvable.
 */
public func register<Service, A, B, C, D, E, F, G, H, Arg1, Arg2, Arg3>(initializer initializer: (A, B, C, D, E, F, G, H) -> Service, service: Service.Type, name: String? = nil, arguments  arg1: Arg1.Type, _ arg2: Arg2.Type, _ arg3: Arg3.Type) -> ServiceEntry<Service> {
   return self.register(service.self, name: name, factory: { r, arg1, arg2, arg3 in 
       let a: A? = r.resolve(arguments: arg1, arg2, arg3); let b: B? = r.resolve(arguments: arg1, arg2, arg3); let c: C? = r.resolve(arguments: arg1, arg2, arg3); let d: D? = r.resolve(arguments: arg1, arg2, arg3); let e: E? = r.resolve(arguments: arg1, arg2, arg3); let f: F? = r.resolve(arguments: arg1, arg2, arg3); let g: G? = r.resolve(arguments: arg1, arg2, arg3); let h: H? = r.resolve(arguments: arg1, arg2, arg3)
       checkResolved(initializer: initializer, services: a, b, c, d, e, f, g, h)
       return initializer(a!, b!, c!, d!, e!, f!, g!, h!)
   } as (Resolvable, Arg1, Arg2, Arg3) -> Service)
}

/** Registers a factory that resolves the Service based on dependencies infered from the Service initializer.
 
 Usage: `register(initializer: MyService.init, service: MyService.self)`
 - Parameters:
    - initializer: Initializer of the registered service
    - service: Registered service type
    - name: Optional name of the service

 - Returns: The registered service entry 
 - Important: Might fail if one of the dependencies is unresolvable.
 */
public func register<Service, A, B, C, D, E, F, G, H, I>(initializer initializer: (A, B, C, D, E, F, G, H, I) -> Service, service: Service.Type, name: String? = nil) -> ServiceEntry<Service> {
   return self.register(service.self, name: name, factory: { r in 
       let a: A? = r.resolve(); let b: B? = r.resolve(); let c: C? = r.resolve(); let d: D? = r.resolve(); let e: E? = r.resolve(); let f: F? = r.resolve(); let g: G? = r.resolve(); let h: H? = r.resolve(); let i: I? = r.resolve()
       checkResolved(initializer: initializer, services: a, b, c, d, e, f, g, h, i)
       return initializer(a!, b!, c!, d!, e!, f!, g!, h!, i!)
   } as (Resolvable) -> Service)
}

/** Registers a factory that resolves the Service based on dependencies infered from the Service initializer.
 
 Usage: `register(initializer: MyService.init, service: MyService.self, argument: Arg1.self)`
 - Parameters:
    - initializer: Initializer of the registered service
    - service: Registered service type
    - name: Optional name of the service
    - argument: Argument type(s) that will be resolved dynamically instead of resolving dependency
 - Returns: The registered service entry with 1 arguments
 - Important: Might fail if one of the dependencies is unresolvable.
 */
public func register<Service, A, B, C, D, E, F, G, H, I, Arg1>(initializer initializer: (A, B, C, D, E, F, G, H, I) -> Service, service: Service.Type, name: String? = nil, argument  arg1: Arg1.Type) -> ServiceEntry<Service> {
   return self.register(service.self, name: name, factory: { r, arg1 in 
       let a: A? = r.resolve(argument: arg1); let b: B? = r.resolve(argument: arg1); let c: C? = r.resolve(argument: arg1); let d: D? = r.resolve(argument: arg1); let e: E? = r.resolve(argument: arg1); let f: F? = r.resolve(argument: arg1); let g: G? = r.resolve(argument: arg1); let h: H? = r.resolve(argument: arg1); let i: I? = r.resolve(argument: arg1)
       checkResolved(initializer: initializer, services: a, b, c, d, e, f, g, h, i)
       return initializer(a!, b!, c!, d!, e!, f!, g!, h!, i!)
   } as (Resolvable, Arg1) -> Service)
}

/** Registers a factory that resolves the Service based on dependencies infered from the Service initializer.
 
 Usage: `register(initializer: MyService.init, service: MyService.self, arguments: Arg1.self, Arg2.self)`
 - Parameters:
    - initializer: Initializer of the registered service
    - service: Registered service type
    - name: Optional name of the service
    - arguments: Argument type(s) that will be resolved dynamically instead of resolving dependency
 - Returns: The registered service entry with 2 arguments
 - Important: Might fail if one of the dependencies is unresolvable.
 */
public func register<Service, A, B, C, D, E, F, G, H, I, Arg1, Arg2>(initializer initializer: (A, B, C, D, E, F, G, H, I) -> Service, service: Service.Type, name: String? = nil, arguments  arg1: Arg1.Type, _ arg2: Arg2.Type) -> ServiceEntry<Service> {
   return self.register(service.self, name: name, factory: { r, arg1, arg2 in 
       let a: A? = r.resolve(arguments: arg1, arg2); let b: B? = r.resolve(arguments: arg1, arg2); let c: C? = r.resolve(arguments: arg1, arg2); let d: D? = r.resolve(arguments: arg1, arg2); let e: E? = r.resolve(arguments: arg1, arg2); let f: F? = r.resolve(arguments: arg1, arg2); let g: G? = r.resolve(arguments: arg1, arg2); let h: H? = r.resolve(arguments: arg1, arg2); let i: I? = r.resolve(arguments: arg1, arg2)
       checkResolved(initializer: initializer, services: a, b, c, d, e, f, g, h, i)
       return initializer(a!, b!, c!, d!, e!, f!, g!, h!, i!)
   } as (Resolvable, Arg1, Arg2) -> Service)
}

/** Registers a factory that resolves the Service based on dependencies infered from the Service initializer.
 
 Usage: `register(initializer: MyService.init, service: MyService.self, arguments: Arg1.self, Arg2.self, Arg3.self)`
 - Parameters:
    - initializer: Initializer of the registered service
    - service: Registered service type
    - name: Optional name of the service
    - arguments: Argument type(s) that will be resolved dynamically instead of resolving dependency
 - Returns: The registered service entry with 3 arguments
 - Important: Might fail if one of the dependencies is unresolvable.
 */
public func register<Service, A, B, C, D, E, F, G, H, I, Arg1, Arg2, Arg3>(initializer initializer: (A, B, C, D, E, F, G, H, I) -> Service, service: Service.Type, name: String? = nil, arguments  arg1: Arg1.Type, _ arg2: Arg2.Type, _ arg3: Arg3.Type) -> ServiceEntry<Service> {
   return self.register(service.self, name: name, factory: { r, arg1, arg2, arg3 in 
       let a: A? = r.resolve(arguments: arg1, arg2, arg3); let b: B? = r.resolve(arguments: arg1, arg2, arg3); let c: C? = r.resolve(arguments: arg1, arg2, arg3); let d: D? = r.resolve(arguments: arg1, arg2, arg3); let e: E? = r.resolve(arguments: arg1, arg2, arg3); let f: F? = r.resolve(arguments: arg1, arg2, arg3); let g: G? = r.resolve(arguments: arg1, arg2, arg3); let h: H? = r.resolve(arguments: arg1, arg2, arg3); let i: I? = r.resolve(arguments: arg1, arg2, arg3)
       checkResolved(initializer: initializer, services: a, b, c, d, e, f, g, h, i)
       return initializer(a!, b!, c!, d!, e!, f!, g!, h!, i!)
   } as (Resolvable, Arg1, Arg2, Arg3) -> Service)
}


}
public extension Resolvable {


private func resolve<Service>() -> Service? {
   return self.resolve(Service.self)
}

private func resolve<Service, Arg1>(argument  arg1: Arg1) -> Service? {
   return (arg1 as? Service) ?? self.resolve(Service.self)
}

private func resolve<Service, Arg1, Arg2>(arguments  arg1: Arg1, _ arg2: Arg2) -> Service? {
   return (arg1 as? Service) ?? (arg2 as? Service) ?? self.resolve(Service.self)
}

private func resolve<Service, Arg1, Arg2, Arg3>(arguments  arg1: Arg1, _ arg2: Arg2, _ arg3: Arg3) -> Service? {
   return (arg1 as? Service) ?? (arg2 as? Service) ?? (arg3 as? Service) ?? self.resolve(Service.self)
}
}


private func checkResolved<Service, A>(initializer initializer: (A) -> Service, services  a: A?){
   let services: [Any?] = [a].filter{ $0 == nil }
   if let _ = services.first {
       assertionFailure("Failed to resolve \((a == nil ? "\(A.self)" : "??")), initializer: (\(A.self)) -> \(Service.self)")
   }
}

private func checkResolved<Service, A, B>(initializer initializer: (A, B) -> Service, services  a: A?, _ b: B?){
   let services: [Any?] = [a, b].filter{ $0 == nil }
   if let _ = services.first {
       assertionFailure("Failed to resolve \((a == nil ? "\(A.self)" : (b == nil ? "\(B.self)" : "??"))), initializer: (\(A.self), \(B.self)) -> \(Service.self)")
   }
}

private func checkResolved<Service, A, B, C>(initializer initializer: (A, B, C) -> Service, services  a: A?, _ b: B?, _ c: C?){
   let services: [Any?] = [a, b, c].filter{ $0 == nil }
   if let _ = services.first {
       assertionFailure("Failed to resolve \((a == nil ? "\(A.self)" : (b == nil ? "\(B.self)" : (c == nil ? "\(C.self)" : "??")))), initializer: (\(A.self), \(B.self), \(C.self)) -> \(Service.self)")
   }
}

private func checkResolved<Service, A, B, C, D>(initializer initializer: (A, B, C, D) -> Service, services  a: A?, _ b: B?, _ c: C?, _ d: D?){
   let services: [Any?] = [a, b, c, d].filter{ $0 == nil }
   if let _ = services.first {
       assertionFailure("Failed to resolve \((a == nil ? "\(A.self)" : (b == nil ? "\(B.self)" : (c == nil ? "\(C.self)" : (d == nil ? "\(D.self)" : "??"))))), initializer: (\(A.self), \(B.self), \(C.self), \(D.self)) -> \(Service.self)")
   }
}

private func checkResolved<Service, A, B, C, D, E>(initializer initializer: (A, B, C, D, E) -> Service, services  a: A?, _ b: B?, _ c: C?, _ d: D?, _ e: E?){
   let services: [Any?] = [a, b, c, d, e].filter{ $0 == nil }
   if let _ = services.first {
       assertionFailure("Failed to resolve \((a == nil ? "\(A.self)" : (b == nil ? "\(B.self)" : (c == nil ? "\(C.self)" : (d == nil ? "\(D.self)" : (e == nil ? "\(E.self)" : "??")))))), initializer: (\(A.self), \(B.self), \(C.self), \(D.self), \(E.self)) -> \(Service.self)")
   }
}

private func checkResolved<Service, A, B, C, D, E, F>(initializer initializer: (A, B, C, D, E, F) -> Service, services  a: A?, _ b: B?, _ c: C?, _ d: D?, _ e: E?, _ f: F?){
   let services: [Any?] = [a, b, c, d, e, f].filter{ $0 == nil }
   if let _ = services.first {
       assertionFailure("Failed to resolve \((a == nil ? "\(A.self)" : (b == nil ? "\(B.self)" : (c == nil ? "\(C.self)" : (d == nil ? "\(D.self)" : (e == nil ? "\(E.self)" : (f == nil ? "\(F.self)" : "??"))))))), initializer: (\(A.self), \(B.self), \(C.self), \(D.self), \(E.self), \(F.self)) -> \(Service.self)")
   }
}

private func checkResolved<Service, A, B, C, D, E, F, G>(initializer initializer: (A, B, C, D, E, F, G) -> Service, services  a: A?, _ b: B?, _ c: C?, _ d: D?, _ e: E?, _ f: F?, _ g: G?){
   let services: [Any?] = [a, b, c, d, e, f, g].filter{ $0 == nil }
   if let _ = services.first {
       assertionFailure("Failed to resolve \((a == nil ? "\(A.self)" : (b == nil ? "\(B.self)" : (c == nil ? "\(C.self)" : (d == nil ? "\(D.self)" : (e == nil ? "\(E.self)" : (f == nil ? "\(F.self)" : (g == nil ? "\(G.self)" : "??")))))))), initializer: (\(A.self), \(B.self), \(C.self), \(D.self), \(E.self), \(F.self), \(G.self)) -> \(Service.self)")
   }
}

private func checkResolved<Service, A, B, C, D, E, F, G, H>(initializer initializer: (A, B, C, D, E, F, G, H) -> Service, services  a: A?, _ b: B?, _ c: C?, _ d: D?, _ e: E?, _ f: F?, _ g: G?, _ h: H?){
   let services: [Any?] = [a, b, c, d, e, f, g, h].filter{ $0 == nil }
   if let _ = services.first {
       assertionFailure("Failed to resolve \((a == nil ? "\(A.self)" : (b == nil ? "\(B.self)" : (c == nil ? "\(C.self)" : (d == nil ? "\(D.self)" : (e == nil ? "\(E.self)" : (f == nil ? "\(F.self)" : (g == nil ? "\(G.self)" : (h == nil ? "\(H.self)" : "??"))))))))), initializer: (\(A.self), \(B.self), \(C.self), \(D.self), \(E.self), \(F.self), \(G.self), \(H.self)) -> \(Service.self)")
   }
}

private func checkResolved<Service, A, B, C, D, E, F, G, H, I>(initializer initializer: (A, B, C, D, E, F, G, H, I) -> Service, services  a: A?, _ b: B?, _ c: C?, _ d: D?, _ e: E?, _ f: F?, _ g: G?, _ h: H?, _ i: I?){
   let services: [Any?] = [a, b, c, d, e, f, g, h, i].filter{ $0 == nil }
   if let _ = services.first {
       assertionFailure("Failed to resolve \((a == nil ? "\(A.self)" : (b == nil ? "\(B.self)" : (c == nil ? "\(C.self)" : (d == nil ? "\(D.self)" : (e == nil ? "\(E.self)" : (f == nil ? "\(F.self)" : (g == nil ? "\(G.self)" : (h == nil ? "\(H.self)" : (i == nil ? "\(I.self)" : "??")))))))))), initializer: (\(A.self), \(B.self), \(C.self), \(D.self), \(E.self), \(F.self), \(G.self), \(H.self), \(I.self)) -> \(Service.self)")
   }
}