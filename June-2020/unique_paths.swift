import Foundation
// Paradigm: DP
func uniquePaths(_ m: Int, _ n: Int) -> Int {
    /// SR-13145: Auto completion of Array in sourcekit-LSP improvement suggested
    var dp = Array(repeating: Array(repeating: 1, count: n) , count: m)
    for col in 1..<m {
        for row in 1..<n {
            dp[col][row] = dp[col-1][row] + dp[col][row-1]
        }
    }
    return dp[m-1][n-1]
}

func testUniquePaths() {
    print(uniquePaths(3,2))
}

testUniquePaths()
