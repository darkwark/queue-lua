--[[
  --------------------------------
  Queue implementation for Lua (PICO-8 Version)
  Inspired by Queue.js (http://code.iamkate.com/javascript/queues/)
  
  Github: https://github.com/darkwark/queue-lua
  March, 2020
  --------------------------------
]]--

queue = {}

function queue:new()
  local object = {}
  
  object.list = {}
  object.offset = 1
    
  self.__index = self
  return setmetatable(object, self)
end

function queue:length()
  return #self.list - self.offset
end

function queue:isempty()
  return #self.list == 0
end

function queue:enqueue(item)
  add(self.list, item)
  
  return self
end

function queue:peek()
  if not self:isempty() then
    return self.list[self.offset]
  end
  
  return nil
end

function queue:dequeue()
  if self:isempty() then return nil end
  
  local item = self.list[self.offset]
  self.offset = self.offset + 1
  
  if (self.offset * 2) >= #self.list then
    self:optimize()
  end
  
  return item
end

function queue:optimize()
  local pos, new = 1, {}

  for i = self.offset, #self.list do
    new[pos] = self.list[i]
    pos = pos + 1
  end
  
  self.offset = 1
  self.list = new
end