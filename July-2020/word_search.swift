import Foundation
///https://leetcode.com/explore/challenge/card/july-leetcoding-challenge/546/week-3-july-15th-july-21st/3397/
    ///Backtracking paradigm: 
    /// 1. Recursive so define base case: If its done
    /// 2. Check for validity for making a choice
    /// 3. Flag the choice before chossing it,
    /// 4. If the choice made doesn't work, de-flag it and return back 
class Solution {
    var game = [[Character]]()
    var find = String()
    var visited = [Bool]()
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        game = board
        find = word
        for i in 0..<board.count {
            for j in 0..<board[0].count {
                if board[i][j] == word[word.startIndex] {
                    
                }
            }
        }
        return false
    }
    func backtrack(_ i: Int, _ j: Int, _ index: Int) -> Bool {
        //base case
        if index >= find.count {
            return true
        }
        // validity check 
        if i < 0 || i >= game[0].count - 1 || j < 0 || j >= game.count || game[i][j] != find.getCharacter(at: index) {
            return false
        }
        var result = false
        let temp = game[i][j]
        game[i][j] = "#"
        let x = [-1,1,0,0]
        let y = [0,0,-1,1]
        for dir in 0..<3 {
            result = backtrack(i+x[dir], j+y[dir], index+1)
        }
        game[i][j] = temp
        return result
    }
    /// [-1,0],[1,0],[0,-1],[0,1]
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