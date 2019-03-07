class Solution:
    def removeDuplicates(self, nums: 'List[int]') -> 'int':
        # 2 pointers fast and slow!! sorted array!
        if not nums:
            return 0
        i, j  = 0,1
        for j in range(1,len(nums)):
            print(nums[j])
            if nums[i] < nums[j]:
                nums[i+1] = nums[j]  # seperate from == !!!
                i+=1
        return i+1
