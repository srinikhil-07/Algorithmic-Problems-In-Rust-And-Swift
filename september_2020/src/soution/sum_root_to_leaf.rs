//Definition for a binary tree node.
#[derive(Debug, PartialEq, Eq)]
pub struct TreeNode {
    pub val: i32,
    pub left: Option<Rc<RefCell<TreeNode>>>,
    pub right: Option<Rc<RefCell<TreeNode>>>,
}
impl TreeNode {
    #[inline]
    #[allow(dead_code)]
    pub fn new(val: i32) -> Self {
        TreeNode {
            val,
            left: None,
            right: None,
        }
    }
}
use std::cell::RefCell;
use std::rc::Rc;

impl crate::soution::Solution {
    #[allow(dead_code)]
    pub fn sum_root_to_leaf(self: &Self, root: Option<Rc<RefCell<TreeNode>>>) -> i32 {
        let mut root_to_leaf: i32 = 0;
        crate::soution::Solution::preorder(root, 0, &mut root_to_leaf);
        root_to_leaf
    }
    #[allow(dead_code)]
    pub fn preorder(
        root: Option<Rc<RefCell<TreeNode>>>,
        curr_number: i32,
        root_to_leaf: &mut i32,
    ) -> Option<Rc<RefCell<TreeNode>>> {
        let node = root?;
        //let val = Rc::try_unwrap(node).ok().unwrap().into_inner().val;
        let val = node.borrow().val;
        let present_num = (curr_number << 1) | val;
        if let Some(_) = node.borrow().right {
            if let Some(_) = node.borrow().left {
                *root_to_leaf = *root_to_leaf + present_num;
            }
        }
        Some(node)
    }
}
