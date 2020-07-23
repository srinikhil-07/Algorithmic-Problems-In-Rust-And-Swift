//
//  main.swift
//  Leetcode-June-2020
//
//  Created by Nikhil on 6/1/20.
//  Copyright © 2020 Nikhil All rights reserved.
//

import Foundation

//print("Hello, World!")

/// With Swift 5.3, inlinable main can be used but until then,
/// respective problem's function will alone be called

var string = "I am a String"
string = string.append("In Swift!")

//struct S<T>: Codable {
//   var s: T!
//}

//class C1 : Codable {
//class Nested{}
//var a: String = ""
//var b: Int = 0
//var c: Nested = Nested()
//}

// expected-error@-1 type 'C1' does not conform to protocol 'Decodable'
// expected-error@-2 type 'C1' does not conform to protocol 'Encodable'

// expected-note@-1 cannot automatically synthesize 'Decodable' because 'C1.Nested' does not conform to 'Decodable'
// expected-note@-2 cannot automatically synthesize 'Encodable' because 'C1.Nested' does not conform to 'Encodable'
