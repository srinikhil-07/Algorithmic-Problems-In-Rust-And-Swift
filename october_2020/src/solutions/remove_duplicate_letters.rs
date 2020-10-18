use std::collections::HashMap;
impl crate::solutions::Solution {
    #[allow(dead_code)]
    pub fn remove_duplicate_letters_WA(s: String) -> String {
        let mut hash_set: Vec<i32> = vec![0; 26];
        let mut answer = String::new();
        for i in 0..s.len() {
            //hash_set.insert((s.chars().nth(i).unwrap() as i32 - 97) as usize, 1);
            hash_set[(s.chars().nth(i).unwrap() as i32 - 97) as usize] = 1;
        }
        for i in 0..hash_set.len() {
            if hash_set[i] == 1 {
                let character  = ((i+97) as u8 ) as char;
                answer.push(character);
            }
        }
        answer
    }
    #[allow(dead_code)]
    pub fn remove_duplicate_letters(s: String) -> String { 
        if s.len() == 0 {
            return s;
        }
        let mut set: HashMap<char, usize> = HashMap::new();
        let mut answer: String = String::new();
        for i in 0..s.len() {
            set.insert(s.chars().nth(i).unwrap(), i);
        }
        let size = set.len();
        let mut invalid: Vec<char> = vec![];
        let mut end = crate::solutions::Solution::get_minimum_index(set.clone());
        let mut start = 0;
        for k in 0..size {
            let mut min = ("z".chars().nth(0).unwrap() as i32) + 1;
            for i in start..end {
                if (s.chars().nth(i).unwrap() as i32) < min {
                    if !invalid.contains(&s.chars().nth(i).unwrap()) {
                        min = s.chars().nth(i).unwrap() as i32;
                    }
                }
            }
            answer.push(s.chars().nth(min as usize).unwrap());
            invalid.push(s.chars().nth(min as usize).unwrap());
            set.remove(&s.chars().nth(min as usize).unwrap());
            end = crate::solutions::Solution::get_minimum_index(set.clone());
            start = end + 1;
        }
        return answer;
    }
    fn get_minimum_index(set: HashMap<char, usize>) -> usize {
        let mut min: usize = 10001;
        for i in set {
            if i.1 < min {
                min = i.1;
            }
        }
        min
    }
    //1. hash of letters with their last occurence
    //2. lowest to highest last occurences -> get min always
    //3. from start to min, pick not-yet picked min letter
}
//a -> 2
//b -> 1,6
//c -> 0, 3, 5, 7
//d -> 4

//cbad, bacd, acdb
// 1. Greedily add chars
// 2. Subsequence check