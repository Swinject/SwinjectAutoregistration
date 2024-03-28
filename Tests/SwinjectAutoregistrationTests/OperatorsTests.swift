import XCTest

import Swinject
import SwinjectAutoregistration


class OperatorsTests: XCTestCase {
    class MockProtocolA: ProtocolA {}
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


    var container: Container!

    override func setUpWithError() throws {
        container = Container()
        container.register(Service0.self) { r in Service0() }
        container.register(Service0.self, name: "MyService") { r in Service0() }
        container.register(Service1.self) { r, a in Service1(a: a) }
        container.register(Service1.self, name: "MyService1") { r, a in Service1(a: a) }
        container.register(Service2.self) { r, a, b in Service2(a: a, b: b) }
        container.register(Service2.self, name: "MyService2") { r, a, b in Service2(a: a, b: b) }
        container.register(Service3.self) { r, a, b, c in Service3(a: a, b: b, c: c) }
        container.register(Service3.self, name: "MyService3") { r, a, b, c in Service3(a: a, b: b, c: c) }
        container.register(ProtocolA.self) { r in MockProtocolA() }
    }

    func testResolvingServiceUsingPostfixOperator() {
        let service: Service0 = container~>
        XCTAssertNotNil(service)
    }

    func testResolvingServiceUsingInfixOperator() {
        let service = container ~> Service0.self
        XCTAssertNotNil(service)
    }

    func testResolvingServiceUsingInfixOperatorWithName() {
        let service = container ~> (Service0.self, name: "MyService")
        XCTAssertNotNil(service)
    }

    #if !SWIFT_PACKAGE && arch(x86_64)
    func testFailingWithMessageOnUnresolvableService() {
        // For now we just comment out the test for `precondition()` because we cannot do it without depending on Nimble or CwlPreconditionTesting.

        // var logs = [String]()
        // Container.loggingFunction = { logs.append($0) }
        //
        // let expectation: Expectation<Void> = expect {
        //    _ = container ~> (Service0.self, name: "NonExistentService")
        // }
        //
        // XCTAssertEqual(logs.count, 1)
    }
    #endif

    func testResolvingServiceUsingInfixOperatorWith1DynamicArgument() {
        let service = container ~> (Service1.self, argument: "Arg1")
        XCTAssertNotNil(service)
    }

    func testResolvingServiceUsingInfixOperatorWithNameAnd1DynamicArgument() {
        let service = container ~> (Service1.self, name: "MyService1", argument: "Arg1")
        XCTAssertNotNil(service)
    }

    func testResolvingServiceUsingInfixOperatorWith2DynamicArguments() {
        let service = container ~> (Service2.self, arguments: ("Arg1", 5))
        XCTAssertNotNil(service)
    }

    func testResolvingServiceUsingInfixOperatorWithNameAnd2DynamicArguments() {
        let service: Service2 = container ~> (Service2.self, name: "MyService2", arguments: ("Arg1", 5))
        XCTAssertNotNil(service)
    }

    func testResolvingServiceUsingInfixOperatorWith3DynamicArguments() {
        let service = container ~> (Service3.self, arguments: ("Arg1", 5, 0.2))
        XCTAssertNotNil(service)
    }

    func testResolvingServiceUsingInfixOperatorWithNameAnd3DynamicArguments() {
        let service = container ~> (Service3.self, name: "MyService3", arguments: ("Arg1", 5, 0.2))
        XCTAssertNotNil(service)
    }

    func testResolvingServiceUsingDeprecatedInfixOperators() {
        //This call has been removed
        //let service2 = container ~> (Service2.self, arguments: "Arg1", 5)

        //This never worked
        //let service2_name: Service2 = container ~> (Service2.self, name: "MyService2", arguments: "Arg1", 5)

        //This is deprecated
        let service3 = container ~> (Service3.self, arguments: "Arg1", 5, 0.2)
        let service3_name = container ~> (Service3.self, name: "MyService3", arguments: "Arg1", 5, 0.2)


        XCTAssertNotNil(service3)
        XCTAssertNotNil(service3_name)
    }

    func testResolvingOptionalServiceWithPostfixOperator() {
        let service: Service0? = container~>
        XCTAssertNotNil(service)
    }

    func testResolvingThruProtocol() {
        let service: MockProtocolA? = container ~~> ProtocolA.self
        XCTAssertNotNil(service)
    }

    func testResolvingOptionalServiceUsingInfixOperator() {
        let service = container ~> Service0?.self
        XCTAssertNotNil(service)
    }

}
