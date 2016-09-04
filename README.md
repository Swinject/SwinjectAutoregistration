# ACKSwinject


## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Usage

```
import Swinject
import ACKSwinject
```

You can register services like this:

```
container.register(initializer: MyService.init, service: MyService.self)

//Passing argument
container.register(initializer: MyService.init, service: MyService.self, argument: MyArgument.self)

//Multiple initializers in class
container.register(initializer: MyService.init(dependencyA:dependencyB), service: MyService.self, argument: MyArgument.self)
```

You can also use custom operator `~>`

```
container.register(MyService.self){
	MyService(dependencyA: r~>, dependencyB: r~>)
}

//For specific dependency type
container.register(MyService.self){
	MyService(dependencyA: r ~> DependencyA.self, dependencyB: r ~> DependencyA.self)
}

//With an argument
container.register(MyService.self){
	MyService(dependencyA: r ~> (DependencyA.self, argument: arg1), dependencyB: r ~> DependencyA.self)
}

```

For registration of factories use:

```
typealias MyFactory = (id: Int) -> MyService
container.registerFactory(MyFactory)
```

The returning type will be automatically resolved and passed arguments from the closure.

## Installation

ACKImageKit is available through CocoaPods. You need to add Ackee private repo to your Cocoapods installation. See [AckeePods](https://gitlab.ack.ee/Ackee/AckeePods) for details. Then simply add the following line to your Podfile:

```ruby
pod "ACKSwinject"
```

## Author

Tomas Kohout, email@tomaskohout.cz

## License

ACKSwinject is available under the MIT license. See the LICENSE file for more info.
