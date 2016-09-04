# SwinjectAutoregistration


## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Usage

```
import Swinject
import SwinjectAutoregistration
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
