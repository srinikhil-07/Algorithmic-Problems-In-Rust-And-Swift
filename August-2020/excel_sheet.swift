import Foundation
///https://leetcode.com/explore/challenge/card/august-leetcoding-challenge/550/week-2-august-8th-august-14th/3419/
class Solution {
    func titleToNumber(_ s: String) -> Int {
        let reversedString = String(s.reversed())
        var result = 0
        for i in 0..<reversedString.count {
            let power = Int(pow(Double(26), Double(i)))
            result = result + (reversedString.getCharacter(at: i).capitalLetterHash() * power)
        }
        return result
    }
}
extension String {
    func getCharacter(at index: Int) -> Character {
        return self[self.index(self.startIndex, offsetBy: index)]
    }
}
extension Character {
    /// 1 index based ascii diff
    func capitalLetterHash() -> Int {
        return Int((self.asciiValue ?? 0) - (Character("A").asciiValue ?? 0)) + 1
    }
}