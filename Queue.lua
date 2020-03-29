--[[
  --------------------------------
  Queue implementation for Lua
  Inspired by Queue.js (http://code.iamkate.com/javascript/queues/)
  
  Github: https://github.com/darkwark/queue-lua
  March, 2020
  --------------------------------
]]--

Queue = {}

function Queue:new()
  local object = {}
  
  object.list = {}
  object.offset = 1
    
  self.__index = self
  return setmetatable(object, self)
end

function Queue:length()
  return #self.list - self.offset
end

function Queue:isEmpty()
  return #self.list == 0
end

function Queue:enqueue(item)
  table.insert(self.list, item)
  
  return self
end

function Queue:peek()
  if not self:isEmpty() then
    return self.list[self.offset]
  end
  
  return nil
end

function Queue:dequeue()
  if self:isEmpty() then return nil end
  
  local item = self.list[self.offset]
  self.offset = self.offset + 1
  
  if (self.offset * 2) >= #self.list then
    self:optimize()
  end
  
  return item
end

function Queue:optimize()
  local pos, new = 1, {}

  for i = self.offset, #self.list do
    new[pos] = self.list[i]
    pos = pos + 1
  end
  
  self.offset = 1
  self.list = new
end
