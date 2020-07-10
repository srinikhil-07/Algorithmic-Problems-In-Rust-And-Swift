#include<iostream>
#include<string>
#include<vector>
using namespace std;
// Brackets should be closed in correct order
// Stack data structure
bool isValid(string s) {
    cout<<s<<endl;
    vector<char> last;
    if(s.length() == 0) {
        return true;
    }
    for(int i=0;i<s.length();i++) {
        if(s[i]=='(' || s[i]=='{' || s[i]=='[') {
            last.push_back(s[i]);
        } else {
            if(last.size() == 0) {
                return false;
            }
            if(s[i] == ')' && last.back() != '(') {
                return false;
            } else if(s[i] == ']' && last.back() != '[') {
               return false;
            } else if(s[i] == '}' && last.back() != '{') {
                return false;
            }
            last.pop_back();
        }
    }
    if(last.size() == 0) {
        return true;
    } else {
        return false;
    }
}
int main() {
    cout<<isValid(string("([]"))<<endl;;
    return 0;
}