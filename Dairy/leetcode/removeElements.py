class Solution:
    def removeElement(self, nums: List[int], val: int) -> int:
# TWO POINTERS left and end starting from head and end
# put the val element to the very right and move end pointers to the new end
        if not nums:
            return 0
    
        l = 0
        r = len(nums) -1
        while l <= r:
            if nums[l] == val and nums[r]!= val:
                nums[l], nums[r] = nums[r], nums[l]
                l+=1
                r-=1
            elif nums[l] == val and nums[r] == val:
                r-=1
            else:
                l+=1
        return r+1 ## PAY ATTENTION TO THE GOAL -> return the length
    
    
    # start, end = 0, len(nums) - 1
    # while start <= end:
    #     if nums[start] == val:
    #         nums[start], nums[end], end = nums[end], nums[start], end - 1
    #     else:
    #         start +=1
    # return start
                
        
        
        
    

# SHORT SOLUTION
#         try:
#             while val in nums:
#                 nums.remove(val)
#         except:
#             return len(nums)
        
