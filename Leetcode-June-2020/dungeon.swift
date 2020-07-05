import Foundation
// TODO: Learn much more efficient DP solution.
// Paradigm: DP
class Solution {
    var dp = [[Int]]()
    var rows = Int()
    var columns = Int()
    func calculateMinimumHP(_ dungeon: [[Int]]) -> Int {
        rows = dungeon.count
        columns = dungeon[0].count
        dp = Array.init(repeating: Array.init(repeating: Int.max, count: columns), count: rows)
        for row in rows-1..<0 {
            for col in columns-1..<0 {
                let currentCell = dungeon[row][col]
                let rightHealth = getMinHealth(currentCell, row, col+1)
                let downHealth = getMinHealth(currentCell, row+1, col)
                let nextHealth = min(rightHealth, downHealth)
                if nextHealth != Int.max {
                    dp[row][col] = nextHealth
                } else {
                    dp[row][col] = currentCell >= 0 ? 1: 1-currentCell
                }
            }
        }
        return dp[0][0]
    }
    func getMinHealth(_ currentCell: Int, _ nextRow: Int, _ nextCol: Int) -> Int {
        if nextRow >= self.rows || nextCol >= self.columns {
            return Int.max
        }
        let nextCell = dp[nextRow][nextCol]
        return max(nextCell-currentCell,1)
    }
}