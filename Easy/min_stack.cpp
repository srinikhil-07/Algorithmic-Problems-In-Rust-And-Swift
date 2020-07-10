#include <iostream>
#include <set>
#include <vector>
using namespace std;
/// TODO: Check out more optimized solution if any
class MinStack {
    public:
    multiset<int> minStack; //key: index, value: stack values
    vector<int> stack;
    MinStack() {
    }
    void push(int x) { 
        minStack.insert(x);
        stack.push_back(x);
    }
    void pop() { 
        cout<<"Pop:"<<stack.back()<<endl;
        minStack.erase(minStack.find(stack.back())); //remove element in min stack
        stack.pop_back(); //remove element in stack
    }
    int top() { 
        return stack.back();
    }
    int getMin() {
        return *minStack.begin();
    }
};
int main() {
    MinStack* obj = new MinStack();
    obj->push(0);
    obj->push(1);
    obj->push(0);
    cout<<obj->getMin()<<endl;
    obj->pop();
    //cout<<obj->top()<<endl;
    cout<<obj->getMin()<<endl;
    return 0;
}