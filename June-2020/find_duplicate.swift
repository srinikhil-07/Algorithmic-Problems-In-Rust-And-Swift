import Foundation
///https://leetcode.com/explore/challenge/card/june-leetcoding-challenge/542/week-4-june-22nd-june-28th/3371/
/// - ToDo: hashing bits of a number
/// Bitwise
    public func findDuplicate(_ nums: [Int]) -> Int {
        var slow = 0, fast = nums[nums[0]]
        while fast != slow {
            fast = nums[nums[fast]]
            slow = nums[slow]
        }
        slow = nums[0]
        while fast != slow {
            slow = nums[slow]
            fast = nums[fast]
        }
        return fast
    }