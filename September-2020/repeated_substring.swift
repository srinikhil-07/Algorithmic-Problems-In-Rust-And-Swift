import Foundation
///https://leetcode.com/explore/challenge/card/september-leetcoding-challenge/554/week-1-september-1st-september-7th/3447/
/// Rabin-Karp, KMP
/// ToDo: Below is Wrong-Answer, fix it
class Solution {
    func repeatedSubstringPattern(_ s: String) -> Bool {
        let n = s.count
        guard n > 1 else {
            return false
        }
        if n == 2 && s.getCharacter(at: 0) == s.getCharacter(at: 1) {
            return false
        }
        for i in (1...Int(sqrt(Double(n)))).reversed() {
            if n%i == 0 { // divisible
                var divisors = [Int]()
                divisors.append(i)
                if i != 1 {
                    divisors.append(n/i)
                }
                for length in divisors {
                    var temp = s.substring(with: s.subStringRange(from: 0, to: length))
                    let firstHash = temp.hashValue
                    var currentHash = firstHash
                    var start = 1
                    while start != n && currentHash == firstHash {
                        temp = s.substring(with: s.subStringRange(from: start, to: length))
                        currentHash = temp.hashValue
                        start = start + 1
                    }
                    if start == n && currentHash == firstHash {
                        return true
                    }
                }
            }
        }
        return false
    }
}
extension String {
    func getCharacter(at index: Int) -> Character {
        return self[self.index(self.startIndex, offsetBy: index)]
    }
    func subStringRange(from left: Int, to right: Int) -> Range<String.Index> {
        let start = self.index(self.startIndex, offsetBy: left)
        let end = self.index(self.startIndex, offsetBy: right)
        return start..<end
    }
}