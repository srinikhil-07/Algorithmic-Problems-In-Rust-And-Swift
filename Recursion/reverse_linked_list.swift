import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        if head?.next == nil || head == nil {
            return head
        }
        let node = reverseList(head?.next)
        head?.next?.next = head
        head?.next = nil
        return node
    }
}