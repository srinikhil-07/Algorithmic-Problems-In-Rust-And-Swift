import Foundation

/// Clues
/// 1. Numbers should be in range (1..<sqrt(n)) -> 10 -> 1+9 -> wrong clue
/// 2. DP technique? 

func numSquares(_ n: Int) -> Int {
    //initialize DP array
    var dp = [Int]()
    for _ in 0..<(n+1) {
        dp.append(Int.max)
    }
    dp[0] = 0
    print("Precomputation done")
    //precompute squares
    let maxSquares = Int(Float(n).squareRoot()) + 1
    var squares = [Int]()
    for i in 1..<(maxSquares+1) {
        squares.append(i*i)
    }
    //cache values and re use them
    for i in 1..<(n+1) {
        for s in 1..<maxSquares {
            if i < squares[s] {
                break
            }
            dp[i] = min(dp[i], dp[i-squares[s]]+1)
        }
    }
    return dp[n]
}

func testnumSquares() {
    print(numSquares(4))
}
testnumSquares()