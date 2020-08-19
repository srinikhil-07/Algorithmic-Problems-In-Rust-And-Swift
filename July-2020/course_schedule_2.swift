import Foundation
/// Graph, Topological-Sort
class Solution {
    var visited = [Bool]()
    var result = [Int]()
    var graph = Dictionary<Int,[Int]>()
    var possible = true
    /// Solution not working: Needs analysis
    func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
        //diagnostic is right if no suceeding statements present
        visited = Array.init(repeating: false, count: numCourses)
        for element in prerequisites { // form graph
            if var adjList = graph[element[0]] {
                adjList.append(element[1])
                graph.updateValue(adjList, forKey: element[0])
            } else {
                graph.updateValue([element[1]], forKey: element[0])
            }
        }
        for i in 0..<numCourses {
            if !visited[i] {
                topologicalSort(i)
            } else {
                possible = false
            }
        }
        return possible ? result : []
    }
    func topologicalSort(_ v: Int) {
        visited[v] = true
        if let adjNodes = graph[v] {
            for node in adjNodes {
                if !visited[node] {
                    topologicalSort(node)
                }
            }
        }
        result.append(v)
    }
}
func testFindOrder() {
    print(Solution.init().findOrder(4, [[1,0],[2,0],[3,1],[3,2]]))
}
testFindOrder()