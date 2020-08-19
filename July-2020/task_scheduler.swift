import Foundation
///https://leetcode.com/explore/challenge/card/july-leetcoding-challenge/547/week-4-july-22nd-july-28th/3404/
/// Hash-Set
class Solution {
    func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
        var hash = Array.init(repeating: 0, count: 26)
        for char in tasks {
            ///Swift improvement needed: Error if index not casted to Int: cannot convert value of UInt8 to Int
            hash[Int(char.asciiValue! - Character("A").asciiValue!)] = hash[Int(char.asciiValue! - Character("A").asciiValue!)] + 1
        }
        hash.sort()
        let fmax = hash[25]
        var idleTime = (fmax - 1)*n
        for freqIndex in (0...(hash.count - 2)).reversed() {
            if idleTime > 0 {
                idleTime = idleTime - min(fmax-1, hash[freqIndex])
            } else {
                break
            }
        }
        /// idletime can become negative, if so make it 0
        idleTime = max(0, idleTime)
        return idleTime + tasks.count 
    }
}
