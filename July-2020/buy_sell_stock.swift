import Foundation
///https://leetcode.com/explore/featured/card/july-leetcoding-challenge/548/week-5-july-29th-july-31st/3405/
/// Dynamic-Programming
class Solution {
    /// 1. State diagram will help a lot,
    /// 2. Implicitly this problem suggests "rest" day can be taken even after buying 
    /// 3. DP solution
    func maxProfit(_ prices: [Int]) -> Int {
        return 0
    }
}

///State diagram:
/// Different possible states
/// Buy -> Sell -> Reset (must) -> ...
/// Rest -> Buy -> Reset -> Sell -> Reset (must) ->...
/// Reset -> Buy -> Rest -> Reset -> Reset -> Sell -> Reset (must) -> ...
/// etc..