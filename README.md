SwinjectAutoregistration
========

[![Build Status](https://travis-ci.org/Swinject/SwinjectStoryboard.svg?branch=master)](https://travis-ci.org/Swinject/SwinjectAutoregistration)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![CocoaPods Version](https://img.shields.io/cocoapods/v/SwinjectAutoregistration.svg?style=flat)](http://cocoapods.org/pods/SwinjectAutoregistration)
[![License](https://img.shields.io/cocoapods/l/SwinjectAutoregistration.svg?style=flat)](http://cocoapods.org/pods/SwinjectAutoregistration)
[![Platform](https://img.shields.io/cocoapods/p/SwinjectAutoregistration.svg?style=flat)](http://cocoapods.org/pods/SwinjectAutoregistration)
[![Swift Version](https://img.shields.io/badge/Swift-3-F16D39.svg?style=flat)](https://developer.apple.com/swift)

SwinjectAutoregistration is an extension of Swinject that allows to automatically register your services and greatly reduces the amount of boilerplate.

## Requirements

- iOS 8.0+ / Mac OS X 10.10+ / tvOS 9.0+
- Xcode 8+

## Installation

Swinject is available through [Carthage](https://github.com/Carthage/Carthage) or [CocoaPods](https://cocoapods.org).

### Carthage

To install Swinject with Carthage, add the following line to your `Cartfile`.

```
github "Swinject/Swinject" "2.0.0-beta.2"
github "Swinject/SwinjectAutoregistration" "1.0.0-beta.2"
```

Then run `carthage update --no-use-binaries` command or just `carthage update`. For details of the installation and usage of Carthage, visit [its project page](https://github.com/Carthage/Carthage).

### CocoaPods

To install Swinject with CocoaPods, add the following lines to your `Podfile`.

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0' # or platform :osx, '10.10' if your target is OS X.
use_frameworks!

pod 'Swinject', '2.0.0-beta.2'
pod 'SwinjectAutoregistration', '1.0.0-beta.2'
```

Then run `pod install` command. For details of the installation and usage of CocoaPods, visit [its official website](https://cocoapods.org).

### Registration

Here is a simple example to auto-register a pet owner

```swift
let container = Container()
container.register(AnimalType.self) { _ in Cat(name: "Mimi") }
container.autoregister(PersonType.self, initializer: PetOwner.init)
```

That's it. The `autoregister` function is given the `PetOwner` initializer `init(pet:AnimalType)`. From its signature Swinject knows that it needs a dependency `AnimalType` and resolves it from the container. Nothing else is needed. For comparison, this is equivalent code in pure Swinject:

```swift
container.register(PersonType.self) { r in
    PetOwner(pet: r.resolve(AnimalType.self)!)
}
```
#### Registration with name
Service can be also given name same as with the regular register.

```swift
container.autoregister(PersonType.self, name: "johnny", initializer: PetOwner.init)

```

#### Arguments
You can also use auto-registration for services with dynamic arguments. Pet owner which name needs to be passed as argument is defined like this:

```swift
class PetOwner: PersonType {
    let name: String
    let pet: AnimalType

    init(name: String, pet: AnimalType) {
        self.name = name
        self.pet = pet
    }
}
```

And registered like this

```swift
container.autoregister(PersonType.self, argument: String.self, initializer: PetOwner.init)
```

Swinject will register `PersonType` with the argument of type `String`. When `container.resolve(PersonType.self, argument: "Michael")` is called Swinject won't try to resolve `String` as dependency but instead pass "Michael" as the name.

To also pass pet as argument you can call

```swift
container.autoregister(PersonType.self, arguments: String.self, AnimalType.self, initializer: PetOwner.init)
//or
container.autoregister(PersonType.self, arguments: AnimalType.self, String.self, initializer: PetOwner.init)
```

> The order of the arguments listed is interchangeable. The auto-registration can't be used with more arguments and/or dependencies of the same type.


### What kind of sorcery is this?

Wondering how does that work? Generics are heavily leveraged for the auto-registration. For registering service with two dependencies something similar to a following function is used:

```
public func autoregister<Service, A, B>(_ service: Service.Type, initializer: (A, B) -> Service) -> ServiceEntry<Service> {
   return self.register(service.self, factory: { r in 
       return initializer(r.resolve(A.self)!, r.resolve(B.self)!)
   } as (ResolverType) -> Service)
}
```

The initializer is a function like any other. By passing it as a parameter its dependencies can be infered as `(A, B)` and automatically resolved. These functions are generated for up to 9 dependencies. Checkout the [code](https://github.com/Swinject/SwinjectAutoregistration/blob/master/Sources/AutoRegistration.swift) for more info.

### Limitations ###
When a service has multiple initializers, swift compiler can't be sure which should be used and you will get a `ambigious use of init(x: y: z:)`. This can also happen if the service is extending another class that have initializer with the same number of arguments. 

The solution is to specify the initializer like this:

```
container.autoregister(PersonType.self, initializer: PetOwner.init(name:pet:))
```
 



There are also cases where auto-registration **can't** be used:

  * Can't use services with **optional dependencies** in their initializers
     * e.g: `PersonOwner(name:String, pet: AnimalType?)` 
  * Can't use services with **named dependencies** in their initializers
     * There is no way to get a name of dependency from the initializer. For example, following code can't be auto-registered: 
     
     ```swift
     	container.register(AnimalType.self, name: "mimi") { _ in Cat(name: "Mimi") }
		container.register(PersonType.self) {
			PetOwner(pet: r.resolve(AnimalType.self, name: "mimi")
		}
     ```

### Operators ###
This extension also aims to reduce the amount of boilerplate while improving readability of the registration code. For that reason the operator `~>` is introduced. 

```swift
Petowner(pet: r~>)

// equivalent to

Petowner(pet: r.resolve(AnimalType.self)!)
```

The dependency is again infered from the type in initializer. To specify concrete class you can use:

```swift
Petowner(pet: r ~> Cat.self)
```

To use name:

```swift
Petowner(pet: r ~> (Cat.self, name: "mimi"))
```

or to pass argument/s:

```swift
Petowner(pet: r ~> (Cat.self, argument: "Mimi"))
Petowner(pet: r ~> (Cat.self, arguments: "Mimi", UIColor.black))

```

## Credits

SwinjectAutoregistration generics is inspired by:
- [Curry](https://github.com/thoughtbot/Curry) - [Thoughtbot](https://thoughtbot.com/)

## License

MIT license. See the [LICENSE file](LICENSE.txt) for details.