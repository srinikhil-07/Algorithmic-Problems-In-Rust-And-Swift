import Foundation
public class Solution {
    public init() { }
    /// June LeetCode 2020 problems
    /// https://leetcode.com/explore/challenge/card/june-leetcoding-challenge/540/week-2-june-8th-june-14th/3355/
    public func isSubsequence(_ s: String, _ t: String) -> Bool {
        if s.isEmpty {
            return true
        }
        var j = 0, match = 0
        for i in 0..<s.count {
            while(j<t.count) {
                if s[s.index(s.startIndex, offsetBy: i)] == t[t.index(t.startIndex, offsetBy: j)] {
                    match += 1
                    j += 1
                    break
                }
                j += 1
            }
            if j == t.count {
                break
            }
        }
        return match == s.count
    }
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
    ///https://leetcode.com/explore/challenge/card/june-leetcoding-challenge/540/week-2-june-8th-june-14th/3357/
    /// One pass algorithm is to use bi-direcional pointer
    public func sortColors(_ nums: inout [Int]) {
        var zC = 0, oC = 0, tC = 0
        for obj in nums {
            if obj == 0 {
                zC += 1
            } else if obj == 1 {
                oC += 1
            } else if obj == 2 {
                tC += 1
            }
        }
        for i in 0..<zC {
            nums[i] = 0
        }
        for i in zC..<(zC+oC) {
            nums[i] = 1
        }
        for i in zC+oC..<zC+oC+tC {
            nums[i] = 2
        }
    }
    /// https://leetcode.com/explore/challenge/card/june-leetcoding-challenge/541/week-3-june-15th-june-21st/3367/
    public func calculateMinimumHP(_ dungeon: [[Int]]) -> Int {
        var i = 0, j = 0
        let xSize = dungeon.count
        let ySize = dungeon[0].count
        var answer = 0
        while i != xSize-1 || j != ySize - 1 {
            answer += dungeon[i][j]
            if dungeon[i+1][j] >= dungeon[i][j+1] { //greedy
                i = i+1
            } else {
                j = j+1
            }
        }
        return abs(answer) + 1
    }
    ///https://leetcode.com/explore/challenge/card/june-leetcoding-challenge/542/week-4-june-22nd-june-28th/3371/
    /// - ToDo: hashing bits of a number
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
}
