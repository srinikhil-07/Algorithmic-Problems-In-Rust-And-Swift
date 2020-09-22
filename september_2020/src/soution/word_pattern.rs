use std::collections::HashMap;
impl crate::soution::Solution {
    #[allow(dead_code)]
    pub fn word_pattern(pattern: String, s: String) -> bool {
        let mut hash_set: HashMap<String, String> = HashMap::new();
        let s_count = s.split_ascii_whitespace().count();
        let pattern_length = pattern.len();
        if pattern_length != s_count {
            return false;
        }
        let words = s.split_whitespace().collect::<Vec<&str>>();
        let mut p = pattern.split("").collect::<Vec<&str>>();
        p.remove(0);
        p.remove(p.len() - 1);
        println!("Words: {:?} and pattern {:?}", words, p);
        for i in 0..pattern_length {
            if hash_set.contains_key(p[i]) {
                if hash_set[p[i]] != words[i] {
                    return false;
                }
            } else {
                let values = hash_set.values();
                for value in values {
                    if value == words[i] {
                        return false;
                    }
                }
                hash_set.insert(p[i].to_string(), words[i].to_string());
            }
        }
        return true;
    }
}
////reference: https://dxmahata.gitbooks.io/leetcode-python-solutions/content/word_pattern.html
