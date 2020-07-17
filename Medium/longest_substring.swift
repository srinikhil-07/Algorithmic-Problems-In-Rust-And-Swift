import Foundation

class Solution {
    /// Substring => contiguous range
    /// Sliding window technique: This solution passess 986/987 passed -> https://leetcode.com/submissions/detail/367668913/
    /// TODO: Implement a solution which passes all cases
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var back = 0, forward = 0, maxLength = 0, length = 0
        var uniqueSet = Set<Character>()
        while forward < s.count {
            if !uniqueSet.contains(s.getCharacter(at: forward)) {
                uniqueSet.insert(s.getCharacter(at: forward))
                length = length + 1
                maxLength = max(length, maxLength)
                forward = forward  + 1 // move sliding window forward
            } else { // we have already this character
                uniqueSet.remove(s.getCharacter(at: back))
                back = back + 1 //move back of sliding window one step forward
                length = length - 1 // reduce sliding window length 
            }
        }
        return maxLength
    }
}
extension String {
    func getCharacter(at index: Int) -> Character {
        return self[self.index(self.startIndex, offsetBy: index)]
    }
}

func testLengthOfLongestSubstring() {
    print(Solution.init().lengthOfLongestSubstring("abcabcbb"))
}

testLengthOfLongestSubstring()