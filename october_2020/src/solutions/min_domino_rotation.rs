use std::collections::HashMap;
impl crate::solutions::Solution {
    #[allow(dead_code)]
    pub fn min_domino_rotations(a: Vec<i32>, b: Vec<i32>) -> i32 {
        if a.len() == 0 || a.len() == 1 {
            return 0;
        }
        // keys are given numbers and values are their indices
        let mut dictionary: HashMap<i32, Vec<i32>> = HashMap::new();
        for i in 0..a.len() {
            if dictionary.contains_key(&a[i]) {
                let vector = &dictionary[&a[i]];
                let mut given = vector.clone();
                given.push(i as i32);
                dictionary.insert(a[i], given);
            } else {
                dictionary.insert(a[i], [i as i32].to_vec());
            }
            if a[i] != b[i] { //if both are not same, we dont want duplicate indices
                if dictionary.contains_key(&b[i]) {
                    let vector = &dictionary[&b[i]];
                    let mut given = vector.clone();
                    given.push(i as i32);
                    dictionary.insert(b[i], given);
                } else {
                    dictionary.insert(b[i], [i as i32].to_vec());
                }
            }
        }
        println!("Dictionary formed: {:?}", dictionary);
        //if atleast one number has occupied all indices cumulatively in a & b
        let mut cumulative_count = 0;
        let mut keys: Vec<i32> = vec![];
        for (key, values) in dictionary {
            if values.len() == a.len() {
                cumulative_count = cumulative_count + 1;
                keys.push(key);
            }
        }
        if cumulative_count == 0 {
            return -1;
        }
        let mut count_a: i32 = 0; let mut count_b: i32 = 0; let mut min_1: i32 = 0; let mut min_2: i32 = 0;
        for i in 0..a.len() {
            if a[i] != keys[0] {
                count_a = count_a + 1;
            }
            if b[i] != keys[0] { //avoids duplicates
                count_b = count_b + 1;
            }
            min_1 = std::cmp::min(count_a, count_b);
        }
        min_2 = min_1 + 1;
        if cumulative_count == 2 {
            for i in 0..a.len() {
                if a[i] != keys[1] {
                    count_a = count_a + 1;
                }
                if b[i] != keys[1] {
                    count_b = count_b + 1;
                }
                min_2 = std::cmp::min(count_a, count_b);
            }
        }
        return std::cmp::min(min_1, min_2);
    }
}