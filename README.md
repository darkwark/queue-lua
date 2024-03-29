# Queue.lua
Queue implementation for Lua and PICO-8  
Inspired by [Queue.js](http://code.iamkate.com/javascript/queues/)

## Reference:
**`Queue:new()`**  
Create a new queue

**`Queue:enqueue(value)`**  
Add item to the queue

**`Queue:dequeue()`**  
Retrieve item from the queue

**`Queue:peek()`**  
Output the first item in queue

**`Queue:isEmpty()`**  
Check if queue is empty

**`Queue:length()`**  
Get Length of the queue

**`Queue:print()`**
Print the Queue content to the console

**`Queue:copy()`**
Returns a NEW Queue with the same content as the one calling the function


## Example
```lua
local q = Queue:new()
  
q:enqueue(3)
q:enqueue(5)
q:enqueue(10) 
q:print() --> Peek -> 3, 5, 10

print(q:length()) --> 3

local qCopy = q:copy()
qCopy:print() --> Peek -> 3, 5, 10

print(q:dequeue()) --> 3
print(q:dequeue()) --> 5
print(q:dequeue()) --> 10

print(q:isEmpty()) --> true
print(qCopy:isEmpty()) --> false
```