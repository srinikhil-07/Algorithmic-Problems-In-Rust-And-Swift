impl crate::soution::Solution {
    pub fn insert(intervals: Vec<Vec<i32>>, new_interval: Vec<i32>) -> Vec<Vec<i32>> {
        let mut result: Vec<Vec<i32>> = vec![];
        if intervals.len() == 0 {
            result.insert(0, new_interval.clone());
        }
        let p = crate::soution::Solution::binary_search(intervals.clone(), new_interval.clone());
        for i in p..intervals.len() as i32 {
            if intervals[i as usize][1] < new_interval[0] {
                result.push(new_interval.clone());
            }
        }
        result
    }
    fn binary_search(intervals: Vec<Vec<i32>>, new_interval: Vec<i32>) -> i32 {
        let mut low: usize = 0;
        let mut high = intervals.len();
        while low < high {
            let mid = (low + high) / 2;
            if new_interval[0] <= intervals[mid][0] {
                high = mid;
            } else {
                low = mid + 1;
            }
        }
        if high == 0 {
            return 0;
        }
        (high - 1) as i32
    }
}
// Rust memory rules
// 1. Values are moved -> shallow copies are made
