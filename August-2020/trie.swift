import Foundation
///https://leetcode.com/problems/implement-trie-prefix-tree/
/// Trie
/// Working implementation
class Trie {
    let trie: Trie_Node
    /** Initialize your data structure here. */
    init() {
        trie = Trie_Node()
    }
    
    /** Inserts a word into the trie. */
    func insert(_ word: String) {
        var node = trie
        for index in 0..<word.count {
            if node.children[word.getCharacter(at: index)] == nil {
                node.children.updateValue(Trie_Node(), forKey: word.getCharacter(at: index))
            } 
            node = node.children[word.getCharacter(at: index)]!
        }
        node.word = true
    }
    
    /** Returns if the word is in the trie. */
    func search(_ word: String) -> Bool {
        let node = searchPrefix(word)
        return node != nil && node?.word == true
    }
    func searchPrefix(_ word: String) -> Trie_Node? {
        var node = trie
        for index in 0..<word.count {
            if let child = node.children[word.getCharacter(at: index)] {
                node = child
            } else {
                return nil
            }
        }
        return node
    }
    /** Returns if there is any word in the trie that starts with the given prefix. */
    func startsWith(_ prefix: String) -> Bool {
        let node = searchPrefix(prefix)
        return node != nil
    }
}
/// Simplified implementation: nested hash, 
/// ToDo: Can below Swift dictionary impl can be considered hash set?
class Trie_Node {
    var children = Dictionary<Character, Trie_Node>()
    var word = false
}
extension String {
    func getCharacter(at index: Int) -> Character {
        return self[self.index(self.startIndex, offsetBy: index)]
    }
}
/// TrieNode from scratch
class TrieNode {
    var links =  [TrieNode?]()
    var keySize = 26
    var isEnd = false
    func containsKey(_ char: Character) -> Bool {
        return links[getDiff(char, Character("a"))] != nil
    }
    func get(character char: Character) -> TrieNode? {
        if let trieNode = links[getDiff(char, Character("a"))] {
            return trieNode
        }
        return nil
    }
    func put(character char: Character, for node: TrieNode) {
        links[getDiff(char, Character("a"))] = node
    }
    func getDiff(_ a: Character, _ b: Character) -> Int {
        return Int((a.asciiValue ?? 0) - (b.asciiValue ?? 0))
    }
    func setEnd() {
        isEnd = true
    }
}
