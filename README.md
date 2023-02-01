SwinjectAutoregistration
========

[![Build Status](https://travis-ci.org/Swinject/SwinjectAutoregistration.svg?branch=master)](https://travis-ci.org/Swinject/SwinjectAutoregistration)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![CocoaPods Version](https://img.shields.io/cocoapods/v/SwinjectAutoregistration.svg?style=flat)](http://cocoapods.org/pods/SwinjectAutoregistration)
[![License](https://img.shields.io/cocoapods/l/SwinjectAutoregistration.svg?style=flat)](http://cocoapods.org/pods/SwinjectAutoregistration)
[![Platform](https://img.shields.io/cocoapods/p/SwinjectAutoregistration.svg?style=flat)](http://cocoapods.org/pods/SwinjectAutoregistration)
[![Swift Version](https://img.shields.io/badge/Swift-5-F16D39.svg?style=flat)](https://developer.apple.com/swift)

SwinjectAutoregistration is an extension of Swinject that allows to automatically register your services and greatly reduce the amount of boilerplate code.

## Requirements

- iOS 9.0+ / Mac OS X 10.10+ / tvOS 9.0+
- Xcode 8+

## Installation

Swinject is available through [Carthage](https://github.com/Carthage/Carthage), [CocoaPods](https://cocoapods.org) or [Swift Package Manager](https://swift.org/package-manager/).

### Carthage

To install Swinject with Carthage, add the following line to your `Cartfile`.

```
github "Swinject/Swinject" "2.8.3"
github "Swinject/SwinjectAutoregistration" "2.8.3"
```

Then run `carthage update --use-xcframeworks --no-use-binaries` command or just `carthage update --use-xcframeworks`. For details of the installation and usage of Carthage, visit [its project page](https://github.com/Carthage/Carthage).

### CocoaPods

To install Swinject with CocoaPods, add the following lines to your `Podfile`.

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '9.0' # or platform :osx, '10.10' if your target is OS X.
use_frameworks!

pod 'Swinject', '2.8.3'
pod 'SwinjectAutoregistration', '2.8.3'
```

Then run `pod install` command. For details of the installation and usage of CocoaPods, visit [its official website](https://cocoapods.org).

### Swift Package Manager

in `Package.swift` add the following:

```swift
dependencies: [
    .package(url: "https://github.com/Swinject/SwinjectAutoregistration.git", from: "2.8.3")
],
targets: [
    .target(
        name: "MyProject",
        dependencies: [..., "SwinjectAutoregistration"]
    )
    ...
]
```

### Registration

Here is a simple example to auto-register a pet owner

```swift
let container = Container()
container.register(Animal.self) { _ in Cat(name: "Mimi") } // Regular register method
container.autoregister(Person.self, initializer: PetOwner.init) // Autoregistration
```

where PetOwner looks like this:

```swift
class PetOwner: Person {
    let pet: Animal

    init(pet: Animal) {
        self.pet = pet
    }
}
```

The `autoregister` function is given the `PetOwner` initializer `init(pet:Animal)`. From its signature Swinject knows that it needs a dependency `Animal` and resolves it from the container. Nothing else is needed.

Autoregistration becomes especially useful when used to register services with many dependencies. Compare autoregistration code:

```swift
container.autoregister(MyService.self, initializer: MyService.init)
```

with equivalent code in pure Swinject:

```swift
container.register(MyService.self) { r in
	MyService(dependencyA: r.resolve(DependencyA.self)!, dependencyB: r.resolve(DependencyB.self)!, dependencyC: r.resolve(DependencyC.self)!, dependencyD: r.resolve(DependencyD.self)!)
}
```

Another advantage is that if you add more dependencies during the development the registration code doesn't have to be rewritten.


#### Registration with name
Service can be also given name - same as with the regular register method.

```swift
container.autoregister(Person.self, name: "johnny", initializer: PetOwner.init)

```

#### Arguments
You can also use auto-registration for services with dynamic arguments. Pet owner whose name needs to be passed as argument is defined like this:

```swift
class PetOwner: Person {
    let name: String
    let pet: Animal

    init(name: String, pet: Animal) {
        self.name = name
        self.pet = pet
    }
}
```

And registered like this

```swift
container.autoregister(Person.self, argument: String.self, initializer: PetOwner.init)
```

Swinject will register `Person` with the argument of type `String`. When `container.resolve(Person.self, argument: "Michael")` is called Swinject won't try to resolve `String` as dependency but instead pass "Michael" as the name.

To also pass pet as argument you can call

```swift
container.autoregister(Person.self, arguments: String.self, Animal.self, initializer: PetOwner.init)
//or
container.autoregister(Person.self, arguments: Animal.self, String.self, initializer: PetOwner.init)
```

> The order of the arguments listed is interchangeable. The auto-registration can't be used with more arguments and/or dependencies of the same type.


### What kind of sorcery is this?

Wondering how does that work? Generics are heavily leveraged for the auto-registration. For registering service with two dependencies something similar to a following function is used:

```swift
public func autoregister<Service, A, B>(_ service: Service.Type, initializer: (A, B) -> Service) -> ServiceEntry<Service> {
   return self.register(service.self, factory: { r in
       return initializer(r.resolve(A.self)!, r.resolve(B.self)!)
   } as (ResolverType) -> Service)
}
```

The initializer is a function like any other. By passing it as a parameter its dependencies can be inferred as `(A, B)` and automatically resolved. These functions are generated for up to 20 dependencies. Checkout the [code](https://github.com/Swinject/SwinjectAutoregistration/blob/master/Sources/AutoRegistration.swift) for more info.

### Operators ###
This extension also aims to reduce the amount of boilerplate while improving readability of the registration code. For that reason the operator `~>` is introduced.

```swift
Petowner(pet: r~>)

// equivalent to

Petowner(pet: r.resolve(Animal.self)!)
```

The dependency is again inferred from the type in the initializer. To specify a concrete class you can use:

```swift
Petowner(pet: r ~> Cat.self)
```

To use a named service:

```swift
Petowner(pet: r ~> (Cat.self, name: "mimi"))
```

or to pass argument/s:

```swift
Petowner(pet: r ~> (Cat.self, argument: "Mimi"))
Petowner(pet: r ~> (Cat.self, arguments: ("Mimi", UIColor.black)))

```

### Limitations ###
When a service has multiple initializers, swift compiler can't be sure which should be used and you will get a `ambigious use of init(x: y: z:)`. This can also happen if the service is extending another class that have initializer with the same number of arguments.

The solution is to specify the initializer like this:

```
container.autoregister(Person.self, initializer: PetOwner.init(name:pet:))
```

Auto-registration **can't** be used with **named dependencies** in their initializers. There is no way to get a name of dependency from the initializer. For example, following code can't be auto-registered:

```swift
container.register(Animal.self, name: "mimi") { _ in Cat(name: "Mimi") }
container.register(Animal.self, name: "charles") { _ in Cat(name: "Charles") }
container.register(Person.self) {
    PetOwner(pet: r.resolve(Animal.self, name: "mimi")
}
```

### Swift 5.3
Since Swift 5.3 the compiler behaves differently when infering initializers in structs that have variables with a default value:

```swift
struct Cat {
    let height: Int = 50
}
```

Compiler will generate two init functions:

`Cat.init` and `Cat.init(height:)`

Since the Swift 5.3 the following registration

```swift
container.autoregister(Animal.self, initializer: Cat.init)
```

will try to use the `Cat.init(height:)` which will then fail with `Unresolved service: Int Initializer: (Int) -> Animal`

Solution is to make the compiler use the init without a parameter

```swift
container.autoregister(Animal.self, initializer: Cat.init as () -> Cat)
```

## For Maintainers

  ### Making a new release version

  Our release procedure is described as [Makefile](https://github.com/Swinject/SwinjectAutoregistration/blob/master/Makefile). Run `make help` coomand for more info.

## Credits

SwinjectAutoregistration generics is inspired by:
- [Curry](https://github.com/thoughtbot/Curry) - [Thoughtbot](https://thoughtbot.com/)

## License

MIT license. See the [LICENSE file](LICENSE) for details.
