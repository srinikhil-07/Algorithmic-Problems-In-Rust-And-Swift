#include<iostream>
#include<string>
using namespace std;
/// 1. At space, decrement a counter till 'begin' variable and store the string in ans string 
string reverseWords(string s) {
    string ans;
    int pos = 0;
    char space;
    while(s.find(" ",pos) != string::npos) {
        cout<<"Space"<<endl;
        size_t it = s.find(" ",pos);
        pos = it+1;
        space = s[it];
        /// TODO: Analyze STL strings on why below while condition fails in certain CPP versions 
        while(s[it-1] != space && it != 0) { // In some CPP version: (it != 0 && s[it-1] != space) only will work
            it--;
            ans.push_back(s[it]);
        }
        ans.push_back(space);
    }
    string::iterator i = s.end();
    while(*(i-1) != space) {
        ans.push_back(*i);
        if(i == s.begin()) {
            return ans;
        }
        i--;
    }
    return ans;
}

int main() {
    string qn = "contest";
    cout<<reverseWords(qn);
    return 0;
}
///"Let's take LeetCode contest"