import  Foundation

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