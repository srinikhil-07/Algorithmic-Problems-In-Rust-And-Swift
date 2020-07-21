import Foundation
//https://leetcode.com/explore/challenge/card/july-leetcoding-challenge/546/week-3-july-15th-july-21st/3396/

public class ListNode {
      public var val: Int
      public var next: ListNode?
      public init() { self.val = 0; self.next = nil; }
      public init(_ val: Int) { self.val = val; self.next = nil; }
      public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}
class Solution {
    ///This problem teaches sentinel, a variable that serves 2 purposes: 1. Preserves start of list, 2. Solves 
    /// the problem of handling the case of 1st element delete
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        let sentinel: ListNode? = ListNode()
        sentinel?.next = head
        var prevNode = sentinel
        var currentNode = head
        while currentNode != nil {
            if currentNode?.val == val {
                prevNode?.next = currentNode?.next
            } else {
                prevNode = currentNode
            }
            currentNode = currentNode?.next
        }
        return sentinel?.next
    }
}