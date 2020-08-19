import Foundation
///https://leetcode.com/explore/challenge/card/august-leetcoding-challenge/550/week-2-august-8th-august-14th/3422/
class CombinationIterator {
    var characters = String()
    var cLength = Int()
    init(_ characters: String, _ combinationLength: Int) {
        self.characters = characters
        self.cLength = combinationLength
    }
    func next() -> String {
        return ""
    }
    func hasNext() -> Bool {
        return true
    }
    func generateCombinations() {

    }
}
///Paradigm:Bit-Masking
///Paradigm:Lexicographic-Combinations
///Level:Medium