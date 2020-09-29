impl crate::soution::Solution {
    #[allow(dead_code)]
    pub fn max_product(nums: Vec<i32>) -> i32 {
        let mut max_till_now = nums[0];
        let mut min_till_now = nums[0];
        let mut max = nums[0];
        for i in 1..nums.len() {
            if nums[i] < 0 {
                std::mem::swap(&mut max_till_now, &mut min_till_now);
            }
            max_till_now = std::cmp::max(nums[i], nums[i] * max_till_now);
            min_till_now = std::cmp::min(nums[i], nums[i] * min_till_now);
            max = std::cmp::max(max, max_till_now);
        }
        max
    }
}
