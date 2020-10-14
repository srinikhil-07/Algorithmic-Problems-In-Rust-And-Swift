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
}
//a -> 2
//b -> 1,6
//c -> 0, 3, 5, 7
//d -> 4

//cbad, bacd, acdb
// 1. Greedily add chars
// 2. Subsequence check