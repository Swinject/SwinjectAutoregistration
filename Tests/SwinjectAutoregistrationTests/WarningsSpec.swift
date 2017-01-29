import Quick
import Nimble

@testable import SwinjectAutoregistration

extension Warning: Equatable {}

public func ==(lhs: Warning, rhs: Warning) -> Bool {
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

class WarningsSpec: QuickSpec {
	
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
    
    class Service10 {
        init(a: DependencyA, b: DependencyB, c: DependencyC, d: DependencyD, e: DependencyE, f: DependencyF, g: DependencyG, h: DependencyH, i: DependencyI, j: DependencyJ){}
    }
    
    class OptionalService {
        init(a: DependencyB?){}
    }

    class UnwrappedService {
        init(a: DependencyA!, b: DependencyB){}
    }
    
    class BadService {
        init(a: DependencyA, b: DependencyB, c: DependencyC!, d: DependencyD?, e: DependencyE!, f: DependencyF, g: DependencyG, h: DependencyH?, i: DependencyI, j: DependencyJ){}
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
            //fails on linux
            it("does show warning for service with more than 9 dependencies"){
                let w = warnings(forInitializer: Service10.init)
                expect(w.first) == Warning.tooManyDependencies(10)
            }
            
            it("doesnt show warning for single dependency"){
                let w = warnings(forInitializer: Service1.init)
                expect(w.count) == 0
            }

            it("doesnt show warning for service with 9 dependencies"){
                let w = warnings(forInitializer: Service9.init)
                expect(w.count) == 0
            }
            
            //fails on linux
            it("does show warning for service with optional dependency"){
                let w = warnings(forInitializer: OptionalService.init)
                expect(w.first) == Warning.optional("DependencyB")
            }
            
            //fails on linux
            it("does show warning for service with implicitly unwrapped dependency"){
                let w = warnings(forInitializer: UnwrappedService.init)
                expect(w.first) == Warning.implicitlyUnwrappedOptional("DependencyA")
            }
            
            //fails on linux
            it("does show multiple warnings"){
                let w = warnings(forInitializer: BadService.init)
                expect(w.count) == 5
            }
            
            // This fails
            // Single argument tuple looks exactly the same as multiple arguments when printed
            xit("doesnt show warning for single argument tuple of optionals"){
                let w = warnings(forInitializer: OptionalSingleTupleService.init)
                expect(w.count) == 0
            }
            
            it("doesnt show warning for mutiple argument tuples of optionals"){
                let w = warnings(forInitializer: OptionalMutipleTupleService.init)
                expect(w.count) == 0
            }
            
            it("doesnt show warning for nested closures"){
                let w = warnings(forInitializer: NestedClosureService.init)
                expect(w.count) == 0
            }
            
            //fails on linux
            it("does show warning for optional closure"){
                let w = warnings(forInitializer: OptionalNestedClosureService.init)
                expect(w.count) == 1
            }
            
        }
	}
	
}
