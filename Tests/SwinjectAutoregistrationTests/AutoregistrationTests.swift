//
//  AutoregistrationTests.swift
//  SwinjectAutoregistration
//
//  Created by Yoichi Tagaya on 2021/07/03.
//  Copyright © 2021 Swinject Contributors. All rights reserved.
//

import XCTest
import SwinjectAutoregistration
import Swinject

class AutoregistrationTests: XCTestCase {
    class DependencyA {}
    class DependencyB {}
    class DependencyC {}
    class DependencyD {}
    class DependencyE {}
    class DependencyF {}
    class DependencyG {}
    class DependencyH {}
    class DependencyI {}
    class DependencyJ {}

    class Service0 {
        init(){}
    }
    
    class Service1 {
        init(a: DependencyA){}
    }
    
    class Service2 {
        init(a: DependencyA, b: DependencyB){}
    }
    
    class Service3 {
        init(a: DependencyA, b: DependencyB, c: DependencyC){}
    }
    
    class Service4 {
        init(a: DependencyA, b: DependencyB, c: DependencyC, d: DependencyD){}
    }
    
    class Service5 {
        init(a: DependencyA, b: DependencyB, c: DependencyC, d: DependencyD, e: DependencyE){}
    }
    
    class Service6 {
        init(a: DependencyA, b: DependencyB, c: DependencyC, d: DependencyD, e: DependencyE, f: DependencyF){}
    }
    
    class Service7 {
        init(a: DependencyA, b: DependencyB, c: DependencyC, d: DependencyD, e: DependencyE, f: DependencyF, g: DependencyG){}
    }
    
    class Service8 {
        init(a: DependencyA, b: DependencyB, c: DependencyC, d: DependencyD, e: DependencyE, f: DependencyF, g: DependencyG, h: DependencyH){}
    }
    
    class Service9 {
        init(a: DependencyA, b: DependencyB, c: DependencyC, d: DependencyD, e: DependencyE, f: DependencyF, g: DependencyG, h: DependencyH, i: DependencyI){}
    }
    
    class Service10 {
        init(a: DependencyA, b: DependencyB, c: DependencyC, d: DependencyD, e: DependencyE, f: DependencyF, g: DependencyG, h: DependencyH, i: DependencyI, j: DependencyJ){}
    }
    
    class Service20 {
        init(a: DependencyA, b: DependencyB, c: DependencyC, d: DependencyD, e: DependencyE, f: DependencyF, g: DependencyG, h: DependencyH, i: DependencyI, j: DependencyJ, k: DependencyA, l: DependencyB, m: DependencyC, n: DependencyD, o: DependencyE, p: DependencyF, q: DependencyG, r: DependencyH, s: DependencyI, t: DependencyJ){}
    }
    
    class Service21 {
        init(a: DependencyA, b: DependencyB, c: DependencyC, d: DependencyD, e: DependencyE, f: DependencyF, g: DependencyG, h: DependencyH, i: DependencyI, j: DependencyJ, k: DependencyA, l: DependencyB, m: DependencyC, n: DependencyD, o: DependencyE, p: DependencyF, q: DependencyG, r: DependencyH, s: DependencyI, t: DependencyJ, u: DependencyA){}
    }
    
    class OptionalService {
        init(a: DependencyA?){}
    }
    
    class UnwrappedService {
        init(a: DependencyA!){}
    }
    
    class SameArgumentsService {
        let nameA: String; let nameB: String
        init(a: DependencyA, nameA: String, age: Int, nameB: String){
            self.nameA = nameA; self.nameB = nameB
        }
    }
    
    var container: Container!
    
    override func setUpWithError() throws {
        container = Container()
        
        container.autoregister(DependencyA.self, initializer: DependencyA.init)
        container.autoregister(DependencyB.self, initializer: DependencyB.init)
        container.autoregister(DependencyC.self, initializer: DependencyC.init)
        container.autoregister(DependencyD.self, initializer: DependencyD.init)
        container.autoregister(DependencyE.self, initializer: DependencyE.init)
        container.autoregister(DependencyF.self, initializer: DependencyF.init)
        container.autoregister(DependencyG.self, initializer: DependencyG.init)
        container.autoregister(DependencyH.self, initializer: DependencyH.init)
        container.autoregister(DependencyI.self, initializer: DependencyI.init)
        container.autoregister(DependencyJ.self, initializer: DependencyJ.init)
    }

    func testServiceIsRegisteredWithZeroDependencies() {
        container.autoregister(Service0.self, initializer: Service0.init)
        let service = container.resolve(Service0.self)
        XCTAssertNotNil(service)
    }
    
    func testServiceIsRegisteredWithOneDependency() {
        container.autoregister(Service1.self, initializer: Service1.init)
        let service = container.resolve(Service1.self)
        XCTAssertNotNil(service)
    }
    
    func testServiceIsRegisteredWithTwoDependencies() {
        container.autoregister(Service2.self, initializer: Service2.init)
        let service = container.resolve(Service2.self)
        XCTAssertNotNil(service)
    }
    
    func testServiceIsRegisteredWithThreeDependencies() {
        container.autoregister(Service3.self, initializer: Service3.init)
        let service = container.resolve(Service3.self)
        XCTAssertNotNil(service)
    }
    
    func testServiceIsRegisteredWithFourDependencies() {
        container.autoregister(Service4.self, initializer: Service4.init)
        let service = container.resolve(Service4.self)
        XCTAssertNotNil(service)
    }
    
