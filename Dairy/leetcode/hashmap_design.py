# test case
# [""MyHashMap","put", "put", "get", "remove", "remove", "get"]
# [[],[1001, 2],[2,3],[1001],[2],[2],[1]]

class ListNode:
    def __init__(self, key, value):
        self.key = key
        self.value = value
        self.next = None



class MyHashMap:

    def __init__(self):
        """
        Initialize your data structure here.
        """
        self.num = 10000
        self.h = [None]*self.num


    def put(self, key: 'int', value: 'int') -> 'None':
        """
        value will always be non-negative.
        """
        index = key%self.num
        if self.h[index] == None:
            self.h[index] = ListNode(key, value)
        else:
            cur = self.h[index]
            while True: # while cur != None:
                if cur.key == key:
                    cur.key = key
                    cur.value = value
                    return
                if cur.next == None:
                    break
                cur = cur.next
            cur.next = ListNode(key, value)
        
        
        
        

    def get(self, key: 'int') -> 'int':
        """
        Returns the value to which the specified key is mapped, or -1 if this map contains no mapping for the key
        """
        index = key % self.num
        cur = self.h[index]
        while cur:
            if cur.key == key:
                return cur.value
            else: cur = cur.next
        return -1

    def remove(self, key: 'int') -> 'None':
        """
        Removes the mapping of the specified value key if this map contains a mapping for the key
        """
        index = key % self.num
        cur = prev = self.h[index]
        if not cur:
            return
        if cur.key == key:
            self.h[index] = cur.next
        else:
            cur = cur.next
            while cur:
                if cur.key == key:
                    prev.next = cur.next
                    break
                else:
                    cur, prev = cur.next, prev.next


# Your MyHashMap object will be instantiated and called as such:
# obj = MyHashMap()
# obj.put(key,value)
# param_2 = obj.get(key)
# obj.remove(key)
