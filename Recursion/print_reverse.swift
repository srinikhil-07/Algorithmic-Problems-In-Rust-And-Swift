import Foundation

class Solution {
    func reverseString(_ s: inout [Character]) {
        recursion(&s, 0)
    }
    func recursion(_ s: inout [Character], _ i: Int) {
        if i == s.count/2 {
            return
        }
        recursion(&s, i+1)
        let temp = s[i]
        s[i] = s[s.count-1-i]
        s[s.count-1-i] = temp
    }
}
func testReverseString() {
    /// TODO: Check how Swift type infers String and Character?
    var test: [Character] = ["h","e","l","l","o"]
    Solution.init().reverseString(&test)
    print(test)
}
testReverseString()