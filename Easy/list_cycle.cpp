#include<iostream>
using namespace std;

struct ListNode {
int val;
ListNode *next;
ListNode(int x) : val(x), next(NULL) {}
};
/// Keep slow and fast pointers.
/// If slow and fast pointers meet -> cycle
/// If slow and fast pointers dont meet but we reach the end -> no cycle
/// There is a risk of going into ever running loop in this problem
bool hasCycle(ListNode *head) {
    ListNode* fast = head;
    ListNode* slow = head;
    if(head == NULL) {
        return false;
    }
    if(head->next == NULL) { // single or two element lists
        return false;
    }
    while(fast != NULL && fast->next != NULL) { /// this check prevents null point exception as well
        slow = slow->next;
        fast = fast->next->next;
        if(slow == fast) { // if we meet, we have a loop
            return true;
        }
    }
    return false; // if they dont and fast list ends, we dont have a loop
}
int main() {
    return 0;
}