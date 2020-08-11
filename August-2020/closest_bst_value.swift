import Foundation
///https://leetcode.com/explore/challenge/card/august-leetcoding-challenge/550/week-2-august-8th-august-14th/3416/
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
    var minDiff = Double.greatestFiniteMagnitude, result = 0, target = 0.0
    func closestValue(_ root: TreeNode?, _ target: Double) -> Int {
        self.target = target
        traveseBST(root)
        return result
    }
    func traveseBST(_ root: TreeNode?) {
        if let node = root {
            if Double(node.val) == target  {
                result = node.val
                minDiff = 0
                return
            }
            let diff = abs(Double(node.val) - target)
            if minDiff > diff {
                minDiff = diff
                result = node.val
            }
            if target < Double(node.val) {
                traveseBST(node.left)
            } else {
                traveseBST(node.right)
            }
        } else {
            return
        }
    }
}