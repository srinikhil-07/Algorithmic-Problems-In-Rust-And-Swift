import Foundation

func plusOne(_ digits: [Int]) -> [Int] {
    var carry = 0
    var answer = digits
    var iterator = digits.count-1
    repeat {
        if digits[iterator] == 9 {
            carry = 1
            answer[iterator] = 0
        } else {
            carry = 0
            answer[iterator] = digits[iterator] + 1
        }
        iterator = iterator - 1
        //print("\(iterator), \(carry)")
    } while carry != 0 && iterator >= 0
    if carry != 0 {
        answer.insert(1, at: 0)
    }
    return answer
}
func testPlusOne() {
    print(plusOne([9]))
}
testPlusOne()
///Example edge cases: 999+1 =1000, 299+1 =300, 239+1=240, 2939+1=2940, 0
//
//