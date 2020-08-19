import Foundation
/// Paradigm: Dynamic-Programming
func numTrees(_ n: Int) -> Int {
    var dp = Array(repeating: 0, count: n+1)
    dp[0] = 1
    dp[1] = 1
    for i in 2...n {
        for j in 1...i {
            dp[i] += dp[j-1] + dp[i-j]
        }
    }
    return dp[n]
}