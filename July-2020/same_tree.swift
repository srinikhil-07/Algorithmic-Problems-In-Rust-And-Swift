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
    var pArray = [Int?]()
    var qArray = [Int?]()
    /// TODO: This solution stands at 12.7% of submissions. can we improve?
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        traverseTree1(p)
        traverseTree2(q)
        print(pArray)
        print(qArray)
        return pArray == qArray
    }
    /// Preordering traversiong p and q trees
    func traverseTree1(_ p: TreeNode?) {
        if let node = p {
            pArray.append(node.val)
            traverseTree1(node.left)
            traverseTree1(node.right)
        } else {
            pArray.append(nil)
        }
    }
    func traverseTree2(_ q: TreeNode?) {
        if let node = q {
            qArray.append(node.val)
            traverseTree2(node.left)
            traverseTree2(node.right)
        } else {
            qArray.append(nil)
        }
    }
}

func testIsSameTree() {
    let tree1 = TreeNode.init(1, TreeNode.init(2), TreeNode.init(3))
    let tree2 = TreeNode.init(1, TreeNode.init(2), TreeNode.init(3))
    print(Solution.init().isSameTree(tree1, tree2))
}

testIsSameTree()
