impl crate::solutions::Solution {
    #[allow(dead_code)]
    pub fn combination_sum(candidates: Vec<i32>, target: i32) -> Vec<Vec<i32>> {
        let mut result: Vec<Vec<i32>> = vec![];
        let mut current_canditates: Vec<i32> = vec![];
        crate::solutions::Solution::back_track(
            candidates,
            target,
            &mut current_canditates,
            &mut result,
            0,
            0,
        );
        return result;
    }
    pub fn back_track(
        candidates: Vec<i32>,
        target: i32,
        current_canditates: &mut Vec<i32>,
        result: &mut Vec<Vec<i32>>,
        sum: i32,
        start: i32,
    ) {
        if sum > target {
            return;
        }
        if sum == target {
            result.push(current_canditates.to_vec());
        }
        for i in start..(candidates.len() as i32) {
            current_canditates.push(candidates[i as usize]);
            crate::solutions::Solution::back_track(
                candidates.clone(),
                target,
                current_canditates,
                result,
                sum + candidates[i as usize],
                i,
            );
            current_canditates.pop();
        }
    }
}
