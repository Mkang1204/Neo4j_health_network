# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, x):
#         self.val = x
#         self.next = None

class Solution:
    def deleteDuplicates(self, head: ListNode) -> ListNode:
        if head == None or next == None:
            return head
        slow = head
        fast = head.next
        while fast is not None:  # the loop cannot be break -> pay attention to the control variable of loop
            print(slow.val)
            print(fast.val)
            if slow.val < fast.val:
                slow.next = fast
                slow = slow.next
                fast = fast.next
            # elif fast.next is not None:
            #     fast = fast.next
            elif slow.val == fast.val and fast.next != None:
                fast = fast.next
            else:
                slow.next = None
                break
        return head
        
        
        
        
        
        
