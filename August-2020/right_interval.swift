import Foundation
///https://leetcode.com/explore/challenge/card/august-leetcoding-challenge/552/week-4-august-22nd-august-28th/3438/
class Solution {
    var result = [Int]()
    var hash = Dictionary<Interval, Int>()
    var given = [[Int]]()
    func findRightInterval(_ intervals: [[Int]]) -> [Int] {
        given = intervals
        for index in 0..<intervals.count {
            let sample = Interval(range: intervals[index], index: index)
            hash.updateValue(index, forKey: sample)
        }
        given.sort {
            return $0[0] < $1[0]
        }
        for index in 0..<intervals.count {
            
        }
        return []
    }
    func binarySearch(_ target: Int, _ start: Int, _ end: Int) -> [Int]? {
        if start >= end {
            if self.given[start][0] >= target {
                return given[start]
            }
            return nil
        }
        let mid = (end + start)/2 // risky 
        if given[mid][0] < target {
            return binarySearch(target, mid + 1, end)
        } else {
            return binarySearch(target, start, mid)
        }
    }
}
/// Example: [ [3,4], [2,3], [1,2] ]
/// [[1,2], [2,3], [3,4]]
struct Interval: Hashable {
        var range: [Int]
        var index: Int
}
print(Solution.init().findRightInterval([[1,0]]))