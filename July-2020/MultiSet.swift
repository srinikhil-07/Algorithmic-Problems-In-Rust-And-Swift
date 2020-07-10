import Foundation

/// Multiset: https://github.com/raywenderlich/swift-algorithm-club/blob/master/Multiset/Multiset.playground/Sources/Multiset.swift
    public struct Multiset<T: Hashable> {
    /// MARK : - variables
    private var storage: [T: UInt] = [:]
    public private(set) var count: UInt = 0
    public var isEmpty: Bool {
        return storage.count == 0
    }
    /// MARK: - Initializers
    public init() {}

    public init<C: Collection>(_ collection: C) where C.Element == T {
        for element in collection {
            self.add(element)
        }
    }

    public init<S>(_ sequence: S) where S : Sequence, S.Element == T {
        for element in sequence {
            self.add(element)
        }
    }

    public mutating func add (_ elem: T) {
        storage[elem, default: 0] += 1
        count += 1
    }

    public mutating func remove (_ elem: T) {
        if let currentCount = storage[elem] {
            if currentCount > 1 {
                storage[elem] = currentCount - 1
            } else {
            storage.removeValue(forKey: elem)
            }
            count -= 1
        }
    }

    public func isSubSet (of superset: Multiset<T>) -> Bool {
        for (key, count) in storage {
            let supersetcount = superset.storage[key] ?? 0
            if count > supersetcount {
                return false
            }
        }
        return true
    }

    public func count(for key: T) -> UInt {
        return storage[key] ?? 0
    }

    public var allItems: [T] {
        var result = [T]()
        for (key, count) in storage {
            for _ in 0 ..< count {
                result.append(key)
            }
        }
        return result
    }

    public func contains(_ key: T) -> Bool {
        return (storage[key] ?? 0) > 0 
    }
}

// MARK: - Equatable
extension Multiset: Equatable {
  public static func == (lhs: Multiset<T>, rhs: Multiset<T>) -> Bool {
    if lhs.storage.count != rhs.storage.count {
      return false
    }
    for (lkey, lcount) in lhs.storage {
      let rcount = rhs.storage[lkey] ?? 0
      if lcount != rcount {
        return false
      }
    }
    return true
  }
}

// MARK: - ExpressibleByArrayLiteral
extension Multiset: ExpressibleByArrayLiteral {
  public init(arrayLiteral elements: T...) {
    self.init(elements)
  }
}

func testMultiSet() {
    let primes: Multiset = [2, 3, 5, 7, 11, 13, 17, 19, 23]
}