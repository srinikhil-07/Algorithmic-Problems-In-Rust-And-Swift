//
//  invert_binary_tree.swift
//  Leetcode-June-2020
//
//  Created by Nikhil on 6/1/20.
//  Copyright © 2020 Nikhil All rights reserved.
//

import Foundation

// Definition for a binary tree node.
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

func invertTree(_ root: TreeNode?) -> TreeNode? {
    if root == nil {
        return nil
    }
    invertTree(root?.left)
    invertTree(root?.right)
    let temp = root?.left
    root?.left = root?.right
    root?.right = temp
    return root
}

