import Foundation

class Solution {
    /// Range: -2^31 < n < 2^31
    /// Algorithm: Fast power -> (x^n)^n = x^2n
    func myPow(_ x: Double, _ n: Int) -> Double {
        var N = n, X = x
        if N < 0 {
            X = 1/x
            N = -N
        }
        return fastPower(X, N)
    }
    func fastPower(_ x: Double, _ n: Int) -> Double {
        if n == 0 {
            return 1.0
        }
        // If let n = 11, then n/2 -> 5 and we can get x^11 by x^5*x^5*x
        let half = fastPower(x, n/2)
        if n%2 == 0 {
            return half*half
        } else {
            return half*half*x
        }
    }
}