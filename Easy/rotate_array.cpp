#include<iostream>
#include<vector>
using namespace std;
/// TODO: Learn O(1) space solutions
/// Approach 1: Copy last k elements to a new vector --> time complexity: O(k+n)
/// Approach 2: Possible O(1) space -  temp variable copy last element and shift right one place rest
/// of the elements --> time complexity: O(kn) 
void rotate(vector<int>& nums, int k) { /// TLE solution
    int temp;
    int n = nums.size();
    k = k%n;
    while(k--) {
        cout<<k<<endl;
        temp = nums.back();
        for(int i=nums.size()-2; i>=0;i--) {
            nums[i+1] = nums[i];
        }
        nums[0] = temp;
    }
}
int main() {
    vector<int> k;
    k.push_back(-1);
    k.push_back(-100);
    k.push_back(3);
    k.push_back(99);
    rotate(k,6);
    for(int i = 0; i < k.size(); i++) {
        cout<<k[i]<<" ";
    }
    cout<<endl;
    return 0;
}