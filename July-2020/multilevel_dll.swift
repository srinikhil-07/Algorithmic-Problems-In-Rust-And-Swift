import Foundation
// Problem:https://leetcode.com/explore/challenge/card/july-leetcoding-challenge/545/week-2-july-8th-july-14th/3385/
/// Linked-List, DFS
public class Node {
    public var val: Int
    public var prev: Node?
    public var next: Node?
    public var child: Node?
    public init(_ val: Int) {
        self.val = val
        self.prev = nil
        self.next = nil
        self.child  = nil
    }
}

class Solution {
    /// If we rotate the DS, we get a binary tree
    /// TODO: Also implement preorder DFS traversal (isn't below the same?)
    /// Note: 1. Learn to un-disguise given data structure like above
    /// This solution is plain recursion + iteration, simple transformation -> though it passed
    /// all cases, it was in bottom 10% in perf 
    func flatten(_ head: Node?) -> Node? {
        var currNode = head 
        while currNode != nil {
            if currNode?.child != nil { // if node has a child
                let child = flatten(currNode?.child)
                currNode?.child = nil //no more children
                let hold = currNode?.next //pointer to mark current list's end-of-flattened children
                currNode?.next = child
                child?.prev = currNode
                while currNode?.next != nil { //traverse joined nodes to get to the end
                    currNode = currNode?.next
                }
                currNode?.next = hold
                hold?.prev = currNode
            }
            currNode = currNode?.next
        }
        return head //return head and traverse it for sub-trees
    }
}