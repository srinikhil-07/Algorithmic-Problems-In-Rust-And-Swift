import Foundation

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
    /// This solution is a spin off of evelOrderBottom
    /// where at each odd level we append elements reversed
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        guard root != nil else {
            return []
        }
        var queue = Array<(TreeNode?,Int)>()
        var answer = [[Int]]()
        var zigzag = 0
        queue.append((root,root!.val))
        while !queue.isEmpty {
            if let _ = queue.first {
                let size = queue.count
                var sameLevelElements = [Int]()
                for _ in 0..<size {
                    let element = queue.removeFirst()
                    sameLevelElements.append(element.1)
                    let node = element.0
                    if let left = node?.left {
                      queue.append((node?.left,left.val))
                    }
                    if let right = node?.right {
                      queue.append((node?.right,right.val))
                    }
                }
                if zigzag % 2 == 0 {
                    answer.append(sameLevelElements)
                } else {
                    answer.append(sameLevelElements.reversed())
                }
            }
            zigzag = zigzag + 1
        }
        return answer
    }
}
func testZigzagLevelOrder() {
    print(Solution.init().zigzagLevelOrder(TreeNode()))
}
testZigzagLevelOrder()