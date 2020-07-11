import Foundation

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}
/// Graph techniques learnt:
/// 1. Each level in a graph can be mapped uniquely,
/// 2. Point 1 can be used in a BFS, to calculate width at that level
class Solution {
  /// Not working
    func widthOfBinaryTree(_ root: TreeNode?) -> Int {
        guard root != nil else {
            return 0
        }
        var queue = Array<(TreeNode?,Int)>()
        var maxWidth = 0
        queue.append((root,0))
        while !queue.isEmpty {
            if let head = queue.first {
                let size = queue.count
                var lastElement = head
                for i in 0..<size {
                    let element = queue.removeFirst()
                    lastElement = element
                    let node = element.0
                    if node?.left != nil {
                      queue.append((node?.left,2*i+1))
                    }
                    if node?.right != nil {
                      queue.append((node?.right,2*i+1))
                    }
                }
                maxWidth = max(maxWidth, lastElement.1 - head.1)
            }
        }
        return maxWidth
    }
}
/// Queue implementation
/// Source: https://github.com/raywenderlich/swift-algorithm-club/blob/master/Queue/Queue-Optimized.swift
public struct Queue<T> {
  fileprivate var array = [T?]()
  fileprivate var head = 0

  public var isEmpty: Bool {
    return count == 0
  }

  public var count: Int {
    return array.count - head
  }

  public mutating func enqueue(_ element: T) {
    array.append(element)
  }

  public mutating func dequeue() -> T? {
    guard let element = array[guarded: head] else { return nil }

    array[head] = nil
    head += 1

    let percentage = Double(head)/Double(array.count)
    if array.count > 50 && percentage > 0.25 {
      array.removeFirst(head)
      head = 0
    }

    return element
  }

  public var front: T? {
    if isEmpty {
      return nil
    } else {
      return array[head]
    }
  }
}

extension Array {
    subscript(guarded idx: Int) -> Element? {
        guard (startIndex..<endIndex).contains(idx) else {
            return nil
        }
        return self[idx]
    }
}

func testWidthOfBinaryTree() {
    let solution = Solution.init()
    print(solution.widthOfBinaryTree(TreeNode()))
    var queue = Array<(TreeNode?, Int)>()
}