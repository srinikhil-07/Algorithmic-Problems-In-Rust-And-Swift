#include<iostream>
#include<vector>
using namespace std;
///NOTE: DP technique, had to peek into the solution
///TODO: Revisit, think on your own and solve this problem
///7,9,3,2,1,8,19
int rob(vector<int>& nums) {
    
}
int main() {
    return 0;
}


/// f(3) = max(max(1,2),1+3) = max(f(k-2)+Ak,f(k-1))
/// f(4) = max(2+4,f(3))
/// f(5) = max(3+5,f(4))