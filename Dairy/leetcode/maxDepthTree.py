class Solution:
    def maxDepth(self, root: TreeNode) -> int:
        height = 0
        if root == None:
            return height
        return 1 + max(self.maxDepth(root.left),self.maxDepth(root.right))        
    # def maxHeight(self, root.left, root.right):
        
