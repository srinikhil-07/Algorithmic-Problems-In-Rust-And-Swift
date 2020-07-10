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
TreeNode* traversal(TreeNode* s, TreeNode* t) {
    if(s == NULL && t != NULL) {
        return t;
    }
    if(s != NULL && t == NULL) {
        return s;
    }
    if(s == NULL && t == NULL) {
        return NULL;
    }
    s->val += t->val;
    s->left = traversal(s->left,t->left);
    s->right = traversal(s->right,t->right);
    return s;
}
TreeNode* mergeTrees(TreeNode* t1, TreeNode* t2) {
    return traversal(t1,t2);
}
int main() {
    return 0;
}