#include<iostream>
#include<vector>
using namespace std;

int countPrimes(int n) {
    if(n==0 || n==1) {
        return 0;
    }
    bool primes[n];
    memset(primes,true, sizeof(primes));
    int count = n-2;
    for(int i=2;i*i<n;i++) {
        //cout<<"i:"<<primes[i]<<endl;
        if(primes[i] == true) { //prime and multiples of it
            for(int p = i*i; p<n;p+=i) {
                //cout<<"p multiples:"<<p;
                if(primes[p]) {
                    //cout<<"p:"<<p<<" ";
                    count=count-1;
                }
                primes[p] = false;
            }
            //cout<<endl;
        }
    }
    // for(int j=2;j<n;j++) {
    //     if(primes[j]) {
    //         cout<<j<<" ";
    //     }
    // }
    return count;
}
int main() {
    cout<<countPrimes(10)<<endl;
    return 0;
}