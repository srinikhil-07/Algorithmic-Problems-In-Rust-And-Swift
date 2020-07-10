#include<iostream>
using namespace std;
int factorial(int n) {
    int fact = 1;
    while(n > 0) {
        fact = fact*n;
        n--;
    }
    return fact;
}
int trailingZeroes(int n) {
    int fact = factorial(n);
    cout<<fact<<endl;
    int count = 0;
    while(fact%10 == 0) {
        count++;
        fact = fact/10;
    }
    return count;
}
int main() {
    cout<<trailingZeroes(17)<<endl;
    return 0;
}