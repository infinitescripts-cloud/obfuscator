# Target: Roblox Luau

LuauFuscator targets **Roblox Luau**, not vanilla Lua. This file is the
semantic contract. Changing it is a breaking change and must ship with a
corpus update.

## Dialect
- Language: Luau (Roblox, current release)
- Scripts: single-file `.luau` source, no external assets
- Runtime: client + server

## Unavailable
- `string.dump`         — cannot serialize bytecode
- `loadstring`          — cannot eval source at runtime
- `getfenv` / `setfenv` — removed
- `unpack` global       — use `table.unpack`

## Verified behaviors (probe before phase 3)
- `_ENV` semantics — write `tests/probes/env.luau` and confirm on target
- `select('#', ...)` vararg count
- `bit32` library availability
- `coroutine.yield` across `pcall`

## Luau features in scope
- Type annotations (stripped at lowering)
- `continue`
- Compound assignment: `+= -= *= /= //= %= ^= ..=`
- `if <c> then <a> else <b>` expression form
- Generalized iteration (`for k, v in t do`)
- String interpolation (backtick syntax)

## Input
- `.lua` — treated as Luau subset
- `.luau` — canonical
- `.txt` — treated as Luau source
- Max file size (web UI): 5 MB

## Output
- `bytecode-VM`  — IR → bytes → emitted Luau stub containing a VM
- `mangled-Luau` — IR → emitted Luau source with passes applied

Deterministic given a seed. CLI default seed `0`. Web UI default `Date.now()`.

## Purity contract
Browser-safe (no Node builtins): `packages/{compiler,vm,passes,shared}`.
Forbidden: `node:*`, `fs`, `path`, `child_process`, `os`, `crypto`.
Node allowed only in `packages/cli` and `tests/`.
Enforced by `scripts/check-purity.ts`.

## Non-goals
LuauFuscator does not ship loaders, key systems, Discord webhooks, or
anything requiring a server. PRs adding them are closed.