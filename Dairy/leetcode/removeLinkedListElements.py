class Solution:
    def removeElements(self, head: ListNode, val: int) -> ListNode:
        # special cases
        # link the cur.next to cur.next.next if it is not val
        # ### if head == None or head.val ==val:
        #     return None
        # cur = head
        # while cur.next != None and cur.next.next != None:
        #     if cur.val == val and cur.next.val != val:
        #         cur = cur.next
        #     elif cur.next.val == val:
        #         cur = cur.next.next
        #     else:
        #         cur = cur.next
        # return head
    
        dummy = ListNode(-1) ####ListNode[-1] is wrong!!
        dummy.next = head
        cur = dummy ## dummy not Head!!!
        while cur is not None and cur.next is not None:
            if cur.next.val == val:
                cur.next = cur.next.next
            else:
                cur = cur.next
        return dummy.next
