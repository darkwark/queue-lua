# Queue.lua
Queue implementation for Lua and PICO-8
Inspired by [Queue.js](http://code.iamkate.com/javascript/queues/)

## Reference:
**`Queue:new()`**
Create a new queue

**`Queue:enqueue(value)` **
Add item to the queue

**`Queue:dequeue()` **
Retrieve item from the queue

**`Queue:peek()` **
Output the first item in queue

**`Queue:isEmpty()`**
Check if queue is empty

**`Queue:length()`**
Get Length of the queue

## Example
```lua
local q = Queue:new()
  
q:enqueue(3)
q:enqueue(5)
q:enqueue(10) 
-- q = { 3, 5, 10 }

print(q:length()) --> 3
  
print(q:dequeue()) --> 3
print(q:dequeue()) --> 5
print(q:dequeue()) --> 10

print(q:isEmpty()) --> true
```