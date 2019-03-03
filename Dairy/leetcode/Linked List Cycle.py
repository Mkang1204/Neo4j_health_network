import pandas as pd
import numpy as np 

class ListNode(object):
    def __init__(self, x):
        self.val = x
        self.next = None
class Solution(object):
    def inputLinkedList(self, df):
        print('Please type the matrix from the keyboard:', %)
    def hasCycle(self, head):
        # check if there is a loop in the listnodes
        if head == None or head.next == None:
            return False    
        slow = head
        fast = head.next
        while slow != None:
            if slow.next == None or slow.next.next == None:
                return False
            if slow == fast:
                return True
            
            slow = slow.next
            fast = fast.next

            

