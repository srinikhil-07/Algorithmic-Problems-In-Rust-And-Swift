import Foundation
//https://leetcode.com/explore/challenge/card/october-leetcoding-challenge/560/week-2-october-8th-october-14th/3489/
//Binary-Search-Tree
/// Wrong answer for deserialize
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
          self.val = val
          self.left = nil
          self.right = nil
    }
}
class Codec {
    // Encodes a tree to a single string.
    func serialize(_ root: TreeNode?) -> String {
        var serializedString = String()
        var queue = [TreeNode?]()
        if let root = root {
            queue.append(root)
            while queue.count != 0 {
                if let node = queue.first as? TreeNode {
                    serializedString.append(String(node.val))
                    serializedString.append(",")
                    if node.left != nil || node.right != nil {
                        queue.append(node.left)
                        queue.append(node.right)
                    }
                    queue.removeFirst()
                } else {
                    serializedString.append("#")
                    serializedString.append(",")
                    queue.removeFirst()
                }
            }
            return serializedString
        }
        return "#"
    }
    
    // Decodes your encoded data to tree.
    func deserialize(_ data: String) -> TreeNode? {
        var nodes = data.components(separatedBy: ",")
        nodes.removeLast()
        print(nodes)
        if nodes.count == 0 {
            return nil
        }
        if nodes[0] == "#" {
            return nil
        }
        let tree = TreeNode.init(Int(nodes[0]) ?? 0)
        var queue = [TreeNode?]()
        queue.append(tree)
        print(tree.val)
        var index = 1
        while !queue.isEmpty {
            let node = queue.removeFirst()
                if index < nodes.count {
                    var left: TreeNode? = nil
                    if nodes[index] != "#" {
                        left = TreeNode.init(Int(nodes[index]) ?? 0)
                    }
                    tree.left = left
                    print(tree.left?.val)
                    queue.append(left)
                }
                index = index + 1
                if index < nodes.count {
                    var right: TreeNode? = nil
                    if nodes[index] != "#" {
                        right = TreeNode.init(Int(nodes[index]) ?? 0)
                    }
                    tree.right = right
                    print(tree.right?.val)
                    queue.append(right)
                }
                index = index + 1
        }
        return tree
    }
}

/**
 * Your Codec object will be instantiated and called as such:
 * let ser = Codec()
 * let deser = Codec()
 * let tree: String = ser.serialize(root)
 * let ans = deser.deserialize(tree)
 * return ans
*/

let root = TreeNode.init(3)
root.left = TreeNode.init(1)
root.right = TreeNode.init(4)
root.left?.left = nil
root.left?.right = TreeNode.init(2)
let ser = Codec()
let deser = Codec()
let tree: String = ser.serialize(root)
let ans = deser.deserialize(tree)
print(ser.serialize(ans))

