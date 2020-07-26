import Foundation
///https://leetcode.com/explore/challenge/card/july-leetcoding-challenge/547/week-4-july-22nd-july-28th/3401/
class Solution {
    /// Solution not working
    func findMin(_ nums: [Int]) -> Int {
        var left = 0, right = nums.count-1
        while left < right {
            let pivot = left + (right-left)/2
            if nums[pivot] < nums[right] {
                right = pivot
            } else if nums[pivot] > nums[left] {
                left = pivot + 1
            } else {
                right = right - 1 //i didnt get this
            }
        }
        return nums[left]
    }
}
