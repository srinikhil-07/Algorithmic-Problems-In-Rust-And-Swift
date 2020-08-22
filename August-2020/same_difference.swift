import Foundation
///https://leetcode.com/explore/challenge/card/august-leetcoding-challenge/551/week-3-august-15th-august-21st/3428/
/// Graph, DFS, BFS
/// ToDo: Try BFS implementation as well
/// Boring DFS solution
class Solution {
    var givenK = Int()
    var results = [Int]()
    func numsSameConsecDiff(_ N: Int, _ K: Int) -> [Int] {
        if N == 1 {
            return [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
        }
        for i in 1..<10 {
            DFS(N-1, i)
        }
        return results
    }
    func DFS(_ N: Int, _ num: Int) {
        if N == 0 {
            results.append(num)
            return
        }
        var nextDigits = [Int]()
        let tailDigit = num % 10
        nextDigits.append(tailDigit + givenK)
        if givenK != 0 {
            nextDigits.append(tailDigit - givenK)
        }
        for nextDigit in nextDigits {
            if nextDigit >= 0 && nextDigit < 10 {
                let newNum = num*10 + nextDigit
                DFS(N-1, newNum)
            }
        }
    }
}