impl crate::solutions::Solution {
    #[warn(dead_code)]
    ///right-rotate, for left rotate reverse the reversings!
    pub fn rotate(nums: &mut Vec<i32>, k: i32) {
        if nums.len() == 0 || nums.len() == 1 {
            return;
        }
        let d = k % (nums.len() as i32);
        crate::solutions::Solution::reverse_array(nums,0,nums.len() as i32 - d);
        crate::solutions::Solution::reverse_array(nums, nums.len() as i32 - d,nums.len() as i32);
        crate::solutions::Solution::reverse_array(nums, 0, nums.len() as i32);
    }
    fn reverse_array(nums: &mut Vec<i32>,start: i32, end: i32) {
        let i = start + (end-start)/2;
        for j in start..i {
            let temp = nums[j as usize];
            nums[j as usize] = nums[(end-j+start-1) as usize];
            nums[(end-j+start-1) as usize] = temp;
        }
    }
}