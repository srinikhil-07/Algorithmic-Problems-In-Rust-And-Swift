#include<iostream>
#include<string>
#include<map>
using namespace std;

/// NOTE: 1. This problem teaches sliding window technique
/// TODO: 1. Complete the below commented variation of sliding window, 2. Implement optimized version in future
int lengthOfLongestSubstring(string s) {
    
}
int main() {
    string qn = "tmmzuxt";
    cout<<lengthOfLongestSubstring(qn);
    return 0;
}


// int lengthOfLongestSubstring(string s) {
//        int global_max = 0;
//     int local_max = 0;
//     int start = 0;
//     map<char,int> hash;
//     for(int i=0; i<s.length();i++) {
//         map<char,int>::iterator it = hash.find(s[i]);
//          if(it == hash.end()) {
//              hash.insert(make_pair(s[i],i));
//              local_max++;
//              cout<<"Insert: "<<s[i]<<" "<<local_max<<endl;
//          } else {
//              if(it->second > start) {
//                 if(local_max > global_max) {
//                     global_max = local_max;
//                 }
//                 local_max = i - it->second;
//                 start = it->second + 1;
//                 cout<<"Letter: "<<s[i]<<" "<<local_max<<endl;
//                 hash[s[i]] = i;
//              }
//          }
//     }
//     if(local_max > global_max) { //end character
//         global_max = local_max;
//     }
//     return global_max;
//     }