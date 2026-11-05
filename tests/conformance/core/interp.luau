-- Luau backtick interpolation. Remove this case if your luau CLI rejects it.
local name = "world"
local n = 42
print(`hello {name}`)
print(`n+1={n + 1}`)
print(`n*n={n * n}`)