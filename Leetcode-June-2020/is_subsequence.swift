import Foundation
//can be non-contiguos but relative pos same
/// https://leetcode.com/explore/challenge/card/june-leetcoding-challenge/540/week-2-june-8th-june-14th/3355/
    public func isSubsequence(_ s: String, _ t: String) -> Bool {
        if s.isEmpty {
            return true
        }
        var j = 0, match = 0
        for i in 0..<s.count {
            while(j<t.count) {
                if s[s.index(s.startIndex, offsetBy: i)] == t[t.index(t.startIndex, offsetBy: j)] {
                    match += 1
                    j += 1
                    break
                }
                j += 1
            }
            if j == t.count {
                break
            }
        }
        return match == s.count
    }
    