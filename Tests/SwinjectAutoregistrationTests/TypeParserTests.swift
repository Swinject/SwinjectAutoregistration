//
//  ScannerTests.swift
//  SwinjectAutoregistration
//
//  Created by Tomas Kohout on 20/01/2017.
//  Copyright © 2017 Swinject Contributors. All rights reserved.
//
#if !os(Linux)
import XCTest
import Quick
import Nimble

protocol ProtocolA{}
protocol ProtocolB{}

class ClassA{
    class Nested{}
}

class _x0😪name²〡yﷰ {}

class `protocol` {}

@testable import SwinjectAutoregistration

class TypeParserSpec: QuickSpec {
    
    //Helpers
    func identifier(_ name: String, generics: [Type] = []) -> Type {
        return Type.identifier(TypeIdentifier(name: name, genericTypes: generics))
    }
    
    func generic_identifier(_ name: String, generics: [String]) -> Type {
        return Type.identifier(TypeIdentifier(name: name, genericTypes: generics.map { identifier($0) }))
    }
    
    override func spec() {
        describe("autoregistration") {
            
            it("scans type identifier") {
                let string = "\(_x0😪name²〡yﷰ.self)"
                let parser = TypeParser(string: string)
                let type = parser.parseType()
                
                XCTAssertEqual(type, self.identifier(string))
            }
            
            it("doesnt scan non type identifier") {
                let string = "1Array"
                let parser = TypeParser(string: string)
                let type = parser.parseType()
                
                XCTAssertEqual(type, nil)
            }
            
            
            it("scans subtype identifier") {
                let string = "\(ClassA.Nested.self)"
                let parser = TypeParser(string: string)
                let type = parser.parseType()
                
                XCTAssertEqual(type, self.identifier("Nested"))
            }
            
            it("scans array type") {
                let string = "\([String].self)"
                let parser = TypeParser(string: string)
                let type = parser.parseType()
                
                XCTAssertEqual(type, self.generic_identifier("Array", generics: ["String"]))
            }
            
            it("scans generic type with multiple arguments") {
                let string = "\([Int: String].self)"
                let parser = TypeParser(string: string)
                let type = parser.parseType()
                
                XCTAssertEqual(type, self.generic_identifier("Dictionary", generics: ["Int", "String"]))
            }
            
            it("scans tuple type") {
                let string = "\((name: String, count: Int).self)"
                let parser = TypeParser(string: string)
                let type = parser.parseType()
                
                XCTAssertEqual(type, Type.tuple([self.identifier("String"), self.identifier("Int")]))
            }
            
            it("scans tuple of tuples") {
                let string = "\(((String, Int, Double), [String]).self)"
                let parser = TypeParser(string: string)
                let type = parser.parseType()
                
                XCTAssertEqual(type, Type.tuple([Type.tuple([self.identifier("String"), self.identifier("Int"), self.identifier("Double")]), self.generic_identifier("Array", generics: ["String"])]))
            }
            
            it("scans closure type") {
                let string = "\(((String, Int) -> String).self)"
                let parser = TypeParser(string: string)
                let type = parser.parseType()
                
                XCTAssertEqual(type, Type.closure(parameters: [Type.tuple([self.identifier("String"), self.identifier("Int")])], returnType: self.identifier("String"), throws: false))
            }
            
            it("scans nested function type") {
                let string = "\((((String) -> String, Int) -> String).self)"
                let parser = TypeParser(string: string)
                let type = parser.parseType()
                
                //Type print adds one unnecessary tuple to the output
                XCTAssertEqual(type, Type.closure(parameters: [Type.tuple([Type.closure(parameters: [self.identifier("String")], returnType: self.identifier("String"), throws: false), self.identifier("Int")])], returnType: self.identifier("String"), throws: false))
            }
            
            it("scans no parameter function type") {
                let string = "\(((Void) -> Void).self)"
                let parser = TypeParser(string: string)
                let type = parser.parseType()
                
                let void = Type.tuple([]) // Void is empty tuple
                XCTAssertEqual(type, Type.closure(parameters: [void], returnType: void, throws: false))
            }
            
            it("scans throwing function type") {
                let string = "\(((Void) throws -> Void).self)"
                let parser = TypeParser(string: string)
                let type = parser.parseType()
                
                let void = Type.tuple([]) // Void is empty tuple
                XCTAssertEqual(type, Type.closure(parameters: [void], returnType: void, throws: true))
            }
            
            it("scans implicitly unwrapped optional") {
                let string = "\((String!).self)"
                let parser = TypeParser(string: string)
                let type = parser.parseType()
                
                XCTAssertEqual(type, self.generic_identifier("ImplicitlyUnwrappedOptional", generics: ["String"]))
            }
            
            it("scans optional") {
                let string = "\((Int?).self)"
                let parser = TypeParser(string: string)
                let type = parser.parseType()
                
                XCTAssertEqual(type, self.generic_identifier("Optional", generics: ["Int"]))
            }
            
            it("scans protocol composition type") {
                let string = "\((ProtocolA & ProtocolB).self)"
                let parser = TypeParser(string: string)
                let type = parser.parseType()
                
                XCTAssertEqual(type, Type.protocolComposition([TypeIdentifier(name: "ProtocolA"), TypeIdentifier(name: "ProtocolB")]))
            }
            
            it("scans metatypes") {
                let string = "\((ProtocolA.Type.Type).self)" // Very meta
                let parser = TypeParser(string: string)
                let type = parser.parseType()
                
                XCTAssertEqual(type, Type.identifier(TypeIdentifier(name: "ProtocolA", subTypeIdentifier: TypeIdentifier(name: "Type", subTypeIdentifier: TypeIdentifier(name: "Type")))))
            }
            
            it("scans backticked type") {
                let string = "\((`protocol`).self)" 
                let parser = TypeParser(string: string)
                let type = parser.parseType()
                
                XCTAssertEqual(type, self.identifier(string))
            }
        }
    }
    
}
#endif
