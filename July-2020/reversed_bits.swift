import Foundation

class Solution {
    //unsigned -> 8 bit: 0 to 255
    // unsigned -> 32 bit: 0 to 2,147,483,648
    // 2's complement -> given N-bit + 2's complement = 2^N => get 2's complement by
    // reversing given N-bit and addinng 1 to it
    func reverseBitsWrongAnswer(_ n: Int) -> Int {
        let binary = String(n, radix: 2) // check how its done & implement your own
        var bits = Array.init(repeating: 0, count: 32)
        var result = 0
        print(binary)
        for i in (0..<binary.count).reversed() {
            //diagnostic can be improved, analyze, report and fix
            //let test = Int(String(binary[binary.index(binary.startIndex, offsetBy: i)])) 
            //let test1 = Int((binary[binary.index(binary.startIndex, offsetBy: i)])) 
            //bits[i] = Int(String(binary[binary.index(binary.startIndex, offsetBy: i)])) ?? 0
            bits[i] = binary[binary.index(binary.startIndex, offsetBy: i)].wholeNumberValue ?? 0
        }
        bits.reverse()
        for i in 0..<bits.count {
            result = result + Int(Double(bits[i])*pow(Double(2), Double(i)))
        }
        return result
    }
    func reverseBits(_ n: Int) -> Int {
        var ret = 0, power = 31, number = n
        //reverses bits of a number and sums them
        while number != 0 {
            //get LSB and shift it by power times 
            ret = ret + (n & 1) << power 
            number = number >> 1
            power = power - 1
        }
        return ret
    }
}
//Example: 00000010100101000001111010011100
func testReverseBits() {
    print(Solution.init().reverseBits(43261596))
}

testReverseBits()