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
                container.register(initializer: DependencyA.init, service: DependencyA.self)
                container.register(initializer: DependencyB.init, service: DependencyB.self)
                container.register(initializer: DependencyC.init, service: DependencyC.self)
                container.register(initializer: DependencyD.init, service: DependencyD.self)
                container.register(initializer: DependencyE.init, service: DependencyE.self)
                container.register(initializer: DependencyF.init, service: DependencyF.self)
                container.register(initializer: DependencyG.init, service: DependencyG.self)
                container.register(initializer: DependencyH.init, service: DependencyH.self)
                container.register(initializer: DependencyI.init, service: DependencyI.self)
                container.register(initializer: DependencyJ.init, service: DependencyJ.self)
            }
            
            it("registers service with one dependency") {
                container.register(initializer: Service1.init, service: Service1.self)
                let service = container.resolve(Service1.self)
                expect(service).notTo(beNil())
            }
            
            it("registers service with two dependencies") {
                container.register(initializer: Service2.init, service: Service2.self)
                let service = container.resolve(Service2.self)
                expect(service).notTo(beNil())
            }
            
            it("registers service with three dependencies") {
                container.register(initializer: Service3.init, service: Service3.self)
                let service = container.resolve(Service3.self)
                expect(service).notTo(beNil())
            }
            
            it("registers service with four dependencies") {
                container.register(initializer: Service4.init, service: Service4.self)
                let service = container.resolve(Service4.self)
                expect(service).notTo(beNil())
            }
            
            it("registers service with five dependencies") {
                container.register(initializer: Service5.init, service: Service5.self)
                let service = container.resolve(Service5.self)
                expect(service).notTo(beNil())
            }
            
            it("registers service with six dependencies") {
                container.register(initializer: Service6.init, service: Service6.self)
                let service = container.resolve(Service6.self)
                expect(service).notTo(beNil())
            }
            
            it("registers service with seven dependencies") {
                container.register(initializer: Service7.init, service: Service7.self)
                let service = container.resolve(Service7.self)
                expect(service).notTo(beNil())
            }
            
            it("registers service with eight dependencies") {
                container.register(initializer: Service8.init, service: Service8.self)
                let service = container.resolve(Service8.self)
                expect(service).notTo(beNil())
            }
            
            it("registers service with nine dependencies") {
                container.register(initializer: Service9.init, service: Service9.self)
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
