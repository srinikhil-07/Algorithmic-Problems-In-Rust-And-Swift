#include<iostream>
using namespace std;

struct ListNode {
    int val;
    ListNode *next;
    ListNode(int x) : val(x), next(NULL) {}
};
void printListNodes(ListNode* l) {
    while(l!=NULL) {
        cout<<l->val<<"->";
        l = l->next;
    }
    cout<<endl;
}
int getLength(ListNode* a) {
    int length = 0;
    while(a != NULL) {
        length++;
        a = a->next;
    }
    return length;
}
ListNode *getIntersectionNode(ListNode *headA, ListNode *headB) {
    //edge cases
    if(headA == NULL) {
        return NULL;
    }
    if(headB == NULL) {
        return NULL;
    }
    ///get length
    int lengthA = getLength(headA);
    int lengthB = getLength(headB);
    cout<<"LengthA:"<<lengthA<<" LengthB:"<<lengthB<<endl;
    ///get diff and 'equalize' both lists 
    int diff = 0;
    if(lengthA > lengthB) {
        diff = lengthA - lengthB;
        while(diff > 0 && headA->next) {
            cout<<"Diff:"<<diff<<endl;
            headA = headA->next;
            diff--;
        }
    } else if (lengthA < lengthB) {
        diff = lengthB - lengthA;
        while(diff > 0 && headB->next) {
            cout<<"Diff:"<<diff<<endl;
            headB = headB->next;
            diff--;
        }
    }
    ///return the intersection
    while (headA && headB) {
        cout<<"A:"<<headA->val<<" B:"<<headB->val<<endl;
        if(headA == headB) {
            return headA;
        }
        headA = headA->next;
        headB = headB->next;
    } 
    return NULL;
}
int main() {
    ListNode qn(0);
    ListNode* newList = &qn;
    newList->next = (struct ListNode*)malloc(sizeof(struct ListNode));
    newList = newList->next;
    newList->val = 4;
    newList->next = (struct ListNode*)malloc(sizeof(struct ListNode));
    newList = newList->next;
    newList->val = 1;
    newList->next = (struct ListNode*)malloc(sizeof(struct ListNode));
    newList = newList->next;
    newList->val = 8;
    newList->next = (struct ListNode*)malloc(sizeof(struct ListNode));
    newList = newList->next;
    newList->val = 4;
    newList->next = (struct ListNode*)malloc(sizeof(struct ListNode));
    newList = newList->next;
    newList->val = 5;
    newList->next = NULL;
    printListNodes(qn.next);
    ListNode qn1(0);
    ListNode* newList1 = &qn1;
    newList1->next = (struct ListNode*)malloc(sizeof(struct ListNode));
    newList1 = newList1->next;
    newList1->val = 5;
    newList1->next = (struct ListNode*)malloc(sizeof(struct ListNode));
    newList1 = newList1->next;
    newList1->val = 0;
    newList1->next = (struct ListNode*)malloc(sizeof(struct ListNode));
    newList1 = newList1->next;
    newList1->val = 1;
    newList1->next = (struct ListNode*)malloc(sizeof(struct ListNode));
    newList1 = newList1->next;
    newList1->val = 8;
    newList1->next = (struct ListNode*)malloc(sizeof(struct ListNode));
    newList1 = newList1->next;
    newList1->val = 4;
    newList1->next = (struct ListNode*)malloc(sizeof(struct ListNode));
    newList1 = newList1->next;
    newList1->val = 5;
    newList1->next = NULL;
    printListNodes(qn1.next);
    ListNode* ans = getIntersectionNode(qn.next,qn1.next);
    cout<<ans->val<<endl;
    return 0;
}