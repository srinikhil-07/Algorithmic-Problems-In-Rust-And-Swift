import Foundation
///https://leetcode.com/explore/challenge/card/july-leetcoding-challenge/548/week-5-july-29th-july-31st/3407/
class Solution {
    /// Has different simple solutions, used bottom-up DP
    func climbStairs(_ n: Int) -> Int {
        if n==1 || n==2 {
            return n
        }
        var dp = Array.init(repeating: 0, count: n+1)
        dp[0] = 1 // one way to go to step1
        dp[1] = 2 // two ways to go to step 2
        for index in 2..<n {
            dp[index] = dp[index-1] + dp[index-2]
        }
        return dp[n-1]
    }
}