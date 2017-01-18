import Quick
import Nimble
import Swinject

@testable import SwinjectAutoregistration
class OptionalSpec: QuickSpec {
    
	override func spec() {
		describe("optional helper") {
            
            it("does recognize explicit optional"){
                let c = Optional<String>.self
                let result = isOptional(c.self)
                expect(result) == true
            }
            
            it("does recognize questionmark optional"){
                let c: String? = ""
                let result = isOptional(type(of:c))
                expect(result) == true
            }
            
            it("does not recognize nested optional"){
                let c = [Int?].self
                let result = isOptional(c)
                expect(result) == false
            }
            
            it("does recognize optional tuple"){
                let c: (String, String)? = ("a", "b")
                let result = isOptional(type(of: c))
                expect(result) == true
            }
            
            it("does not recognize tuple with optional elements"){
                let c: (String?, String?) = ("a", "b")
                let result = isOptional(type(of: c))
                expect(result) == false
            }
        }
        
        class Dependency {
            init(second: Int, _ b: Double, _ c: String?, _ d: Float){}
            init(first: Int?, _ b: Double?, _ c: String, _ d: Float){}
        }
        
        func optionalServiceGenericsStub<Service, A, B, C, D>(initializer: (A, B, C, D) -> Service, services a: A?, _ b: B?, _ c: C?, _ d: D?) -> String? {
            return optionalService(a, b, c, d)
        }
        
        
        describe("optional checker") {
            it("does found optional service"){
                let optional = optionalServiceGenericsStub(initializer: Dependency.init, services: 0, 2.0, "", 5)
                expect(optional) == "Optional<String>"
            }
            
            it("does found optional service with nil"){
                let optional = optionalServiceGenericsStub(initializer: Dependency.init, services: 0, 2.0, nil, 5)
                expect(optional) == "Optional<String>"
            }
            
            it("does found optional in first to last order"){
                let optional = optionalServiceGenericsStub(initializer: Dependency.init, services: nil, nil, "C", 5)
                expect(optional) == "Optional<Int>"
            }
        }
	}
	
}
