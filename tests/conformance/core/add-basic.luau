local V = {}
V.__add = function(a, b) return setmetatable({ v = a.v + b.v }, V) end
V.__eq  = function(a, b) return a.v == b.v end
V.__tostring = function(a) return "V(" .. a.v .. ")" end
local a = setmetatable({ v = 1 }, V)
local b = setmetatable({ v = 2 }, V)
print(tostring(a + b))
print(a == b)