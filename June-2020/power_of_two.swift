import Foundation

// - ToDo: Learn the bitwise solution as well
/// Math, Bitwise
func isPowerOfTwo(_ n: Int) -> Bool {
    var n = n
    if n == 0 {
        return false
    }
    while n % 2 == 0 {
        n = n/2
    }
    return n == 1
}
func testisPowerOfTwo() {
    print(isPowerOfTwo(1))
}
testisPowerOfTwo()