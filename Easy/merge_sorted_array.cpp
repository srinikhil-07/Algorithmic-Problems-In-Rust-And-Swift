#include<iostream>
#include<vector>
using namespace std;

void printArray(vector<int>& nums) {
    for (vector<int>::iterator it = nums.begin() ; it != nums.end(); ++it) {
        cout<<*it<<" ";
    }
    cout<<endl;
}
/// nums1 
void merge(vector<int>& nums1, int m, vector<int>& nums2, int n) {
    vector<int> temp;
    for(int i=0;i<m;i++) {
        temp.push_back(nums1[i]);
    }
    int i=0,j=0,k=0;
    while(i<temp.size() && j<nums2.size()) {
        if(temp[i]<nums2[j]) {
            nums1[k] = temp[i];
            i++;
            k++;
        } else if(temp[i]>=nums2[j]){
            nums1[k] = nums2[j];
            j++;
            k++;
        }
    }
    if(i==temp.size()) {
        while(j<nums2.size()) {
            nums1[k] = nums2[j];
            j++;
            k++;
        }
    } else if(j==nums2.size()) {
        while(i<temp.size()) {
            nums1[k] = temp[i];
            i++;
            k++;
        }
    }
}

int main() {
    vector<int> q1;
    q1.push_back(1);
    q1.push_back(2);
    q1.push_back(3);
    q1.push_back(0);
    q1.push_back(0);
    q1.push_back(0);
    vector<int>q2;
    q2.push_back(2);
    q2.push_back(5);
    q2.push_back(6);
    printArray(q1);
    merge(q1,3,q2,3);
    printArray(q1);
    return 0;
}