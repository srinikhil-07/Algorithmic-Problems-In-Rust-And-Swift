#include<iostream>
#include<vector>
using namespace std;
/// METHODS: 1. Sort and compare each element with its index -> no extra space but O(nlogn)
/// 2. Hashing: but extra space
/// 3.   
/// NOTE: Numbers can be preserved by negating them, considering problem doesnt have -ve nos
vector<int> findDisappearedNumbers(vector<int>& nums) {
    for(int i=0;i<nums.size();i++) {
        int index = abs(nums[i]) -1;
        if(nums[index] > 0) {
            nums[index] *= -1;
        }
    }
    vector<int> ans;
    for(int j=0;j<nums.size();j++) {
        if(nums[j] > 0) {
            ans.push_back(j+1);
        }
    }
    return ans;
}
int main() {
    vector<int> qn;
    qn.push_back(4);
    qn.push_back(3);
    qn.push_back(2);
    qn.push_back(7);
    qn.push_back(8);
    qn.push_back(2);
    qn.push_back(3);
    qn.push_back(1);
    vector<int> ans = findDisappearedNumbers(qn);
    for(int i=0;i<ans.size();i++) {
        cout<<ans[i]<<" ";
    }
    return 0;
}
/// E.g: [4,3,2,7,8,2,3,1]
///[4,3,2,-7,8,2,3,1] -> [4,3,-2,-7,8,2,3,1] -> [4,-3,-2,-7,8,2,3,1] -> [4,-3,-2,-7,8,2,-3,1] -> [-4,3,2,-7,8,2,3,-1]