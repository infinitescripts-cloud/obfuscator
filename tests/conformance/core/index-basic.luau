local t = setmetatable({}, { __index = function(_, k) return k .. "!" end })
print(t.hello)
print(t.world)
local base = { x = 1 }
local d = setmetatable({}, { __index = base })
print(d.x)