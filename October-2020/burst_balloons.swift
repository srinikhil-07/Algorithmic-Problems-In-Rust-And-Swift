import Foundation
///https://leetcode.com/explore/challenge/card/october-leetcoding-challenge/560/week-2-october-8th-october-14th/3490/
/// Queue, Sort, Range
class Solution {
    func findMinArrowShots(_ points: [[Int]]) -> Int {
        guard points.count != 0 else {
            return 0
        } 
        let sortedPoints = points.sorted {
            return $0[0] < $1[0]
        }
        var queue = [[Int]]()
        queue.append(sortedPoints[0])
        var j = 1
        for i in 1..<sortedPoints.count {
            if queue[j-1][1] >= sortedPoints[i][0] {
                //narrowing the scope
                queue[j-1][0] = max(queue[j-1][0],sortedPoints[i][0])
                queue[j-1][1] = min(queue[j-1][1],sortedPoints[i][1])
            } else {
                queue.append(sortedPoints[i])
                j = j+1
            }
        }
        return queue.count
    }
}
///Ref: https://zhaonanli.gitbooks.io/leetcode/content/452.minimum-number-of-arrows-to-burst-balloons.html

print(Solution.init().findMinArrowShots([[10,16],[2,8],[1,6],[7,12]]))