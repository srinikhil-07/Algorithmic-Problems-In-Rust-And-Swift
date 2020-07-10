import Foundation
//Improvements: 1. Multiset-where insert and remove 2 elements considered, 2.
///2. Can find duplicate in snwer be improved? 
func threeSum_TLEVersion(_ nums: [Int]) -> [[Int]] {
    let n = nums.count
    if n < 3 {
        return []
    } 
    if n == 3 {
        if (nums[0] + nums[2] + nums[1]) == 0 {
            return [nums]
        } else {
            return []
        }
    }
    var answer = [[Int]]()
    for a in 0..<n-2 {
        for b in a+1..<n-1 {
            var set = Set<Int>()
           for c in b+1..<n {
               set.insert(nums[c])
           } 
            let find = 0 - (nums[a] + nums[b])
            if set.contains(find) {
                var arr = [nums[a], nums[b], find]
                arr.sort()
                if !answer.contains(arr) {
                    answer.append(arr)
                }    
           }
        }
    } 
    return answer
}
func threeSum_DarwinOnly(_ nums: [Int]) -> [[Int]] {
    let n = nums.count
    if n < 3 {
        return []
    } 
    if n == 3 {
        if (nums[0] + nums[2] + nums[1]) == 0 {
            return [nums]
        } else {
            return []
        }
    }
    var answer = [[Int]]()
    let set = NSCountedSet.init(array: nums)
    for a in 0..<n-2 {
        for b in a+1..<n-1 {
        //    for c in b+1..<n {
        //        set.add(nums[c])
        //    } 
            set.remove(nums[a])
            set.remove(nums[b])
            let find = 0 - (nums[a] + nums[b])
            if set.contains(find) {
                var arr = [nums[a], nums[b], find]
                arr.sort()
                if !answer.contains(arr) {
                    answer.append(arr)
                }    
           }
           set.add(nums[a])
           set.add(nums[b])
        }
    } 
    return answer
}
func threeSum_MultiSet(_ nums: [Int]) -> [[Int]] {
    let n = nums.count
    if n < 3 {
        return []
    } 
    if n == 3 {
        if (nums[0] + nums[2] + nums[1]) == 0 {
            return [nums]
        } else {
            return []
        }
    }
    var answer = [[Int]]()
    var set = Multiset.init(nums)
    for a in 0..<n-2 {
        for b in a+1..<n-1 {
        //    for c in b+1..<n {
        //        set.add(nums[c])
        //    } 
        set.remove(nums[a])
        set.remove(nums[b])
            let find = 0 - (nums[a] + nums[b])
            if set.count(for: find) > 0 {
                var arr = [nums[a], nums[b], find]
                arr.sort()
                if !answer.contains(arr) {
                    answer.append(arr)
                }    
           }
           set.add(nums[a])
           set.add(nums[b])
        }
    } 
    return answer
}
func testThreeSum() {
    print(threeSum_MultiSet([14,-11,-2,-3,4,-3,-3,-8,-15,11,11,-6,-14,-13,5,-10,-13,0,-12,-8,14,-12,-10,2,-4,9,13,10,2,7,-2,-7,4,11,5,-7,-15,10,-7,-14,6,11,-5,7,6,8,5,8,-7,8,-15,14,11,13,1,-15,7,0,10,-14,14,-15,-14,3,4,6,4,4,-7,12,5,14,0,8,7,13,1,-11,-2,9,12,-1,8,0,-11,-5,0,11,2,-13,4,1,-12,5,-10,-1,-12,9,-12,-11,-2,9,-12,5,-6,2,4,10,6,-13,4,3,-7,-11,11,-3,-9,-4,-15,8,-9,-4,-13,-14,8,14]))
}
testThreeSum()

//[14,-11,-2,-3,4,-3,-3,-8,-15,11,11,-6,-14,-13,5,-10,-13,0,-12,-8,14,-12,-10,2,-4,9,13,10,2,7,-2,-7,4,11,5,-7,-15,10,-7,-14,6,11,-5,7,6,8,5,8,-7,8,-15,14,11,13,1,-15,7,0,10,-14,14,-15,-14,3,4,6,4,4,-7,12,5,14,0,8,7,13,1,-11,-2,9,12,-1,8,0,-11,-5,0,11,2,-13,4,1,-12,5,-10,-1,-12,9,-12,-11,-2,9,-12,5,-6,2,4,10,6,-13,4,3,-7,-11,11,-3,-9,-4,-15,8,-9,-4,-13,-14,8,14]

/// Multiset: https://github.com/raywenderlich/swift-algorithm-club/blob/master/Multiset/Multiset.playground/Sources/Multiset.swift
public struct Multiset<T: Hashable> {
  private var storage: [T: UInt] = [:]
  public private(set) var count: UInt = 0

  public init() {}

  public init<C: Collection>(_ collection: C) where C.Element == T {
    for element in collection {
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