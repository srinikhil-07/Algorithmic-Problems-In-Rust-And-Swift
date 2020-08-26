import Foundation
///https://leetcode.com/explore/challenge/card/august-leetcoding-challenge/549/week-1-august-1st-august-7th/3415/
/// Binary-Tree
/// ToDo: WA solution, ordering logic on x-axis should be fixed
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}
class Solution {
    func verticalTraversal(_ root: TreeNode?) -> [[Int]] {
        guard root != nil else {
            return []
        }
        var queue = Array<(TreeNode?,(Int, Int))>()
        var answer = [[Int]]()
        var xVerticalOrder = [Int: [Int]]()
        var xIndexTracker = Set<Int>()
        queue.append((root,(0,0)))
        while !queue.isEmpty {
            if let _ = queue.first {
                let size = queue.count
                for _ in 0..<size {
                    let element = queue.removeFirst()
                    if let node = element.0 {
                        let vertex = element.1
                        xIndexTracker.insert(vertex.0) //will be unique keys
                        if var arr = xVerticalOrder[vertex.0] { //update values for given x
                            arr.append(node.val)
                            //arr.sort()
                            xVerticalOrder[vertex.0] = arr
                        } else {
                            var arr = [Int]()
                            arr.append(node.val)
                            xVerticalOrder.updateValue(arr, forKey: vertex.0)
                        }
                        queue.append((node.left,(vertex.0-1, vertex.1-1)))
                        queue.append((node.right,(vertex.0+1, vertex.1-1)))
                    }
                }
            }
        }
        let xIndices = xIndexTracker.sorted()
        for index in xIndices {
            if let verticalOrder = xVerticalOrder[index] {
                answer.append(verticalOrder)
            }
        }
        return answer
    }
}