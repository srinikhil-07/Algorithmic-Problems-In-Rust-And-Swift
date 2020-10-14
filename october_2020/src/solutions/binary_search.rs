impl crate::solutions::Solution {
    #[warn(dead_code)]
    pub fn search(nums: Vec<i32>, target: i32) -> i32 {
        let mut left: i32 = 0;
        let length: i32 = nums.len() as i32;
        let mut right: i32 = length - 1;
        while left <= right {
            let mid = left + (right - left) / 2;
            if nums[mid as usize] == target {
                return mid as i32;
            } else if nums[mid as usize] > target {
                right = mid - 1;
            } else {
                left = mid + 1;
            }
        }
        -1
    }
}
