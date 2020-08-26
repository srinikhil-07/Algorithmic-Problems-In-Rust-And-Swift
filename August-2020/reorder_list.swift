import Foundation
///https://leetcode.com/explore/challenge/card/august-leetcoding-challenge/551/week-3-august-15th-august-21st/3430/
/// Linked list, 
public class ListNode {
      public var val: Int
      public var next: ListNode?
      public init() { self.val = 0; self.next = nil; }
      public init(_ val: Int) { self.val = val; self.next = nil; }
      public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}
class Solution {
    func reorderList(_ head: ListNode?) {
        guard head != nil else {
            return
        }
        // split linked list,
        var fast = head, slow = head
        while fast != nil && fast?.next != nil  {
            fast = fast?.next?.next
            slow = slow?.next
        }
        // reverse second linked list
        var prev: ListNode?, current = slow, temp = current
        while current != nil {
            temp = current?.next
            current?.next = prev
            prev = current
            current = temp
        }
        // merge linked list
        var first = head, second = prev
        while second?.next != nil {
            temp = first?.next
            first?.next = second
            first = temp
            temp = second?.next
            second?.next = first
            second = temp
        }
    }
}
/// 1->2->3->4->5