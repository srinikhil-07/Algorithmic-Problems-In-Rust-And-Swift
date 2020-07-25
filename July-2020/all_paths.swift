import Foundation
///https://leetcode.com/explore/challenge/card/july-leetcoding-challenge/547/week-4-july-22nd-july-28th/3400/
///Solution seems not optimized
/// TODO: Checkif there s an optimized version of this solution
class Solution {
    var visited = [Bool]()
    var result = [[Int]]()
    var path = [Int]()
    var adjList = Dictionary<Int, [Int]>()
    func allPathsSourceTarget(_ graph: [[Int]]) -> [[Int]] {
        let n = graph.count - 1
        var itr = 0
        visited = Array.init(repeating: false, count: n+1)
        /// Swift proposal idea: for loop provision to have iterator increment as well
        for nodes in graph {
            adjList.updateValue(nodes, forKey: itr)
            itr = itr+1
        }
        DFS(0)
        return result
    }
    func DFS(_ v: Int) {
        visited[v] = true
        path.append(v)
        if v == adjList.keys.count - 1 {
            result.append(path)
        }
        if let list = adjList[v] {
            for i in list {
                //if !visited[i] { // no cycles, so this check doesnt matter
                    DFS(i)
                //}
            }
        }
        path.removeLast()
    }
}
func testAllPathsSourceTarget() {
    print(Solution.init().allPathsSourceTarget([[1,2], [3], [3], []] ))
}
testAllPathsSourceTarget()