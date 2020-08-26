import Foundation
///https://leetcode.com/explore/challenge/card/august-leetcoding-challenge/552/week-4-august-22nd-august-28th/3437/
/// Math
class Solution {
    func fizzBuzz(_ n: Int) -> [String] {
        var result = [String]()
        for i in 1...n {
            if i % 3 == 0 && i % 15 != 0 {
                result.append("Fizz")
            } else if i % 5 == 0 && i % 15 != 0 {
                result.append("Buzz")
            } else if i % 15 == 0 {
                result.append("FizzBuzz")
            } else {
                result.append(String(i))
            }
        }
        return result
    }
}