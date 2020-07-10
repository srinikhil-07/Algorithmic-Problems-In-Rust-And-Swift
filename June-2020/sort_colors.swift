import Foundation

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

     func testsortColors() {
        var nums = [2,0,2,1,1,0]
        sortColors(&nums)
        print(nums)
        var _ = Array(repeating: Array(repeating: 1, count: 1), count: 1)
    }
    testsortColors()