    func testServiceIsRegisteredWithFiveDependencies() {
        container.autoregister(Service5.self, initializer: Service5.init)
        let service = container.resolve(Service5.self)
        XCTAssertNotNil(service)
    }
    
    func testServiceIsRegisteredWithSixDependencies() {
        container.autoregister(Service6.self, initializer: Service6.init)
        let service = container.resolve(Service6.self)
        XCTAssertNotNil(service)
    }
    
    func testServiceIsRegisteredWithSevenDependencies() {
        container.autoregister(Service7.self, initializer: Service7.init)
        let service = container.resolve(Service7.self)
        XCTAssertNotNil(service)
    }
    
    func testServiceIsRegisteredWithEightDependencies() {
        container.autoregister(Service8.self, initializer: Service8.init)
        let service = container.resolve(Service8.self)
        XCTAssertNotNil(service)
    }
    
    func testServiceIsRegisteredWithNineDependencies() {
        container.autoregister(Service9.self, initializer: Service9.init)
        let service = container.resolve(Service9.self)
        XCTAssertNotNil(service)
    }
    
    func testServiceIsRegisteredWithTwentyDependencies() {
        container.autoregister(Service20.self, initializer: Service20.init)
        let service = container.resolve(Service20.self)
        XCTAssertNotNil(service)
    }
    
    func testServiceIsRegisteredWithOneDynamicArgument() {
        container.autoregister(Service2.self, argument: DependencyB.self, initializer: Service2.init)
        let service = container.resolve(Service2.self, argument: DependencyB())
        XCTAssertNotNil(service)
    }
    
    func testServiceIsRegisteredWithTwoDynamicArguments() {
        container.autoregister(Service3.self, arguments: DependencyB.self, DependencyC.self, initializer: Service3.init)
        let service = container.resolve(Service3.self, arguments: DependencyB(), DependencyC())
        XCTAssertNotNil(service)
    }
    
    func testServiceIsRegisteredWithThreeDynamicArguments() {
        container.autoregister(Service4.self, arguments: DependencyB.self, DependencyC.self, DependencyD.self, initializer: Service4.init)
        let service = container.resolve(Service4.self, arguments: DependencyB(), DependencyC(), DependencyD())
        XCTAssertNotNil(service)
    }
    
    func testServiceIsRegisteredWithFourDynamicArguments() {
        container.autoregister(Service4.self, arguments: DependencyC.self, DependencyD.self, DependencyB.self, initializer: Service4.init)
        let service = container.resolve(Service4.self, arguments: DependencyC(), DependencyD(), DependencyB())
        XCTAssertNotNil(service)
    }

    func testServiceIsRegisteredWithOptionalDependencies() {
        container.autoregister(OptionalService.self, initializer: OptionalService.init)
        let service = container.resolve(OptionalService.self)
        XCTAssertNotNil(service)
    }

    func testServiceIsRegisteredWithUnwrrappedDependencies() {
        container.autoregister(UnwrappedService.self, initializer: UnwrappedService.init)
        let service = container.resolve(UnwrappedService.self)
        XCTAssertNotNil(service)
    }

    #if !SWIFT_PACKAGE && arch(x86_64)
    func testAssertionIsThrownWhenSameTypeArgumentsArePassed() {
        // For now we just comment out the test for `precondition()` because we cannot do it without depending on Nimble or CwlPreconditionTesting.
        
        // container.autoregister(SameArgumentsService.self, arguments: String.self, Int.self, String.self, initializer: SameArgumentsService.init)
    }

    func testAssertionIsThrownWhenTryingToResolveServiceWithTooManyDependencies() {
        // For now we just comment out the test for `precondition()` because we cannot do it without depending on Nimble or CwlPreconditionTesting.

        // container.autoregister(Service21.self, initializer: Service21.init)
        // _ = container.resolve(Service21.self)
    }
    #endif
    
    func testLoggingFunctionIsNotErased() {
        var logs: [String] = []
        Container.loggingFunction = { logs.append($0) }
        
        container.autoregister(Service1.self, initializer: Service1.init)
        let service = container.resolve(Service1.self)
        
        XCTAssertNotNil(service)
        XCTAssertEqual(logs.count, 0)
        
        let unresolvableService = container.resolve(String.self)
        XCTAssertNil(unresolvableService)
        XCTAssertEqual(logs.count, 1)
    }

    #if !SWIFT_PACKAGE
    func testAnyLogsAreNotLostWhileMultithreading() {
        var logs: [String] = []
        Container.loggingFunction = { logs.append($0) }
        
        container.autoregister(Service1.self, initializer: Service1.init)
        
        let resolutionsCount = 1000
        
        let queue = DispatchQueue(label: "queue", attributes: .concurrent)
        
        let container = self.container!
        queue.async {
            (0..<resolutionsCount).forEach { _ in
                _ = container.synchronize().resolve(Service1.self)
            }
        }
        
        queue.async {
            (0..<resolutionsCount).forEach { _ in
                //Fails every time
                _ = container.synchronize().resolve(String.self)
            }
        }

        assertEventually {
            logs.count == resolutionsCount
        }
    }
    #endif
}

// Similar to toEventually of Nimble.
 private func assertEventually(expression: @escaping () -> Bool) {
     let expectation = XCTestExpectation()
     DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
         XCTAssert(expression())
         expectation.fulfill()
     }
     XCTWaiter().wait(for: [expectation], timeout: 1.0)
 }
