//
//  delete_node_list.swift
//  Leetcode-June-2020
//
//  Created by sri-7348 on 6/3/20.
//  Copyright © 2020 Nikhi. All rights reserved.
//

import Foundation

 public class ListNode {
     public var val: Int
     public var next: ListNode?
     public init(_ val: Int) {
         self.val = val
         self.next = nil
     }
 }

// Node won't be tail
func deleteNode(_ node: ListNode?) {
    if let node = node  {
        if let nextNode = node.next {
            node.val = nextNode.val
            node.next = nextNode.next
        }
    }
}
