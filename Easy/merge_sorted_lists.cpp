#include<iostream>
using namespace std;

/**
 * Definition for singly-linked list.
 */
 struct ListNode {
     int val;
     ListNode *next;
     ListNode() : val(0), next(nullptr) {}
     ListNode(int x) : val(x), next(nullptr) {}
     ListNode(int x, ListNode *next) : val(x), next(next) {}
 };
void printListNodes(ListNode* l) {
    while(l!=NULL) {
        cout<<l->val<<"->";
        l = l->next;
    }
    cout<<endl;
}
// Look put for edge cases 
// If same -> insert and move both pointers
// If not same, insert lower value and move pointer
// If one list ends, loop out the other till end
ListNode* mergeTwoLists(ListNode* l1, ListNode* l2) {
    //https://stackoverflow.com/questions/53568130/member-access-within-null-pointer-of-type-struct-structvarable
    ListNode dummy(0);
    ListNode* newList = &dummy;
    while(l1 != NULL && l2 != NULL) { //break if anyone is nil
        if(l1->val >= l2->val) {
            newList->next = l2;
            l2 = l2->next;
        } else if(l1->val < l2->val) {
            newList->next = l1;
            l1 = l1->next;
        }
        newList = newList->next;
    }
    if(l1 == NULL) { // we have run out of l1
        while(l2 != NULL) {
            newList->next = l2;
            l2 = l2->next;
            newList = newList->next;
        }
    } else if(l2 == NULL){
        while(l1 != NULL) {
            newList->next = l1;
            l1 = l1->next;
            newList = newList->next;
        }
    }
    return dummy.next;
}
int main() {
    ListNode qn(0);
    ListNode* newList = &qn;
    newList->next = (struct ListNode*)malloc(sizeof(struct ListNode));
    newList = newList->next;
    newList->val = 1;
    newList->next = (struct ListNode*)malloc(sizeof(struct ListNode));
    newList = newList->next;
    newList->val = 2;
    newList->next = (struct ListNode*)malloc(sizeof(struct ListNode));
    newList = newList->next;
    newList->val = 4;
    newList->next = NULL;
    printListNodes(qn.next);
    ListNode qn1(0);
    ListNode* newList1 = &qn1;
    newList1->next = (struct ListNode*)malloc(sizeof(struct ListNode));
    newList1 = newList1->next;
    newList1->val = 1;
    newList1->next = (struct ListNode*)malloc(sizeof(struct ListNode));
    newList1 = newList1->next;
    newList1->val = 3;
    newList1->next = (struct ListNode*)malloc(sizeof(struct ListNode));
    newList1 = newList1->next;
    newList1->val = 4;
    newList1->next = NULL;
    printListNodes(qn1.next);
    ListNode* ans = mergeTwoLists(qn.next,qn1.next);
    printListNodes(ans);
    return 0;
}