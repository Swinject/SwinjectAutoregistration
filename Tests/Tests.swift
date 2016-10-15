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
    
    
    override func spec() {
        describe("autoregistration") {
            
            var container: Container!
            
            beforeEach {
                container = Container()
                
                container.auto.register(DependencyA.self, initializer: DependencyA.init)
                container.auto.register(DependencyB.self, initializer: DependencyB.init)
                container.auto.register(DependencyC.self, initializer: DependencyC.init)
                container.auto.register(DependencyD.self, initializer: DependencyD.init)
                container.auto.register(DependencyE.self, initializer: DependencyE.init)
                container.auto.register(DependencyF.self, initializer: DependencyF.init)
                container.auto.register(DependencyG.self, initializer: DependencyG.init)
                container.auto.register(DependencyH.self, initializer: DependencyH.init)
                container.auto.register(DependencyI.self, initializer: DependencyI.init)
                container.auto.register(DependencyJ.self, initializer: DependencyJ.init)
            }
            
            it("registers service with one dependency") {
                container.auto.register(Service1.self, initializer: Service1.init)
                let service = container.resolve(Service1.self)
                expect(service).notTo(beNil())
            }
            
            it("registers service with two dependencies") {
                container.auto.register(Service2.self, initializer: Service2.init)
                let service = container.resolve(Service2.self)
                expect(service).notTo(beNil())
            }
            
            it("registers service with three dependencies") {
                container.auto.register(Service3.self, initializer: Service3.init)
                let service = container.resolve(Service3.self)
                expect(service).notTo(beNil())
            }
            
            it("registers service with four dependencies") {
                container.auto.register(Service4.self, initializer: Service4.init)
                let service = container.resolve(Service4.self)
                expect(service).notTo(beNil())
            }
            
            it("registers service with five dependencies") {
                container.auto.register(Service5.self, initializer: Service5.init)
                let service = container.resolve(Service5.self)
                expect(service).notTo(beNil())
            }
            
            it("registers service with six dependencies") {
                container.auto.register(Service6.self, initializer: Service6.init)
                let service = container.resolve(Service6.self)
                expect(service).notTo(beNil())
            }
            
            it("registers service with seven dependencies") {
                container.auto.register(Service7.self, initializer: Service7.init)
                let service = container.resolve(Service7.self)
                expect(service).notTo(beNil())
            }
            
            it("registers service with eight dependencies") {
                container.auto.register(Service8.self, initializer: Service8.init)
                let service = container.resolve(Service8.self)
                expect(service).notTo(beNil())
            }
            
            it("registers service with nine dependencies") {
                container.auto.register(Service9.self, initializer: Service9.init)
                let service = container.resolve(Service9.self)
                expect(service).notTo(beNil())
            }

            //TODO: Find a way how to test that assertion was thrown
            //This should fail because we generate register functions only for 10 dependencies
//            it("registers service with ten dependencies") {
//                container.register(initializer: Service10.init, service: Service10.self)
//                let service = container.resolve(Service10.self)
//                expect(service).notTo(beNil())
//            }
        }
    }
}
