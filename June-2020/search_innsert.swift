import Foundation
/// https://leetcode.com/explore/challenge/card/june-leetcoding-challenge/540/week-2-june-8th-june-14th/3356/
    public func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        if nums.count == 0 {
            return 0
        }
        if target < nums[nums.startIndex] {
            return 0
        } else if target > nums[nums.endIndex - 1]  {
            return nums.count
        }
        var left = 0, right = nums.count - 1
        while left <= right {
            let pivot = left + (right-left)/2
            if nums[pivot] == target {
                return pivot
            } else if nums[pivot] < target {
                left = pivot + 1
            } else {
                right = pivot - 1
            }
        }
        if nums[left] > target {
            return left
        } else {
            return left + 1
        }
    }