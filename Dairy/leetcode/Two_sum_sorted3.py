class Solution:
#     def twoSum(self, nums: 'List[int]', target: 'int') -> 'List[int]':
#         hashmap = {}
#         for index, value in enumerate(nums):
#             hashmap[value] = index
#         for index, value in enumerate(nums):
#             if target - value in hashmap:
#                 index1 = hashmap[target - value]
#                 if index != index1:
#                     return [index, index1]
            
        
## two-pointers 
    # def twoSum(self, nums:'List[int]', target:'[int]') -> 'List[int]':
    #     l,r = 0, len(nums)-1
    #     while l<r:
    #         s = nums[l] + nums[r]
    #         if s == target:
    #             return [l, r]
    #         elif s < target:
    #             l += 1
    #         else:
    #             r -= 1
# binary search
    def twoSum(self, nums:'List[int]', target:'int') ->'List[int]':
        for i in range(len(nums)):
            l,r = i+1, len(nums) - 1
            val = target - nums[i]
            while l<r:
                mid = l+(r-l)//2  # get the integer instead of float
                if nums[mid] == val:
                    return [i, mid]
                elif nums[mid] < val:
                    l = mid + 1
                else:
                    r = mid - 1
            
            

# additional TwoSum - sorted array - find all and no duplicates

    def twoSum(self, nums:'List[int]', target:'int'] -> 'int':
            i = 0
            j = len(nums) - 1
            while i<j:
               sum = nums[i] + nums[j]
               result = []

               if sum == target and [nums[i],nums[j]] not in result:
                        result = [nums[i],nums[j]]
               elif sum < target:
                        i += 1
               else:
                        j -= 1
               
                          
               
                        
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
