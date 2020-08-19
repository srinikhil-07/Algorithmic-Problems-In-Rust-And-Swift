import Foundation
/// Binary-Tree
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
    ///This solution is a spin-off of widthOfBinaryTree() 
    /// We store each level in an arrya and append them to answer
    /// Performance is 67% of Swift submissions
    /// TODO: Check if theres any other interesting/efficient solution to this problem
    func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
        guard root != nil else {
            return []
        }
        var queue = Array<(TreeNode?,Int)>()
        var answer = [[Int]]()
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
                answer.append(sameLevelElements)
            }
        }
        return answer.reversed()
    }
}