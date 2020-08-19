import Foundation
///https://leetcode.com/explore/challenge/card/july-leetcoding-challenge/547/week-4-july-22nd-july-28th/3402/
/// Math
class Solution {
    ///Refer digital root
    func addDigits(_ num: Int) -> Int {
        return num == 0 ? 0 : (num % 9) == 0 ? 9 : num % 9
    }
}