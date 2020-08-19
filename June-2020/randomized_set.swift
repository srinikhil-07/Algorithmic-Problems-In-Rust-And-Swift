import Foundation
//
///https://leetcode.com/explore/challenge/card/june-leetcoding-challenge/540/week-2-june-8th-june-14th/3358/
/// - ToDo: 1. Learn Swift hash internals and implement one yourself mirroring the internals, 2. Learn and implement Swift
/// Hash-Set
public class RandomizedSet {
    var numbers: Set<Int>
    /** Initialize your data structure here. */
    public init() {
        numbers = Set()
    }

    /** Inserts a value to the set. Returns true if the set did not already contain the specified element. */
    public func insert(_ val: Int) -> Bool {
        if numbers.contains(val) {
            return false
        }
        numbers.insert(val)
        return true
    }

    /** Removes a value from the set. Returns true if the set contained the specified element. */
    public func remove(_ val: Int) -> Bool {
        if numbers.contains(val) {
            numbers.remove(val)
            return true
        }
        return false
    }

    /** Get a random element from the set. */
    public func getRandom() -> Int {
        var g = SystemRandomNumberGenerator()
        return numbers.randomElement(using: &g) ?? 0
    }
}

func testHash() {
        let obj = RandomizedSet()
        print(obj.insert(1))
        print(obj.remove(2))
        print(obj.insert(2))
        print(obj.getRandom())
        print(obj.remove(1))
        print(obj.insert(2))
        print(obj.getRandom())
}
testHash()