import Foundation

class Solution {
    var result = [[Int]]()
    /// TODO: Whats the difference between editorial code and this?
    /// Perf is at 5.32% whsi is `bad`. How do we boost it up?
    func subsets(_ nums: [Int]) -> [[Int]] {
        //Set can be used for subset as elements are distinct
        var subset = Set<Int>()
        backTrackingFor(sequence: nums, with: &subset, for: 0)
        return result
    }
    func backTrackingFor(sequence nums: [Int], with subset: inout Set<Int>, for index: Int) {
        result.append(Array.init(subset))
        for i in index..<nums.count {
            subset.insert(nums[i])
            backTrackingFor(sequence: nums, with: &subset, for: i+1)
            subset.remove(nums[i])
        }
        return
    }
}

// class Solution {
//   List<List<Integer>> output = new ArrayList();
//   int n, k;

//   public void backtrack(int first, ArrayList<Integer> curr, int[] nums) {
//     // if the combination is done
//     if (curr.size() == k)
//       output.add(new ArrayList(curr));

//     for (int i = first; i < n; ++i) {
//       // add i into the current combination
//       curr.add(nums[i]);
//       // use next integers to complete the combination
//       backtrack(i + 1, curr, nums);
//       // backtrack
//       curr.remove(curr.size() - 1);
//     }
//   }

//   public List<List<Integer>> subsets(int[] nums) {
//     n = nums.length;
//     for (k = 0; k < n + 1; ++k) {
//       backtrack(0, new ArrayList<Integer>(), nums);
//     }
//     return output;
//   }
// }