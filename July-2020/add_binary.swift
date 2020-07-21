import Foundation
/// https://leetcode.com/explore/challenge/card/july-leetcoding-challenge/546/week-3-july-15th-july-21st/3395/
/// TODO: Can we improve below solution?
class Solution {
    func addBinary(_ a: String, _ b: String) -> String {
        var first: String, second: String
        var charA: String, charB: String, charC: String
        if a.count > b.count { 
            first = String(a.reversed())
            second = String(b.reversed())
        } else {
            first = String(b.reversed())
            second = String(a.reversed())
        }
        var carry = 0
        var result = String()
        for i in 0..<first.count { //from reverse process each index
            charA = first.getCharacter(at: i)
            if i < second.count {
                charB = second.getCharacter(at: i)
            } else {
                charB = "0"
            }
            charC = String(carry)
            let (bit, carr) = add(charA, charB, charC)
            print("\(bit), \(carr)")
            result.append(bit)
            carry = Int(carr) ?? 0
        }
        if carry == 1 {
            result.append("1")
        }
        return String(result.reversed())
    }
    /// Method to process bit addition logic
    private func add(_ a: String, _ b: String, _ c: String) -> (String, String) {
        /// Diagnostic:Int(c) -> cannot convert value of type 'Character' to expected argument type 'String'
        let first = Int(String(a)) ?? 0
        let second = Int(String(b)) ?? 0
        let carry = Int(String(c)) ?? 0
        let sum = first + second + carry
        if sum == 3 {
            return ("1","1")
        } else if sum == 2 {
            return ("0","1")
        } else if sum == 1 {
            return ("1","0")
        } else {
            return ("0","0")
        }
    }
}
extension String {
    func getCharacter(at index: Int) -> String {
        return String(self[self.index(self.startIndex, offsetBy: index)])
    }
}
func testAddBinary() {
    print(Solution.init().addBinary("11", "1"))
}
testAddBinary()