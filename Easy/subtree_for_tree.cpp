#include<iostream>
using namespace std;
struct TreeNode {
    int val;
    TreeNode *left;
    TreeNode *right;
    TreeNode() : val(0), left(nullptr), right(nullptr) {}
    TreeNode(int x) : val(x), left(nullptr), right(nullptr) {}
    TreeNode(int x, TreeNode *left, TreeNode *right) : val(x), left(left), right(right) {}
};
/// Function to check 't' is a subtree of 's'
/// NOTE: 1. Learn how base cases are handled and this will simplify the problem
bool isEqual(TreeNode* s, TreeNode* t) {
    if(s == NULL && t == NULL) {
        return true;
    }
    if(s == NULL || t == NULL) { // not equal
        return false;
    }
    return (s->val == t->val) && isEqual(s->left,t->left) && isEqual(s->right,t->right);
}
/// Inorder traversal
bool traversal(TreeNode* s, TreeNode* t) {
    if(s==NULL) {
        return false;
    }
    return isEqual(s,t) || traversal(s->left,t) || traversal(s->right,t);
}
/// 1. Check if a node has the subtree,
/// 2. Traverse the entire tree s and check point 1 for each node 
bool isSubtree(TreeNode* s, TreeNode* t) {
    return traversal(s,t);
}
int main() {
    return 0;
}