local function count(...) return select('#', ...) end
print(count())
print(count(1))
print(count(nil))
print(count(1, nil, 3))
print(count(nil, nil))