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
public class Solution {
    var sum: Int = 0
    public func sumNumbers(_ root: TreeNode?) -> Int {
        traverseAndSumNumbers(root,0)
        return sum
    }
    func traverseAndSumNumbers(_ root: TreeNode?, _ number: Int) {
        // root == nil check wont work here check for e.g. [1,0]
        if root != nil { 
            /// Swift bug?: 1. For ?? compiler accepts only if outer brackets are givenafter plus, 
            /// 2. compiler is okay before + but result computed is wrong
            let val = (root?.val ?? 0)  + number * 10 
            if root?.right == nil && root?.left == nil {
                sum += val
            }
            traverseAndSumNumbers(root?.left, val)
            traverseAndSumNumbers(root?.right, val)
        }
    }
    /// code which wont for a variety of reasons
    func traverseAndSumNumbersNotWorking(_ root: TreeNode?, _ number: Int) {
        if root == nil {
            sum += number 
            print("Root is nil and sum: \(sum)")
            return
        }
        print("Root: \(root?.val ?? 0)")
        //?? precedence: https://forums.swift.org/t/nil-coalescing-operator-precedence/2954/8
        let val = number*10 + (root?.val ?? 0)
        if root?.left != nil { // to avoid nil duplication
            traverseAndSumNumbersNotWorking(root?.left, val)
        }
        if root?.left != nil {
            traverseAndSumNumbersNotWorking(root?.right, val)
        }
        if root?.left == nil && root?.right == nil {
            traverseAndSumNumbersNotWorking(root?.right, val)
        }
    }
}

func testSumNumbers() {
    let tree = TreeNode.init()
    tree.val = 1
    tree.left = TreeNode.init(0)
    // tree.right = TreeNode.init(0)
    // tree.left?.left = TreeNode.init(5)
    // tree.left?.right = TreeNode.init(1)
    let solution = Solution.init()
    print(solution.sumNumbers(tree))
}
testSumNumbers()
