import Foundation
///https://leetcode.com/explore/challenge/card/august-leetcoding-challenge/552/week-4-august-22nd-august-28th/3436/
/// Dynamic-programming
class Solution {
    ///https://leetcode.com/problems/minimum-cost-for-tickets/discuss/226659/Two-DP-solutions-with-pictures
    func mincostTickets(_ days: [Int], _ costs: [Int]) -> Int {
        let travelDays = Set.init(days)
        var dp = Array.init(repeating: 0, count: 366)
        for day in 1..<366 {
            if travelDays.contains(day) {
                let temp = min(dp[day-1]+costs[0], dp[max(0,day-7)] + costs[1])
                dp[day] = min(temp, dp[max(0, day-30)] + costs[2])
            } else {
                dp[day] = dp[day-1]
            }
        }
        return dp[365]
    }
}