#include<iostream>
#include<vector>
#include<algorithm>
using namespace std;
/// TODO: Seems like sub-optimal solution, implement using maps 
int majorityElement(vector<int>& nums) {
    sort(nums.begin(),nums.end());
    int majority_count = 0;
    int count = 0;
    int majority_element = -1;
    int element = -1;
    for(vector<int>::iterator it = nums.begin();it != nums.end(); ++it) {
        if(element != *it) {
            element = *it;
            count = 0;
        }
        count++;
        cout<<"Element:"<<*it<<" count:"<<count<<endl;
        if(count > majority_count) {
            majority_count = count;
            majority_element = *it;
        }
        cout<<"Majority count: "<<majority_count<<endl;
    }
    return majority_element;
}
int main() {
    vector<int> qn;
    qn.push_back(4);
    qn.push_back(4);
    qn.push_back(3);
    cout<<majorityElement(qn)<<endl;
    return 0;
}