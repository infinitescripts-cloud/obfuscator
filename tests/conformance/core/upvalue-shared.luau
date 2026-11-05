local x = 0
local function inc() x = x + 1 end
local function get() return x end
inc(); inc(); inc()
print(get())