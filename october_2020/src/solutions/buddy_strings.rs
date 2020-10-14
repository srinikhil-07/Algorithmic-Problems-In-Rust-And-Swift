use std::collections::HashMap;
impl crate::solutions::Solution {
    #[allow(dead_code)]
    pub fn buddy_strings(a: String, b: String) -> bool {
        if a.len() != b.len() {
            return false
        }
        let mut indices: Vec<usize> = vec![];
        //if both strings are same, atleast two chars should be equal to exchange them 
        if a == b {
            let mut hash_set: HashMap<char, i32> = HashMap::new();
            for i in 0..a.len() {
                if hash_set.contains_key(&a.chars().nth(i).unwrap()) {
                    return true;
                } else {
                    hash_set.insert(a.chars().nth(i).unwrap(), 1);
                }
            }
            return false;
        }
        for i in 0..a.len() {
            if a.chars().nth(i).unwrap() != b.chars().nth(i).unwrap() {
                indices.push(i);
            }
        }
        // the diff length should be 2 and exchangeable 
        if indices.len() == 2 {
            if a.chars().nth(indices[0]).unwrap() == b.chars().nth(indices[1]).unwrap() {
                if b.chars().nth(indices[0]).unwrap() == a.chars().nth(indices[1]).unwrap() {
                    return true;
                }
            }
        }
        return false;
    }
}
//two with diff exactly 2 and at same positions
//"abcaa"
//"abcbb"