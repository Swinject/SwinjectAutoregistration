//
//  TypeParserTests.swift
//  SwinjectAutoregistration
//
//  Created by Yoichi Tagaya on 2021/07/03.
//  Copyright © 2021 Swinject Contributors. All rights reserved.
//
#if !os(Linux) && !os(Android)
import XCTest

protocol ProtocolA{}
protocol ProtocolB{}

class ClassA{
    class Nested{}
}

class _x0name²y {}

class `protocol` {}

@testable import SwinjectAutoregistration

class TypeParserTests: XCTestCase {
    
    //Helpers
    func identifier(_ name: String, generics: [Type] = []) -> Type {
        return Type.identifier(TypeIdentifier(name: name, genericTypes: generics))
    }
    
    func generic_identifier(_ name: String, generics: [String]) -> Type {
        return Type.identifier(TypeIdentifier(name: name, genericTypes: generics.map { identifier($0) }))
    }
    
    func testParserScansTypeIdentifier() {
        let string = "\(_x0name²y.self)"
        let parser = TypeParser(string: string)
        let type = parser.parseType()
        
        XCTAssertEqual(type, self.identifier(string))
    }
    
    func testParserDoesNotScanNonTypeIdentifier() {
        let string = "1Array"
        let parser = TypeParser(string: string)
        let type = parser.parseType()
        
        XCTAssertEqual(type, nil)
    }
    
    func testParserScansSubtypeIdentifier() {
        let string = "\(ClassA.Nested.self)"
        let parser = TypeParser(string: string)
        let type = parser.parseType()
        
        XCTAssertEqual(type, self.identifier("Nested"))
    }
    
    func testParserScansArrayType() {
        let string = "\([String].self)"
        let parser = TypeParser(string: string)
        let type = parser.parseType()
        
        XCTAssertEqual(type, self.generic_identifier("Array", generics: ["String"]))
    }
    
    func testParserScansGenericTypeWithMultipleArguments() {
        let string = "\([Int: String].self)"
        let parser = TypeParser(string: string)
        let type = parser.parseType()
        
        XCTAssertEqual(type, self.generic_identifier("Dictionary", generics: ["Int", "String"]))
    }
    
    func testParserScansTupleType() {
        let string = "\((name: String, count: Int).self)"
        let parser = TypeParser(string: string)
        let type = parser.parseType()
        
        XCTAssertEqual(type, Type.tuple([self.identifier("String"), self.identifier("Int")]))
    }
    
    func testParserScansTupleOfTuples() {
        let string = "\(((String, Int, Double), [String]).self)"
        let parser = TypeParser(string: string)
        let type = parser.parseType()
        
        XCTAssertEqual(type, Type.tuple([Type.tuple([self.identifier("String"), self.identifier("Int"), self.identifier("Double")]), self.generic_identifier("Array", generics: ["String"])]))
    }
    
    func testParserScansClosureType() {
        let string = "\(((String, Int) -> String).self)"
        let parser = TypeParser(string: string)
        let type = parser.parseType()
        
        XCTAssertEqual(type, Type.closure(parameters: [self.identifier("String"), self.identifier("Int")], returnType: self.identifier("String"), throws: false))
    }
    
    func testParserScansNestedFunctionType() {
        let string = "\((((String) -> String, Int) -> String).self)"
        let parser = TypeParser(string: string)
        let type = parser.parseType()
        
        XCTAssertEqual(type, Type.closure(parameters: [Type.closure(parameters: [self.identifier("String")], returnType: self.identifier("String"), throws: false), self.identifier("Int")], returnType: self.identifier("String"), throws: false))
    }
    
    func testParserScansNoParameterFunctionType() {
        let string = "\((() -> Void).self)"
        let parser = TypeParser(string: string)
        let type = parser.parseType()
        
        let void = Type.tuple([]) // Void is empty tuple
        XCTAssertEqual(type, Type.closure(parameters: [], returnType: void, throws: false))
    }
    
    func testParserScansThrowingFunctionType() {
        let string = "\((() throws -> Void).self)"
        let parser = TypeParser(string: string)
        let type = parser.parseType()
        
        let void = Type.tuple([]) // Void is empty tuple
        XCTAssertEqual(type, Type.closure(parameters: [], returnType: void, throws: true))
    }
    
    func testParserScansOptional() {
        let string = "\((Int?).self)"
        let parser = TypeParser(string: string)
        let type = parser.parseType()
        
        XCTAssertEqual(type, self.generic_identifier("Optional", generics: ["Int"]))
    }
    
    func testParserScansProtocolCompositionType() {
        let string = "\((ProtocolA & ProtocolB).self)"
        let parser = TypeParser(string: string)
        let type = parser.parseType()
        
        XCTAssertEqual(type, Type.protocolComposition([TypeIdentifier(name: "ProtocolA"), TypeIdentifier(name: "ProtocolB")]))
    }
    
    func testParserScansMetatypes() {
        let string = "\((ProtocolA.Type.Type).self)" // Very meta
        let parser = TypeParser(string: string)
        let type = parser.parseType()
        
        XCTAssertEqual(type, Type.identifier(TypeIdentifier(name: "ProtocolA", subTypeIdentifier: TypeIdentifier(name: "Type", subTypeIdentifier: TypeIdentifier(name: "Type")))))
    }
    
    func testParserScansBacktickedType() {
        let string = "\((`protocol`).self)"
        let parser = TypeParser(string: string)
        let type = parser.parseType()
        
        XCTAssertEqual(type, self.identifier(string))
    }
    
}
#endif
