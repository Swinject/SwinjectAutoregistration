//
//  ScannerTests.swift
//  SwinjectAutoregistration
//
//  Created by Tomas Kohout on 20/01/2017.
//  Copyright © 2017 Swinject Contributors. All rights reserved.
//

import XCTest

protocol ProtocolA{}
protocol ProtocolB{}

class ClassA{
    class Nested{}
}

class _x0😪name²〡yﷰ {}

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
    
    
    func testScansTypeIdentifier() {
        let string = "\(_x0😪name²〡yﷰ.self)"
        let parser = TypeParser(string: string)
        let type = parser.parseType()
        
        XCTAssertEqual(type, identifier(string))
    }
    
    func testDoesntScanNonTypeIdentifier() {
        let string = "1Array"
        let parser = TypeParser(string: string)
        let type = parser.parseType()
        
        XCTAssertEqual(type, nil)
    }
    
    
    func testScanSubTypeIdentifier() {
        let string = "\(ClassA.Nested.self)"
        let parser = TypeParser(string: string)
        let type = parser.parseType()
        
        XCTAssertEqual(type, identifier("Nested"))
    }
    
    func testScansArrayType() {
        let string = "\([String].self)"
        let parser = TypeParser(string: string)
        let type = parser.parseType()
        
        XCTAssertEqual(type, generic_identifier("Array", generics: ["String"]))
    }
    
    func testScansGenericTypeWithMultipleArguments() {
        let string = "\([Int: String].self)"
        let parser = TypeParser(string: string)
        let type = parser.parseType()
        
        XCTAssertEqual(type, generic_identifier("Dictionary", generics: ["Int", "String"]))
    }
    
    func testScansTupleType() {
        let string = "\((name: String, count: Int).self)"
        let parser = TypeParser(string: string)
        let type = parser.parseType()
        
        XCTAssertEqual(type, Type.tuple([identifier("String"), identifier("Int")]))
    }
    
    func testScansTupleOfTuples() {
        let string = "\(((String, Int, Double), [String]).self)"
        let parser = TypeParser(string: string)
        let type = parser.parseType()
        
        XCTAssertEqual(type, Type.tuple([Type.tuple([identifier("String"), identifier("Int"), identifier("Double")]), generic_identifier("Array", generics: ["String"])]))
    }
    
    func testScansClosureType() {
        let string = "\(((String, Int) -> String).self)"
        let parser = TypeParser(string: string)
        let type = parser.parseType()
        
        XCTAssertEqual(type, Type.closure(parameters: [Type.tuple([identifier("String"), identifier("Int")])], returnType: identifier("String"), throws: false))
    }
    
    func testScansNestedFunctionType() {
        let string = "\((((String) -> String, Int) -> String).self)"
        let parser = TypeParser(string: string)
        let type = parser.parseType()
        
        //Type print adds one unneccessary tuple to the output
        XCTAssertEqual(type, Type.closure(parameters: [Type.tuple([Type.closure(parameters: [identifier("String")], returnType: identifier("String"), throws: false), identifier("Int")])], returnType: identifier("String"), throws: false))
    }
    
    func testScansNoParameterFunctionType() {
        let string = "\(((Void) -> Void).self)"
        let parser = TypeParser(string: string)
        let type = parser.parseType()
        
        let void = Type.tuple([]) // Void is empty tuple
        XCTAssertEqual(type, Type.closure(parameters: [void], returnType: void, throws: false))
    }
    
    func testScansThrowingFunctionType() {
        let string = "\(((Void) throws -> Void).self)"
        let parser = TypeParser(string: string)
        let type = parser.parseType()
        
        let void = Type.tuple([]) // Void is empty tuple
        XCTAssertEqual(type, Type.closure(parameters: [void], returnType: void, throws: true))
    }
    
    func testScansImplicitlyUnwrappedOptional() {
        let string = "\((String!).self)"
        let parser = TypeParser(string: string)
        let type = parser.parseType()
        
        XCTAssertEqual(type, generic_identifier("ImplicitlyUnwrappedOptional", generics: ["String"]))
    }
    
    func testScansOptional() {
        let string = "\((Int?).self)"
        let parser = TypeParser(string: string)
        let type = parser.parseType()
        
        XCTAssertEqual(type, generic_identifier("Optional", generics: ["Int"]))
    }
    
    func testScansProtocolCompositionType() {
        let string = "\((ProtocolA & ProtocolB).self)"
        let parser = TypeParser(string: string)
        let type = parser.parseType()
        
        XCTAssertEqual(type, Type.protocolComposition([TypeIdentifier(name: "ProtocolA"), TypeIdentifier(name: "ProtocolB")]))
    }
    
    func testScansMetatypes() {
        let string = "\((ProtocolA.Type.Type).self)" // Very meta
        let parser = TypeParser(string: string)
        let type = parser.parseType()
        
        XCTAssertEqual(type, Type.identifier(TypeIdentifier(name: "ProtocolA", subTypeIdentifier: TypeIdentifier(name: "Type", subTypeIdentifier: TypeIdentifier(name: "Type")))))
    }
    
    func testScansBacktickedType() {
        let string = "\((`protocol`).self)" 
        let parser = TypeParser(string: string)
        let type = parser.parseType()
        
        XCTAssertEqual(type, identifier(string))
    }
    
    
}
