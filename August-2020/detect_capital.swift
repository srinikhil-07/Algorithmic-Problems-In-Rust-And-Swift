import Foundation
///https://leetcode.com/explore/challenge/card/august-leetcoding-challenge/549/week-1-august-1st-august-7th/3409/
class Solution {
    func detectCapitalUse(_ word: String) -> Bool {
        var capital = false, small = false
        if word.count == 1 {
            return true
        }
        let first = isCapital(word.getCharacter(at: 0))
        for index in 1..<word.count {
            if isCapital(word.getCharacter(at: index)) {
                capital = true
                if !first {
                    return false
                } 
                if small {
                    return false
                }
            } else {
                small = true
                if capital {
                    return false
                }
            }
        }
        return true
    }
    func isCapital(_ char: Character) -> Bool {
        let ascii = Int(char.asciiValue ?? 0)
        if  ascii >= 65 && ascii < 97 {
            return true
        }
        return false
    }
}
extension String {
    func getCharacter(at index: Int) -> Character {
        return self[self.index(self.startIndex, offsetBy: index)]
    }
}
func testDetectCapitalUse() {
    print(Solution.init().detectCapitalUse("USa"))
}
testDetectCapitalUse()
/// 1. first small -> rest small,
/// 2. first capital, rest all capital
/// 3. first capital, rest all small
/// 4. first capital, rest all shouldnt be mixed