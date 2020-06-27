import Foundation


/// Struct to test solutions
public struct Test {
    let solution = Solution.init()
    public init() {
        
    }
    func testsortColors() {
        var nums = [2,0,2,1,1,0]
        solution.sortColors(&nums)
        print(nums)
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
}

let test = Test.init()
test.testsortColors()


