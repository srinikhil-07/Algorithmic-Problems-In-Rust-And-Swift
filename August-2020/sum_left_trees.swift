import Foundation
///https://leetcode.com/explore/challenge/card/august-leetcoding-challenge/552/week-4-august-22nd-august-28th/3435/
/// Binary-tree
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
    func sumOfLeftLeaves(_ root: TreeNode?) -> Int {
        guard root != nil else {
            return 0
        }
        var queue = Array<(TreeNode?,Int)>()
        var answer = 0
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
                      if left.left == nil && left.right == nil { //left leaves
                        answer = answer + left.val
                      }
                    }
                    if let right = node?.right {
                      queue.append((node?.right,right.val))
                    }
                }
            }
        }
        return answer
    }
}