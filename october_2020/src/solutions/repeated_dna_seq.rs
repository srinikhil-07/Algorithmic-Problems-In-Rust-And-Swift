use std::collections::HashMap;
///Hash-map, bit-map
/// This code although seems right fails at bit masking, 
/// ToDo: Fix bit masking error
impl crate::solutions::Solution {
    #[allow(dead_code)]
    
    pub fn find_repeated_dna_sequences(s: String) -> Vec<String> {
        let mut answer: Vec<String> = Vec::new();
        if s.len() <= 10 {
            return answer;
        }
        let mut hash_map: HashMap<char, i32> = HashMap::new();
        let mut hash_of_hash: HashMap<i32, i32> = HashMap::new();
        hash_map.insert('A', 0);
        hash_map.insert('C', 1);1
        hash_map.insert('G', 2);
        hash_map.insert('T', 3);
        let mut mask: i32 = 1<<20 -1; //this makes last 20 bits to 1 and other 12 to 0 in `mask` var
        println!("Mask: {}",mask);
        let mut hash: i32 = 0;
        for i in 0..s.len() {
            hash <<= 2;
            hash =  hash + hash_map[&s.chars().nth(i).unwrap()]; //hahs_map occupies 2 bits cos val upto 3
            println!("Letter: {}, value: {}, hash: {}",s.chars().nth(i).unwrap(),hash_map[&s.chars().nth(i).unwrap()], hash);
            if i >= 9 {
                println!("Hash before: {}", hash);
                hash &= mask;  //enable last 20 bits alone in `hash`
                println!("String: {}, hash: {}",&s[i-9..i+1], hash);
                if hash_of_hash.contains_key(&hash)  {
                    let count = hash_of_hash[&hash];
                    if count == 1 {
                        //add string to answer
                        let slice = &s[i-9..i+1];
                        answer.push(slice.to_string());
                    }
                    hash_of_hash.insert(hash, count + 1);
                } else {
                    hash_of_hash.insert(hash, 1);
                }
            }
        }
        answer
    }
}