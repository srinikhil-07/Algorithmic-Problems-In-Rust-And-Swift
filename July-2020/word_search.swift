import Foundation
///https://leetcode.com/explore/challenge/card/july-leetcoding-challenge/546/week-3-july-15th-july-21st/3397/
/// TODO: Solve it on 22nd July
class Solution {
    var given = [[Character]]()
    var current = ()
    var match = String()
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        given = board
        match = word
        for i in 0..<board.count {
            for j in 0..<board[0].count {
                if board[i][j] == word[word.startIndex] {
                    
                }
            }
        }
        return false
    }
    func wordSearch(_ i: Int, _ j: Int, _ index: Int) -> Bool {
        return true
    }
}
extension String {
    func getCharacter(at index: Int) -> Character {
        return self[self.index(self.startIndex, offsetBy: index)]
    }
}
// Backtracking pattern
// def backtrack(candidate):
//     if find_solution(candidate):
//         output(candidate)
//         return
    
//     # iterate all possible candidates.
//     for next_candidate in list_of_candidates:
//         if is_valid(next_candidate):
//             # try this partial candidate solution
//             place(next_candidate)
//             # given the candidate, explore further.
//             backtrack(next_candidate)
//             # backtrack
//             remove(next_candidate)