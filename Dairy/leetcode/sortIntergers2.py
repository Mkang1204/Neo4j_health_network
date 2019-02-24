class Solution:
    """
    @param A: an integer array
    @return: nothing
    """
    def sortIntegers2(self, A):
        # write your code here
        # divide A into two arrays keep calling the function
        # sort a1 and a2
        # merge a1 and a2
    
        l = 0
        r = len(A) - 1
        if r <= 1:
            return 

        mid = l + (r-l)//2 # // to get the integer
        A1 = A[l:mid]
        A2 = A[mid:r]
        self.sortIntegers2(self,A1) # don't forget to include self!
        self.sortIntegers2(self,A2) 
        mergeSortedList(self,A1, A2)
        # merge two sorted list
        
    def mergeSortedList(self,A1,A2):
        i = len(A1) - 1
        j = len(A2) - 1
        k = len(A) - 1
        while(A1 and A2):
            if A1[i] <= A2[j]:
                A[k] = A2[j]
                j-=1
                k-=1
            else:
                A[k] = A1[i]
                i-=1 
                k-=1
        if i>=j:
            A[0:i] = A1[0:i]
        else:
            A[0:j] = A1[0:j]
        return

            
            
            
                
            
        
