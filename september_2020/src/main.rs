mod soution;
fn main() {
    println!("Hello, world!");
    let ans = soution::Solution::compare_version("1.0".to_string(), "1.0.2".to_string());
    println!("{:?}", ans);
    let result = soution::Solution::word_pattern("abba".to_string(), "dog cat cat dog".to_string());
    println!("{:}", result);
    println!(
        "{:}",
        soution::Solution::length_of_last_word("helllo world".to_string())
    );
}
