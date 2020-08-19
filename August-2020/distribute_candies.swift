import Foundation
///https://leetcode.com/explore/challenge/card/august-leetcoding-challenge/551/week-3-august-15th-august-21st/3427/
class Solution {
    func distributeCandies(_ candies: Int, _ num_people: Int) -> [Int] {
        let sumForEachRow = num_people*(num_people+1)/2
        let passes = candies/sumForEachRow
        var candiesRemaining = candies - sumForEachRow*passes
        var result = Array.init(repeating: 0, count: num_people)
        for person in 0..<num_people {
            if passes*num_people+(person+1) <= candiesRemaining {
                print("Remaining candies: \(candiesRemaining)")
                result[person] = (passes*num_people)+(person+1)+(passes*(passes+1)/2)
                candiesRemaining = candiesRemaining - ((passes*num_people)+(person+1))
            } else {
                result[person-1] = candiesRemaining
                for remaining in person..<num_people {
                    print("Remaining: \(remaining)")
                    result[remaining] = (remaining+1)*passes*(passes+1)/2
                }
                break
            }
        }
        return result
    }
}
func testDistributeCandies() {
    print(Solution.init().distributeCandies(7, 4))
}
testDistributeCandies()