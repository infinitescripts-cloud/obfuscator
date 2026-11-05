local out = {}
for i = 1, 5 do out[#out + 1] = tostring(i) end
print(table.concat(out, ','))
for i = 5, 1, -2 do print(i) end
for i = 1.5, 3.5, 1 do print(i) end