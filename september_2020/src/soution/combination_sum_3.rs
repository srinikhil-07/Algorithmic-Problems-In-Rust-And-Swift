impl crate::soution::Solution {
    //Back-tracking
    #[allow(dead_code)]
    pub fn combination_sum3(k: i32, n: i32) -> Vec<Vec<i32>> {
        let mut result: Vec<Vec<i32>> = vec![];
        let mut current: Vec<i32> = vec![];
        crate::soution::Solution::dfs(k, n, 1, &mut current, &mut result);
        result
    }
    #[allow(dead_code)]
    fn dfs(k: i32, n: i32, s: i32, current: &mut Vec<i32>, result: &mut Vec<Vec<i32>>) {
        if k == 0 {
            if n == 0 {
                result.push(current.clone());
            }
        }
        for i in s..9 {
            if i > n {
                return;
            }
            current.push(i);
            crate::soution::Solution::dfs(k, n, i, current, result);
            current.pop();
        }
    }
}
