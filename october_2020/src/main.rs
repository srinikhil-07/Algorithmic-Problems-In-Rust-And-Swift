mod solutions;
fn main() {
    println!("Hello, world!");
    let case = 6;
    match case {
        1 => {
            let mut obj = solutions::recent_calls::RecentCounter::new();
        },
        2 => {
            println!("{}",solutions::Solution::remove_duplicate_letters_WA("cbacdcbc".to_string()));
        },
        3 => {
            let mut vec: Vec<i32> = [1,2,3,4,5,6,7].to_vec();
            solutions::Solution::rotate(&mut vec, 3);
            println!("{:?}",vec);
        },
        4 => {
            println!("{:}", solutions::Solution::search([5].to_vec(), 5));
        },
        5 => {
            println!("Answer: {:?}", solutions::Solution::find_repeated_dna_sequences("AAAAACCCCCAAAAACCCCCCAAAAAGGGTTT".to_string()));
        },
        6 => {
            println!("min_domino_rotation: {:?}", solutions::Solution::min_domino_rotations([2,1,2,4,2,2].to_vec(), [5,2,6,2,3,2].to_vec()));
        },
        _ => println!("No solution"),
    };
    
   
    
    
    
}
