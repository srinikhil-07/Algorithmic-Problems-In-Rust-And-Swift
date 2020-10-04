use std::collections::HashMap;
impl crate::solutions::Solution {
    #[allow(dead_code)]
    pub fn find_pairs(nums: Vec<i32>, k: i32) -> i32 {
        if nums.len() == 0 || k < 0 {
            return 0;
        }
        let mut map: HashMap<i32, i32> = HashMap::new();
        // hash the numbers
        for i in 0..nums.len() {
            if map.contains_key(&nums[i]) {
                let mut count = map[&nums[i]];
                count = count + 1;
                map.insert(nums[i], count);
            } else {
                map.insert(nums[i], 1);
            }
        }
        let mut answer = 0;
        if k == 0 {
            for key in map {
                if key.1 >= 2 {
                    answer = answer + 1;
                }
            }
        } else {
            for key in map.clone() {
                let required_key = key.0 + k;
                if map.contains_key(&required_key) {
                    answer = answer + 1;
                }
            }
        }
        return answer;
    }
}
//Reference: https://programmer.help/blogs/leetcode-algorithm-question-k-diff-pairs-in-an-array-java-implementation.html
