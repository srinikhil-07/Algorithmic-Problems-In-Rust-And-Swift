import Foundation
///https://leetcode.com/explore/challenge/card/july-leetcoding-challenge/547/week-4-july-22nd-july-28th/3403/
/// TODO: 1. Learn why right and left order in recurrence relation related?
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
    var inOrderRef = [Int]()
    var postOrderRef = [Int]()
    func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        inOrderRef = inorder
        postOrderRef = postorder
        var postIndex = postorder.count - 1
        return recursiveBuildTree(0, inorder.count - 1, &postIndex)
    }
    func recursiveBuildTree(_ start: Int, _ end: Int, _ postIndex: inout Int) -> TreeNode? {
        if start > end {
            return nil
        }
        let node = TreeNode.init(postOrderRef[postIndex])
        postIndex = postIndex - 1
        if start == end { //leaf
            return node
        }
        let index = inOrderRef[start...end].firstIndex(of: node.val)
        ///be wary of calling right and left in order
        //. if pre-order is given, call left and right
        node.right = recursiveBuildTree(index!+1, end, &postIndex)
        node.left = recursiveBuildTree(start, index!-1, &postIndex)
        return node
    }
}