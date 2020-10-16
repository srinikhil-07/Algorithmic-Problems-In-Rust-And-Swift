//https://leetcode.com/explore/challenge/card/october-leetcoding-challenge/560/week-2-october-8th-october-14th/3494/
///Dynamic-Programming
impl crate::solutions::Solution {
    #[allow(dead_code)]
    pub fn rob(nums: Vec<i32>) -> i32 {
        if nums.len() == 0 {
            return 0;
        }
        if nums.len() == 1 {
            return nums[0];
        }
        //circular house robber problem, so we want 
        // max(nums(0,n-2), nums(1,n-1)) for 0 based index
        let mut given = nums.clone();
        let removed = given.remove(nums.len() -1);
        let val_one = crate::solutions::Solution::house_robber(given.clone());
        given.push(removed);
        given.remove(0);
        let val_two = crate::solutions::Solution::house_robber(given);
        std::cmp::max(val_one, val_two)
    }
    fn house_robber(nums: Vec<i32>) -> i32 {
        if nums.len() == 0 {
            return 0;
        }
        if nums.len() == 1 {
            return nums[0];
        }
        let mut dp: Vec<i32> = vec![];
        dp.push(nums[0]);
        dp.push(std::cmp::max(dp[0], nums[1]));
        for i in 2..nums.len() {
            dp.push(std::cmp::max(dp[i - 2] + nums[i], dp[i - 1]));
        }
        return dp[nums.len() - 1];
    }
}