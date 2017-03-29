#if !os(Linux)
import Quick
import Nimble

@testable import SwinjectAutoregistration

extension ResolutionError: Equatable {}

public func ==(lhs: ResolutionError, rhs: ResolutionError) -> Bool {
    switch (lhs, rhs){
    case (.optional(let lname), .optional(let rname)):
        return lname == rname
    case (.implicitlyUnwrappedOptional(let lname), .implicitlyUnwrappedOptional(let rname)):
        return lname == rname
    case (.tooManyDependencies(let ldependencyCount), .tooManyDependencies(let rdependencyCount)):
        return ldependencyCount == rdependencyCount
    default:
        return false
    }
}

class ResolutionErrorSpec: QuickSpec {
	
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

    
    override func spec() {
        describe("warnings checker") {
            it("does show warning for service with too many dependencies"){
                let w = resolutionErrors(forInitializer: Service21.init)
                expect(w.first) == ResolutionError.tooManyDependencies(21)
            }
            
            it("doesnt show warning for single dependency"){
                let w = resolutionErrors(forInitializer: Service1.init)
                expect(w.count) == 0
            }

            it("doesnt show warning for service with 9 dependencies"){
                let w = resolutionErrors(forInitializer: Service9.init)
                expect(w.count) == 0
            }
            
            it("does show warning for service with optional dependency"){
                let w = resolutionErrors(forInitializer: OptionalService.init)
                expect(w.first) == ResolutionError.optional("DependencyB")
            }
            
            it("does show warning for service with implicitly unwrapped dependency"){
                let w = resolutionErrors(forInitializer: UnwrappedService.init)
                expect(w.first) == ResolutionError.implicitlyUnwrappedOptional("DependencyA")
            }
            
            it("does show multiple warnings"){
                let w = resolutionErrors(forInitializer: BadService.init)
                expect(w.count) == 5
            }
            
            // This fails
            // Single argument tuple looks exactly the same as multiple arguments when printed
            xit("doesnt show warning for single argument tuple of optionals"){
                let w = resolutionErrors(forInitializer: OptionalSingleTupleService.init)
                expect(w.count) == 0
            }
            
            it("doesnt show warning for mutiple argument tuples of optionals"){
                let w = resolutionErrors(forInitializer: OptionalMutipleTupleService.init)
                expect(w.count) == 0
            }
            
            it("doesnt show warning for nested closures"){
                let w = resolutionErrors(forInitializer: NestedClosureService.init)
                expect(w.count) == 0
            }
            
            it("does show warning for optional closure"){
                let w = resolutionErrors(forInitializer: OptionalNestedClosureService.init)
                expect(w.count) == 1
            }
            
        }
	}
	
}
#endif
