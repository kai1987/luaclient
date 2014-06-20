require("framework.functions")
require("framework.debug")
local ccclass = _G['class']
local Thing = require('thing')
local Dog = ccclass("Dog", Thing)
local _ = {
  Dog = {
    bite = function(self)
      return print("I bite you")
    end
  }
}
dump(Dog)
local Person
do
  local _parent_0 = Thing
  local _base_0 = {
    say_name = function(self)
      return print("Hello, I am", self.name)
    end,
    ["new"] = function(self)
      return print("i am new created")
    end
  }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  local _class_0 = setmetatable({
    __init = function(self)
      return print("i created")
    end,
    __base = _base_0,
    __name = "Person",
    __parent = _parent_0
  }, {
    __index = function(cls, name)
      local val = rawget(_base_0, name)
      if val == nil then
        return _parent_0[name]
      else
        return val
      end
    end,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  if _parent_0.__inherited then
    _parent_0.__inherited(_parent_0, _class_0)
  end
  Person = _class_0
end
local p = Person()
p.name = "MoonScript"
p:say_name()
return dump(Person)
