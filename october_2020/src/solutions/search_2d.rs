impl crate::solutions::Solution {
    #[warn(dead_code)]
    pub fn search_matrix(matrix: Vec<Vec<i32>>, target: i32) -> bool {
        let count = matrix.len();
        if count == 0 {
            return false;
        }
        for i in 0..count {
            if i < count - 1 {
                if target < matrix[i+1][0] {
                    if crate::solutions::Solution::search(matrix[i].clone(), target) == -1 {
                        return false;
                    } else {
                        return true;
                    }
                }
            } else { // this takes care of 1st row in 1 row-only input and last row in other inputs
                if crate::solutions::Solution::search(matrix[i].clone(), target) == -1 {
                    return false;
                } else {
                    return true;
                }
            }
        }
        false
    }
}