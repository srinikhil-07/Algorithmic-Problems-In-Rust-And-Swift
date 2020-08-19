import Foundation
///https://leetcode.com/explore/challenge/card/august-leetcoding-challenge/550/week-2-august-8th-august-14th/3421/
class Solution {
    func getRow(_ rowIndex: Int) -> [Int] {
        //https://stackoverflow.com/questions/24838015/variable-p-passed-by-reference-before-being-initialized
        var ans: Array<Int> = []
        ans.append(1)
        for k in 1...rowIndex {
            ans.append(ans.last ?? 1 * ((rowIndex-k+1)/k))
        }
        return ans
    }
}