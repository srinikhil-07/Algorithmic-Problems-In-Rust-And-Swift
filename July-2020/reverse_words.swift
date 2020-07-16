import Foundation

class Solution {
    ///TODO: 1. This solutions beats 23% of Swift submissions. Can we improve?
    /// 2. Implement a custom components(seperatedBy:) to learn it
    func reverseWords(_ s: String) -> String {
        let givenString = s.components(separatedBy: .whitespaces).filter {
            return $0 != ""
        }.reversed() as [String]
        var reversedString = String()
        for word in givenString {
            reversedString.append(word)
            reversedString.append(" ")
        }
        if reversedString.count > 0 {
            reversedString.removeLast()
        }
        return reversedString
    }
}

func testReverseWords() {
    print(Solution.init().reverseWords("  "))
}

testReverseWords()