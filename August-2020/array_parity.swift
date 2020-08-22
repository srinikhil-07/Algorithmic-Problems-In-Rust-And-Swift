import Foundation
///https://leetcode.com/explore/challenge/card/august-leetcoding-challenge/551/week-3-august-15th-august-21st/3431/
/// Two pass, 
class Solution {
    func sortArrayByParity(_ A: [Int]) -> [Int] {
        var given = A
        var front = 0, end = A.count - 1
        while(front < end) {
            //print("front: \(front), end: \(end)")
            if(given[front]%2 > given[end]%2) {
                let temp = A[front]
                given[front] = given[end]
                given[end] = temp
            }
            if(given[front]%2 == 0) {
                front = front + 1
            }
            if(given[end]%2 == 1) {
                end = end - 1
            }
        }
        return given
    }
}
func testSortArrayByParity() {

}