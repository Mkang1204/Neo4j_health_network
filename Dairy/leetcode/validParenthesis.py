class Solution:
    def isValid(self, s: 'str') -> 'bool':
        # 1.check if empty or null
        # 2. put left to stack and right match with top
        # 3. if matches with left -> pop  else: false
        # 4. check if the stack is empty
        if len(s)%2 == 1:
            return False
        if s is None or len(s) == 0:
            return True
        stack = []
        for i in range(0, len(s)): # not len(s) - 1--- range don't take the last element
            if s[i]=='(' or s[i] == '[' or s[i] == '{':
                stack.append(s[i])
                # print(stack)
                # print(s[i])
            else:
                if len(stack) != 0: 
                    if stack[-1] == '(' and s[i] == ')' or stack[-1] == '[' and s[i] == ']' or stack[-1] == '{' and s[i] == '}':
                        stack.pop()
                    # print(stack)
                    else:
                        return False
                else:
                    return False ## if else matches
        if len(stack) == 0: ## stack is None cannot doen't equal len(s) == 0 
            return True
        else:
            return False
        
