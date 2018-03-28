import Quick
import Nimble

import Swinject
import SwinjectAutoregistration


class OperatorsSpec: QuickSpec {
	
    class DependencyA {}
    class DependencyB {}
    class DependencyC {}
    class DependencyD {}
    
    class Service0 {}
    
    class Service1 {
        init(a: String){}
    }
    
    class Service2 {
        init(a: String, b: Int){}
    }
    
    class Service3 {
        init(a: String, b: Int, c: Double){}
    }
    
	override func spec() {
        describe("operators"){
            var container: Container!
            
            beforeEach {
                container = Container()
                container.register(Service0.self) { r in Service0() }
                container.register(Service0.self, name: "MyService") { r in Service0() }
                container.register(Service1.self) { r, a in Service1(a: a) }
                container.register(Service1.self, name: "MyService1") { r, a in Service1(a: a) }
                container.register(Service2.self) { r, a, b in Service2(a: a, b: b) }
                container.register(Service2.self, name: "MyService2") { r, a, b in Service2(a: a, b: b) }
                container.register(Service3.self) { r, a, b, c in Service3(a: a, b: b, c: c) }
                container.register(Service3.self, name: "MyService3") { r, a, b, c in Service3(a: a, b: b, c: c) }
            }
            
            it("resolves service using postfix operator") {
                let service: Service0 = container~>
                expect(service).toNot(beNil())
            }
            
            it("resolves service using infix operator") {
                let service = container ~> Service0.self
                expect(service).toNot(beNil())
            }
            
            it("resolves service using infix operator with name") {
                let service = container ~> (Service0.self, name: "MyService")
                expect(service).toNot(beNil())
            }
            
            #if !os(Linux)
            it("fails with message on unresolvable service") {
                    var logs = [String]()
                    Container.loggingFunction = { logs.append($0) }
                
                    expect { () -> Void in
                        _ = container ~> (Service0.self, name: "NonExistentService")
                    }.to(throwAssertion())
                
                    expect(logs.count) == 1
            }
            #endif
            
            it("resolves service using infix operator with 1 dynamic argument") {
                let service = container ~> (Service1.self, argument: "Arg1")
                expect(service).toNot(beNil())
            }
            
            it("resolves service using infix operator with name and 1 dynamic argument") {
                let service = container ~> (Service1.self, name: "MyService1", argument: "Arg1")
                expect(service).toNot(beNil())
            }
            
            it("resolves service using infix operator with 2 dynamic arguments") {
                let service = container ~> (Service2.self, arguments: ("Arg1", 5))
                expect(service).toNot(beNil())
            }
            
            it("resolves service using infix operator with name and 2 dynamic arguments") {
                let service: Service2 = container ~> (Service2.self, name: "MyService2", arguments: ("Arg1", 5))
                expect(service).toNot(beNil())
            }
            
            it("resolves service using infix operator with 3 dynamic arguments") {
                let service = container ~> (Service3.self, arguments: ("Arg1", 5, 0.2))
                expect(service).toNot(beNil())
            }
            
            it("resolves service using infix operator with name and 3 dynamic arguments") {
                let service = container ~> (Service3.self, name: "MyService3", arguments: ("Arg1", 5, 0.2))
                expect(service).toNot(beNil())
            }
            
            it("resolves service using deprecated infix operators") {
                //This call has been removed
                //let service2 = container ~> (Service2.self, arguments: "Arg1", 5)
                
                //This never worked
                //let service2_name: Service2 = container ~> (Service2.self, name: "MyService2", arguments: "Arg1", 5)
                
                //This is deprecated
                let service3 = container ~> (Service3.self, arguments: "Arg1", 5, 0.2)
                let service3_name = container ~> (Service3.self, name: "MyService3", arguments: "Arg1", 5, 0.2)
                
                
                expect(service3).toNot(beNil())
                expect(service3_name).toNot(beNil())
            }

            it("resolves optional service with postfix operator") {
                let service: Service0? = container~>
                expect(service).notTo(beNil())
            }

            it("resolves optional service using infix operator") {
                let service = container ~> Service0?.self
                expect(service).notTo(beNil())
            }

            it("resolves unwrapped service with postfix operator") {
                let service: Service0! = container~>
                expect(service).notTo(beNil())
            }

            it("resolves unwrapped service using infix operator") {
                let service = container ~> Service0!.self
                expect(service).notTo(beNil())
            }
        }
	}
	
}
