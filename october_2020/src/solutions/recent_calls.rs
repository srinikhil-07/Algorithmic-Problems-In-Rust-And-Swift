#[warn(dead_code)]
pub struct RecentCounter {
    pub array: Vec<i32>,
}
///Binary-Search
/**
 * `&self` means the method takes an immutable reference.
 * If you need a mutable reference, change it to `&mut self` instead.
 */
#[allow(dead_code)]
impl RecentCounter {
    #[warn(dead_code)]
    pub fn new() -> Self {
        let arr: Vec<i32> = vec![];
        RecentCounter { array: arr }
    }
    #[warn(dead_code)]
    pub fn ping(&mut self, t: i32) -> i32 {
        self.array.push(t);
        return self.array.len() as i32 - self.binary_search(t - 3000);
    }
    /// Vector length is the total no.of pings. So, for any t'th ping we
    /// need index of (t-3000)th value so that we can calculate cumulative sum
    /// by vec.len() - index of (t-3000)
    #[warn(dead_code)]
    fn binary_search(&self, t: i32) -> i32 {
        println!("Binary search for {:}", t);
        let mut low: i32 = 0;
        let mut high: i32 = self.array.len() as i32 - 1;
        println!("Low: {:}, high: {:}", low, high);
        while low < high {
            let mid: i32 = low + (high - low) / 2;
            println!("Mid is  {:}", mid);
            if self.array[mid as usize] == t {
                return mid as i32;
            } else if self.array[mid as usize] < t {
                low = mid + 1;
            } else {
                high = mid - 1;
            }
        }
        println!("Vector length {:}, low is {:}", self.array.len(), low);
        if t > self.array[low as usize] {
            return (low + 1) as i32;
        } else {
            return low as i32;
        }
    }
}
