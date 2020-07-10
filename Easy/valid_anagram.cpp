#include<iostream>
#include<string>
#include<map>
using namespace std;

bool isAnagram(string s, string t) {
    if(s.size() != t.size()) {
        return false;
    }
    map<char,int> hash_s;
    for(int i=0;i<s.size();i++) {
        map<char,int> :: iterator it;
        it = hash_s.find(s[i]);
        if(it == hash_s.end()) {
            hash_s.insert(make_pair(s[i],1));
            cout<<"Insert s:"<<s[i]<<endl;
        } else {
            int count = it->second;
            count = count+1;
            cout<<"Letter s:"<<s[i]<<" "<<count<<endl;
            ///hash_s.insert(make_pair(s[i],count)); -> this wont update
            hash_s[s[i]] = count;
        }
    }
    map<char,int> hash_t;
    for(int i=0;i<t.size();i++) {
        map<char,int> :: iterator it;
        it = hash_s.find(t[i]);
        if(it == hash_s.end()) { //element not in s
            return false;
        }
        map<char,int> :: iterator it1;
        it1 = hash_t.find(t[i]);
        if(it1 == hash_t.end()) {
            cout<<"Insert t:"<<t[i]<<endl;
            hash_t.insert(make_pair(t[i],1));
        } else {
            int count = it1->second;
            map<char,int> :: iterator it1;
            count = count+1;
            cout<<"Letter t:"<<t[i]<<" "<<count<<endl;
            if(count > it->second) { // if letter count has mismatch
                return false;
            }
            ///hash_t.insert(make_pair(t[i],count));
            hash_t[t[i]] = count;
        }
    }
    return true;
}
int main() {
    string s1 = string("ac");
    string s2 = string("bb");
    cout<<isAnagram(s1,s2)<<endl;;
    return 0;
}
////"aacc"
