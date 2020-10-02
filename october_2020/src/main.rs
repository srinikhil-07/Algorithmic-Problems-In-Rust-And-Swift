mod solutions;
fn main() {
    println!("Hello, world!");
    let mut obj = solutions::recent_calls::RecentCounter::new();
    println!("{:}", obj.ping(1));
    println!("{:}", obj.ping(100));
    println!("{:}", obj.ping(3001));
    println!("{:}", obj.ping(3002));
}
