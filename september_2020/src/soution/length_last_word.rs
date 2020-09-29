impl crate::soution::Solution {
    #[allow(dead_code)]
    pub fn length_of_last_word(s: String) -> i32 {
        if s.len() == 0 {
            return 0;
        }
        let word = s.split_whitespace().next_back().unwrap_or("");
        word.len() as i32
    }
}
