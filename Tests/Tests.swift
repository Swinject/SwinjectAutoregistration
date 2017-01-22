// https://github.com/Quick/Quick

import Quick
import Nimble
import SwinjectAutoregistration
import Swinject

class AutoregistrationSpec: QuickSpec {
    
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
    
    class OptionalService {
        init(a: DependencyA?){}
    }
    
    class UnwrappedService {
        init(a: DependencyA!){}
    }
    
    
    override func spec() {
        describe("autoregistration") {
            
            var container: Container!
            
            beforeEach {
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
            
            it("registers service with one dependency") {
                container.autoregister(Service1.self, initializer: Service1.init)
                let service = container.resolve(Service1.self)
                expect(service).notTo(beNil())
            }
            
            it("registers service with two dependencies") {
                container.autoregister(Service2.self, initializer: Service2.init)
                let service = container.resolve(Service2.self)
                expect(service).notTo(beNil())
            }
            
            it("registers service with three dependencies") {
                container.autoregister(Service3.self, initializer: Service3.init)
                let service = container.resolve(Service3.self)
                expect(service).notTo(beNil())
            }
            
            it("registers service with four dependencies") {
                container.autoregister(Service4.self, initializer: Service4.init)
                let service = container.resolve(Service4.self)
                expect(service).notTo(beNil())
            }
            
            it("registers service with five dependencies") {
                container.autoregister(Service5.self, initializer: Service5.init)
                let service = container.resolve(Service5.self)
                expect(service).notTo(beNil())
            }
            
            it("registers service with six dependencies") {
                container.autoregister(Service6.self, initializer: Service6.init)
                let service = container.resolve(Service6.self)
                expect(service).notTo(beNil())
            }
            
            it("registers service with seven dependencies") {
                container.autoregister(Service7.self, initializer: Service7.init)
                let service = container.resolve(Service7.self)
                expect(service).notTo(beNil())
            }
            
            it("registers service with eight dependencies") {
                container.autoregister(Service8.self, initializer: Service8.init)
                let service = container.resolve(Service8.self)
                expect(service).notTo(beNil())
            }
            
            it("registers service with nine dependencies") {
                container.autoregister(Service9.self, initializer: Service9.init)
                let service = container.resolve(Service9.self)
                expect(service).notTo(beNil())
            }

            //TODO: Find a way how to test that assertion was thrown
            //This should fail because we generate register functions only for 10 dependencies
            xit("fails to register service with ten dependencies") {
                container.autoregister(Service10.self, initializer: Service10.init)
                let service = container.resolve(Service10.self)
                expect(service).notTo(beNil())
            }
            
            xit("fails to register service with optional dependency") {
                container.autoregister(OptionalService.self, initializer: OptionalService.init)
                let service = container.resolve(OptionalService.self)
                expect(service).notTo(beNil())
            }
            
            xit("fails to register service with unwrapped dependency") {
                container.autoregister(UnwrappedService.self, initializer: UnwrappedService.init)
                let service = container.resolve(UnwrappedService.self)
                expect(service).notTo(beNil())
            }
        }
    }
}
