import Foundation
/// Binary-Search
func hIndex(_ citations: [Int]) -> Int {
    let n = citations.count
    var left = 0, right = n-1
    while left <= right {
        let pivot = left + (right-left)/2
        if citations[pivot] == n - pivot {
            return n-pivot
        } else if citations[pivot] < n - pivot {
            left = pivot + 1
        } else {
            right = pivot - 1
        }
    }
    return n - left
}

func testhIndex() {
    

}
// h = cit[(n-2)/2] -> h>=n-(n-2)/2 -> 
// [0,1,4,5,6]