local function make(x)
  return function(y) return x + y end
end
print(make(10)(5))