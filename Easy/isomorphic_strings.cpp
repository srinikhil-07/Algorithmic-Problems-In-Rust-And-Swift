#include<iostream>
#include<string>
#include<map>
using namespace std;
bool isIsomorphic(string s, string t) {
    map<char,char> hash;
    map<char,bool> taken;
    for(int i=0;i<s.length();i++) {
        map<char,char>:: iterator it = hash.find(s[i]);
        if(it == hash.end()) {
            if(taken.find(t[i]) != taken.end()) {
                return false;
            }
            hash.insert(make_pair(s[i],t[i]));
            taken.insert(make_pair(t[i],true));
        } else {
            if(it->second != t[i]) {
                return false;
            }
        }
    }
    return true;
}
int main() {
    string s1 = string("ab");
    string s2 = string("aa");
    cout<<isIsomorphic(s1,s2)<<endl;
    return 0;
}