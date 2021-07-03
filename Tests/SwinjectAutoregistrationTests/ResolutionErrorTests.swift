#if !SWIFT_PACKAGE

import XCTest
@testable import SwinjectAutoregistration

extension ResolutionError: Equatable {}

public func ==(lhs: ResolutionError, rhs: ResolutionError) -> Bool {
    switch (lhs, rhs){
    case (.tooManyDependencies(let ldependencyCount), .tooManyDependencies(let rdependencyCount)):
        return ldependencyCount == rdependencyCount
    }
}

class ResolutionErrorTests: XCTestCase {
	
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
    
    class Service1 {
        init(a: DependencyA){}
    }
    
    class Service2 {
        init(a: DependencyA, b: DependencyB){}
    }
    
    class Service3 {
        init(a: DependencyA, b: DependencyB, c: DependencyC){}
    }
    
    class Service9 {
        init(a: DependencyA, b: DependencyB, c: DependencyC, d: DependencyD, e: DependencyE, f: DependencyF, g: DependencyG, h: DependencyH, i: DependencyI){}
    }
    
    class Service21 {
        init(a: DependencyA, b: DependencyB, c: DependencyC, d: DependencyD, e: DependencyE, f: DependencyF, g: DependencyG, h: DependencyH, i: DependencyI, j: DependencyJ, k: DependencyA, l: DependencyB, m: DependencyC, n: DependencyD, o: DependencyE, p: DependencyF, q: DependencyG, r: DependencyH, s: DependencyI, t: DependencyJ, u: DependencyA){}
    }
    
    class OptionalService {
        init(a: DependencyB?){}
    }

    class UnwrappedService {
        init(a: DependencyA!, b: DependencyB){}
    }
    
    class BadService {
        init(a: DependencyA, b: DependencyB, c: DependencyC!, d: DependencyD?, e: DependencyE!, f: DependencyF, g: DependencyG, h: DependencyH?, i: DependencyI, j: DependencyJ, k: DependencyA, l: DependencyB, m: DependencyC, n: DependencyD, o: DependencyE, p: DependencyF, q: DependencyG, r: DependencyH, s: DependencyI, t: DependencyJ, u: DependencyA){}
    }
    
    class OptionalSingleTupleService {
        init(tuple: (a: DependencyA?, b: DependencyB?, c: DependencyC?)){}
    }
    
    class OptionalMutipleTupleService {
        init(tupleA: (a: DependencyA?, b: DependencyB?, c: DependencyC?), tupleB: (a: DependencyA?, b: DependencyB?)){}
    }
    
    class NestedClosureService {
        init(closure: (((String) -> String)?) -> String){}
    }
    
    class OptionalNestedClosureService {
        init(closure: ((((String) -> String)?) -> String)?){}
    }

    
    func testShowingWarningForServiceWithTooManyDependencies() {
        let w = resolutionErrors(forInitializer: Service21.init)
        XCTAssertEqual(w.first, ResolutionError.tooManyDependencies(21))
    }
    
    func testNotShowingWarningForSingleDependency() {
        let w = resolutionErrors(forInitializer: Service1.init)
        XCTAssertEqual(w.count, 0)
    }

    func testShowingWarningForServiceWith9Dependencies() {
        let w = resolutionErrors(forInitializer: Service9.init)
        XCTAssertEqual(w.count, 0)
    }
    
    func testShowingWarningForServiceWithOptionalDependency() {
        let w = resolutionErrors(forInitializer: OptionalService.init)
        XCTAssertEqual(w.count, 0)
    }

    func testNotShowingWarningForServiceWithUnwrappedDependency() {
        let w = resolutionErrors(forInitializer: UnwrappedService.init)
        XCTAssertEqual(w.count, 0)
    }

    // This might fail
    // Single argument tuple looks exactly the same as multiple arguments when printed
    func testNotShowingWarningForSingleArgumentTupleOfOptonals() {
        let w = resolutionErrors(forInitializer: OptionalSingleTupleService.init)
        XCTAssertEqual(w.count, 0)
    }
    
    func testNotShowingWarningForMultiipleArgumentTuplesOfOptionals() {
        let w = resolutionErrors(forInitializer: OptionalMutipleTupleService.init)
        XCTAssertEqual(w.count, 0)
    }
    
    func testNotShowingWarningForNestedClosures() {
        let w = resolutionErrors(forInitializer: NestedClosureService.init)
        XCTAssertEqual(w.count, 0)
    }
    
    func testNotShowingWarningForOptionalClosure() {
        let w = resolutionErrors(forInitializer: OptionalNestedClosureService.init)
        XCTAssertEqual(w.count, 0)
    }

}
#endif
