import Foundation 

class Solution {
    ///Classic binary search.
    /// Teaches Binary search paradigm 
    func arrangeCoins(_ n: Int) -> Int {
        var left = 0, right = n
        var k = 0
        while left <= right {
            k = left + (right-left)/2
            let current = k*(k+1)/2
            if current == n {
                return k
            }
            if current < n {
                left = k + 1
            } else {
                right = k - 1
            }
        }
        return right
    }
}

func testArrangeCoins() {
    print(Solution.init().arrangeCoins(8))
}

testArrangeCoins()