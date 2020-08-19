import Foundation
///https://leetcode.com/explore/challenge/card/august-leetcoding-challenge/550/week-2-august-8th-august-14th/3420/
/// Binary-Search
class Solution {
    /// - ToDo: Learn and solve this problem with Counting sort
    func hIndex(_ citations: [Int]) -> Int {
        let given = citations.sorted()
        var left = 0, right = given.count - 1
        let n = given.count
        while left < right {
            let mid = left + (right - left)/2
            // (n-mid) papers will have atleast citations[mid] citations
            if given[mid] == n-mid {
                return n-mid
            } else if given[mid] < n-mid {
                left = mid + 1
            } else {
                right = mid - 1 
            }
        }
        return n - left
    }
}
/// 0,1,3,5,6