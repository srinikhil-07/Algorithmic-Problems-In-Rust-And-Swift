mod solutions;
fn main() {
    println!("Hello, world!");
    let mut obj = solutions::recent_calls::RecentCounter::new();
    // println!("{:}", obj.ping(1));
    // println!("{:}", obj.ping(100));
    // println!("{:}", obj.ping(3001));
    // println!("{:}", obj.ping(3002));
    println!("{:}", solutions::Solution::search([5].to_vec(), 5));
    println!("{}",solutions::Solution::remove_duplicate_letters_WA("cbacdcbc".to_string()));
    let mut vec: Vec<i32> = [1,2,3,4,5,6,7].to_vec();
    solutions::Solution::rotate(&mut vec, 3);
    println!("{:?}",vec);
}
