import Foundation
///https://leetcode.com/explore/challenge/card/july-leetcoding-challenge/547/week-4-july-22nd-july-28th/3399/
class Solution {
    ///Since appear only twice, we can remove from hash the second time
    /// Solution is valid: beats 98%
    func singleNumber(_ nums: [Int]) -> [Int] {
        var hash = Set<Int>()
        for num in nums {
            if hash.contains(num) {
                hash.remove(num)
            } else {
                hash.insert(num)
            }
        }
        return Array(hash)
    }
}