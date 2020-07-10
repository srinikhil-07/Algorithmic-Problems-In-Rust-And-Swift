//
//  File.swift
//  Leetcode-June-2020
//
//  Created by sri-7348 on 6/15/20.
//  Copyright © 2020 Nikhi. All rights reserved.
//

import Foundation
/// - ToDo: Look how standard library has implemented reverse()
func reverseString(_ s: inout [Character]) {
    ///s.reverse() -> one liner
    var temp: Character
    for i in 0..<s.count/2 {
        temp = s[i]
        s[i] = s[s.count-1-i]
        s[s.count-1-i] = temp
    }
}
