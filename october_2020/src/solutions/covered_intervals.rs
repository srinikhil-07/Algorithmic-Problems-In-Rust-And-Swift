impl crate::solutions::Solution {
    #[allow(dead_code)]
    pub fn remove_covered_intervals(intervals: Vec<Vec<i32>>) -> i32 {
        if intervals.len() == 0 || intervals.len() == 1 {
            return 0;
        }
        let mut given_interval = intervals;
        given_interval.sort_by(|a, b| (a[0]).cmp(&b[0]));
        let mut valid_intervals: Vec<Vec<i32>> = vec![];
        valid_intervals.push(given_interval[0].clone());
        for interval in given_interval {
            if crate::solutions::Solution::valid_interval(&interval, &valid_intervals) {
                valid_intervals.push(interval);
            }
        }
        return valid_intervals.len() as i32;
    }
    fn valid_interval(current_interval: &Vec<i32>, intervals: &Vec<Vec<i32>>) -> bool {
        for i in intervals {
            if current_interval[0] >= i[0] && current_interval[1] <= i[1] {
                return false;
            }
        }
        true
    }
}
