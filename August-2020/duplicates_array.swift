import Foundation
///https://leetcode.com/explore/challenge/card/august-leetcoding-challenge/549/week-1-august-1st-august-7th/3414/
/// Hash-Set
class Solution {
    func findDuplicates(_ nums: [Int]) -> [Int] {
        var hash = Set<Int>()
        var result = Array<Int>()
        for num in nums {
            if hash.contains(num) {
                result.append(num)
            } else {
                hash.insert(num)
            }
        }
        return result
    }
}