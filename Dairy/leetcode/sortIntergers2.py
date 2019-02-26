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
        r = len(A)
        if r <= 1:
            return 

        mid = l + (r-l)//2 # // to get the integer
        A1 = A[l:mid]
        A2 = A[mid:r]
        self.sortIntegers2(A1) # don't forget to include self!
        self.sortIntegers2(A2)
        self.mergeSortedList(A,A1, A2)

        # merge two sorted list
        
    def mergeSortedList(self,A,A1,A2):
        # i = len(A1) - 1
        # j = len(A2) - 1
        # k = len(A) - 1
        # while(i>=0 and j>=0):
        #     if A1[i] <= A2[j]:
        #         A[k] = A2[j]
        #         j-=1
        #         k-=1
        #     else:
        #         A[k] = A1[i]
        #         i-=1 
        #         k-=1
        i = j = k = 0
        while(i<len(A1) and j <len(A2)):
            if A1[i]<=A2[j]:
                A[k] = A1[i]
                i+=1
                k+=1
                
            else:
                A[k] = A2[j]
                j+=1
                k+=1 
        
        while(i<len(A1)):
            # A[k:] = A1[i:len(A1)]
            A[k] = A1[i]
            i+=1 
            k+=1 
            
        while(j<len(A2)):
            # A[k:] = A2[j:len(A2)]
            A[k] = A2[j]
            j+=1 
            k+=1
        # print(A)
        
        
        
    
        
        
        
        # if i>=0:
        #     A[0:i] = A1[0:i]
        # else:
        #     A[0:j] = A2[0:j]
        return A


            
            
            
                
            
        
        

        
        
        
        
        # solution by jiuzhang
        
        if len(A) <= 1: return A
        middle = len(A) // 2 
        A1 = A[:middle]
        A2 = A[middle:]
        self.sortIntegers2(A1)
        self.sortIntegers2(A2)
        k = 0
        while len(A1) and len(A2):
            if A1[0] < A2[0]: A[k]=A1.pop(0)
            else: A[k]=A2.pop(0)
            k = k + 1

        while len(A1):
            A[k] = A1.pop(0)
            k = k + 1
        while len(A2):
            A[k] = A2.pop(0)
            k = k + 1
            
            
            
  # new solution

            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
        


            
            
            
                
            
        
