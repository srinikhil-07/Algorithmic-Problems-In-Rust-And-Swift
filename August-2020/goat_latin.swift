import Foundation
///https://leetcode.com/explore/challenge/card/august-leetcoding-challenge/551/week-3-august-15th-august-21st/3429/
/// ToDo: can be improved
/// String 
class Solution {
    func toGoatLatin(_ S: String) -> String {
        let given = S.components(separatedBy: " ")
        var result = String()
        var index = 0
        for var element in given {
            index = index + 1
            let first = element.getCharacter(at: 0)
            let lowerFirst = first.lowercased()
            if lowerFirst == "a" || lowerFirst == "e" || lowerFirst == "i" || lowerFirst == "o" 
            || lowerFirst == "u" {
                element.append(contentsOf: "ma")
            } else {
                element.removeFirst()
                element.append(contentsOf: String(first))
                element.append(contentsOf: "ma")
            }
            for _ in 0..<index {
                element.append("a")
            }
            result.append(contentsOf: element)
            result.append(" ")
        }
        result.removeLast()
        return result
    }
}
extension String {
    func getCharacter(at index: Int) -> Character {
        return self[self.index(self.startIndex, offsetBy: index)]
    }
}