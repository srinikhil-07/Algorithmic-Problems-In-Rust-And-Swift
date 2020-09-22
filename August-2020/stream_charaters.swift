import Foundation
///https://leetcode.com/explore/challenge/card/august-leetcoding-challenge/552/week-4-august-22nd-august-28th/3434/
/// Trie
/// ToDo: TLE solution, improve performance
class StreamChecker {
    let trie = TrieNode()
    var stream = [Character]()
    init(_ words: [String]) {
        for word in words {
            var node = trie
            let reversedWord = String(word.reversed())
            for index in 0..<reversedWord.count {
                if node.children[reversedWord.getCharacter(at: index)] == nil {
                    node.children.updateValue(TrieNode(), forKey: reversedWord.getCharacter(at: index))
                }
                node = node.children[reversedWord.getCharacter(at: index)]!
            }
            node.word = true
        }
    }
    
    func query(_ letter: Character) -> Bool {
        stream.insert(letter, at: 0)
        var node = trie
        for char in stream {
            if node.word {
                return true
            }
            if let child = node.children[char] {
                node = child
            } else {
                return false
            }
        }
        return node.word
    }
}

class TrieNode {
    var children = Dictionary<Character, TrieNode>()
    var word = false
}

extension String {
    func getCharacter(at index: Int) -> Character {
        return self[self.index(self.startIndex, offsetBy: index)]
    }
}