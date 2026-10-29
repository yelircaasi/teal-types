---@diagnostic disable:unused-local

local type Warp.OsType =
	"linux"|"mac"|"unknown"|"windows"
local type Warp.String.TruncateMode =
	"left"|"middle"|"right"
local type Warp.Table.MergeBehavior =
	"error"|"force"|"keep"

local record Warp.Table.MergeOpts
	behavior: Warp |Table.MergeBehavior | nil
	combine: boolean | nil
end

local record Warp.FileSystem.Platform
	---Whether the platform is Linux.
	is_linux: boolean
	---Whether the platform is macOS.
	is_mac: boolean
	---Whether the platform is Windows.
	is_win: boolean
	---Operating system name.
	os: Warp.OsType

local record Warp.FileSystem
	home: string
	is_win: boolean
	target_triple: string
local F = {}

---Extract base name from path.
---Equivalent to POSIX `basename(3)`.
---Returns the final component of the path.
function F.basename(path: string File path.): string

---Find git project root.
---Traverses up the directory tree looking for a `.git` directory.
function F.find_git_dir(directory: string Starting directory path.): string|nil|? | nil

---Get the current working directory from the given pane.
---Parses the pane's current working directory URI.
---Normalises the home directory to `~`.
---Optionally resolves the git root instead of the literal CWD.
function F.get_cwd(pane: Pane WezTerm pane object., search_git_root_instead: boolean If `true`, returns the Git root instead of CWD.): string

---@deprecated Use `get_cwd` and `get_hostname` separately.
---Kept for backwards compatibility; delegates to the two focused functions.
---@param pane Pane WezTerm pane object.
---@param search_git_root_instead boolean If `true`, returns the Git root instead of CWD.
---@return string cwd Current working directory or the Git root.
function F.get_cwd_hostname(pane, search_git_root_instead): string

---Get the hostname associated with the given pane.
---Parses the pane's current working directory URI to extract the host field.
---Falls back to `wezterm.hostname()` when the URI carries no host information.
---Strips any domain suffix and title-cases the result.
function F.get_hostname(pane: Pane WezTerm pane object.): string

---Check whether a path is a directory.
---Uses `io.open()` to probe the path.
---Not 100% reliable on all platforms but avoids `lfs` or FFI dependencies — good enough
---for WezTerm configuration code.
function F.is_dir(path: string Path to check.): boolean

---Get platform information.
---Identifies OS based on `wezterm.target_triple`.
function F.platform(): Warp.FileSystem.Platform

---Read the entire contents of a small file.
---Returns `nil` when the file cannot be opened.
function F.read_file(path: string File path to read.): string|nil|? | nil

local record Warp.List.BisectOpts
	---Search variant (default `"lower"`).
	bound: "lower"|"upper" | nil
	---End index, exclusive (default `#list + 1`).
	hi: integer | nil
	---Map each element before comparison.
	key: fun | nil(val: any): any
	---Start index (default `1`).
	lo: integer | nil
end

local record Warp.List
local L = {}

---Binary search for an insertion point in a sorted list.
---Returns the index where `val` can be inserted while keeping `list` sorted.
---With `bound = "lower"` (default) returns the first valid position;
---with `bound = "upper"` returns the last valid position.
---Behavior is undefined on unsorted lists.
---```lua
---local t = { 1, 2, 2, 3, 3, 3 }
---M.bisect(t, 3) -- 4 (first position)
---M.bisect(t, 3, { bound = "upper" }) -- 7 (past last)
---```
---@generic T
---@param list {T} Sorted list.
---@param val T Value to search for.
---@param opts? Warp.List.BisectOpts Options.
function L.bisect(list, val, opts): integer

---Compute Cartesian product of multiple lists.
---Collects all combinations from `cartesian_iter_copy()` into a single table.
---Each entry is an independent table that can be safely stored or mutated.
function L.cartesian(sets: {any}[] List of sub-lists for the product.): {any}[]

---Compute Cartesian product of multiple lists (iterator).
---Returns an iterator yielding each combination as a shared table.
---The returned table is reused between iterations; copy it if you
---need to store or mutate individual results.
---```lua
---for i, combo in M.cartesian_iter({ { 1, 2 }, { "a", "b" } }) do
---  print(i, combo[1], combo[2])
---end
----- 1  1  a
----- 2  1  b
----- 3  2  a
----- 4  2  b
---```
function L.cartesian_iter(sets: {any}[] List of sub-lists for the product.): fun():

---Compute Cartesian product of multiple lists (copying iterator).
---Wraps `cartesian_iter()`, copying each yielded combination into a fresh table
---that the caller can safely store or mutate.
function L.cartesian_iter_copy(sets: {any}[] List of sub-lists for the product.): fun():

---Check if a list contains a given value.
---Scans the array portion (`1` to `#list`) using a numeric `for`.
---Comparison uses raw equality (`==`).
---For general tables (hash keys, predicate matching) use:
--- - [warp.table.contains()](lua://Warp.Table.contains).
---@generic T
function L.contains(list: {T} List to search., value: T Value to find.): boolean

---Append elements from one list into another in-place.
---Inserts elements from `src` (from index `start` to `finish`, inclusive)
---at the end of `dst`. Mutates and returns `dst`.
---@generic T: table
---@param dst T Destination list (modified in-place).
---@param src table Source list.
---@param start? integer First index in `src` (default `1`).
---@param finish? integer Last index in `src` (default `#src`).
function L.extend(dst, src, start, finish): T

---Append elements from one list into another, skipping duplicates.
---For each item in `src`, scans `dst` and appends the item only when it is not already present.
---Comparison uses raw equality (`==`). Mutates and returns `dst`.
---```lua
---M.extend_unique({ 1, 2, 3 }, { 3, 4, 5 })
----- { 1, 2, 3, 4, 5 }
---```
---@generic T: table
function L.extend_unique(dst: T Destination list (modified in-place)., src: {any} Source list.): T

---Find the first element matching a predicate.
---Scans the array portion (`1` to `#list`) and returns the first element
---for which `fn` returns a truthy value, along with its index.
---Returns `nil` if no match is found.
---@generic T
---@param list {T} List to search.
---@param fn fun(v: T): any Predicate function.
---@return T|nil|? value First matching element, or `nil`.
function L.find(list, fn): integer|nil|? | nil

---Flatten a nested list.
---Recursively flattens sub-lists up to `depth` levels deep.
---When `depth` is `nil`, flattens completely.
---@generic T
---@param list {any} List to flatten.
---@param depth? integer Maximum nesting depth (default: unlimited).
function L.flatten(list, depth): {T}

---Reverse list elements in-place.
---Swaps elements from both ends toward the center.
---Only the array portion (`1` to `#list`) is affected; hash keys are untouched.
---@generic T
function L.reverse(list: {T} List to reverse.): {T}

---Create a sub-list copy.
---Returns a new list containing elements from `start` to `finish` (inclusive).
---Does not modify the original list.
---@generic T
---@param list {T} Source list.
---@param start? integer First index (default `1`).
---@param finish? integer Last index (default `#list`).
function L.slice(list, start, finish): {T}

---Remove duplicate values from a list in-place.
---Only the first occurrence of each value is kept.
---When `key` is provided it is called for each element to compute a hash key for
---uniqueness comparison. If `key` returns `nil` for a value, that value
---is always considered unique.
---```lua
---M.unique({ 1, 2, 2, 3, 1 })
----- { 1, 2, 3 }
---M.unique(
---  { { id = 1 }, { id = 2 }, { id = 1 } },
---  function(x) return x.id end
---)
----- { { id = 1 }, { id = 2 } }
---```
---@generic T
---@param list {T} List to deduplicate (modified in-place).
---@param key? fun(x: T): any Optional uniqueness key function.
function L.unique(list, key): {T}

---Zip parallel lists into a list of tuples.
---Combines elements at the same index from each input list.
---Stops at the length of the shortest list.
---@param ... {any}[] Lists to zip.
function L.zip(...): {any}[]

local record Warp.Maths
local MT = {}

---Clamp a number to the range [`minimum`, `maximum`].
---Returns `minimum` when `number` is below the range, `maximum` when above,
---or `number` itself when already within bounds.
---@param number number Value to clamp.
function MT.clamp(minimum: number Lower bound (inclusive)., minimum, maximum: number Upper bound (inclusive).): number

---Round a number to the nearest integer (half-to-even).
---Uses an IEEE 754 double-precision trick: adding then subtracting a magic constant
---forces the floating-point unit to round to the nearest representable integer.
---Ties are broken by rounding to the nearest **even** integer (banker's rounding),
---e.g. `0.5` → `0`, `1.5` → `2`, `2.5` → `2`.
---Only accurate for numbers whose absolute value is less than `2^51` (`2251799813685248`).
function MT.round(number: number Number to round.): integer

---Round a number to the nearest given multiple (half-to-even).
---Divides by `multiple`, rounds the quotient using the same IEEE 754 half-to-even trick
---as `Warp.Maths.round()`, then multiplies back.
function MT.round_to(number: number Number to round., multiple: integer Target multiple (must be non-zero).): integer

local record Warp.Path
	---Whether the current platform is Windows.
	is_win: boolean
	---Platform-specific path separator (`\` on Windows, `/` elsewhere).
	separator: string
local P = {}

---Concatenate path components.
---Joins arguments using the platform-specific path separator.
---@param ... string Path components to join.
function P.concat(...): string

---Return the parent directory of a path.
function P.dirname(path: string File or directory path.): string

---Expand `~` prefix to the user home directory.
---Requires the filesystem module to resolve the home path. Only expands a leading `~`
---followed by `/`, `\`, or end-of-string.
function P.expand(path: string File or directory path.): string

---Return the file extension including the leading dot.
---Returns an empty string when no extension is found.
function P.extension(path: string File path.): string

---Check whether a path is absolute.
function P.is_absolute(path: string File or directory path.): boolean

---Abbreviate path by shortening intermediate components to specified length.
function P.shorten(path: string File or directory path., len: integer Number of characters to keep per component.): string

---Shorten a path to fit within a visible column budget.
---Abbreviates intermediate directory components, and if the last component
---still doesn't fit, then it middle-truncates it.
---Preserves the general path shape for readability.
function P.shorten_to(path: string File or directory path., max_len: integer Maximum visible column width.): string

---Normalize a path.
---Collapses `.`, `..`, and repeated separators.
---Converts backslashes to forward slashes.
---Preserves a leading `~` and trailing separator only when the path is root (`/`).
function P.normalize(path: string File or directory path.): string

local record Warp.String.SplitOpts
	---If `true`, treat `sep` as plain text.
	plain: boolean | nil
	---If `true`, trim empty edge segments.
	trimempty: boolean | nil
end

local record Warp.String
---Empty string constant.
empty: ""
---Single space constant.
space: " "
local S = {}

local type Warp.String.Padding integer|{ left?: integer, right?: integer }

---Alias for `wezterm.column_width`.
function S.col_width(s: string): integer

---Check whether `s` ends with the given suffix.
function S.ends_with(s: string Input string., suffix: string Suffix to test.): boolean

---Return whether `s` already fits within `budget` visible columns.
function S.fits(s: string, budget: integer): boolean

---Iterate over substrings separated by pattern.
---Returns an iterator yielding substrings from input `s`, separated by `sep`.
---@param s string Input string to split.
---@param sep string Separator pattern.
---@param opts? Warp.String.SplitOpts Optional splitting behavior.
function S.gsplit(s, sep, opts): fun():

---Left-justify `s` to a total visible width.
---Pads on the right so the result is at least `total_width` columns wide.
---If `s` already meets or exceeds the width, it is returned unchanged.
---@param s string Input string.
---@param total_width integer Desired total column width.
---@param ch? string Padding character (default `" "`).
function S.ljust(s, total_width, ch): string

---Pad string on both sides.
---Converts input to string if necessary and adds
---whitespace to both sides. Adds a single whitespace by
---default but respects `nil` values when `padding` is a
---table (e.g. `{ left = 1, right = nil }` won't add any
---right padding).
---@param s string|any Input value to pad.
---@param padding? Warp.String.Padding Spaces to add per side. Defaults to `1`.
---@param ch? string Char to use when padding. Defaults to `" "`
function S.pad(s, padding, ch): string

---Pad string on left side.
---@param s any Input value to pad.
---@param padding? integer Spaces to add. Defaults to `1`
---@param ch? string Char to use when padding. Defaults to `" "`
function S.padl(s, padding, ch): string

---Pad string on right side.
---@param s any Input value to pad.
---@param padding? integer Spaces to add. Defaults to `1`
---@param ch? string Char to use when padding. Defaults to `" "`
function S.padr(s, padding, ch): string

---Right-justify `s` to a total visible width.
---Pads on the left so the result is at least `total_width` columns wide.
---If `s` already meets or exceeds the width, it is returned unchanged.
---@param s string Input string.
---@param total_width integer Desired total column width.
---@param ch? string Padding character (default `" "`).
function S.rjust(s, total_width, ch): string

---Split string into list of substrings.
---Uses `warp.string.gsplit()` internally.
---@param s string Input string to split.
---@param sep string Separator pattern.
---@param opts? Warp.String.SplitOpts Optional splitting behavior.
function S.split(s, sep, opts): {string}

---Check whether `s` starts with the given prefix.
function S.starts_with(s: string Input string., prefix: string Prefix to test.): boolean

---Strip ANSI/VT escape sequences from a string.
function S.strip_ansi(s: string Raw rendered string, may contain ANSI codes.): string

---Remove leading and trailing whitespace.
function S.trim(s: string Input string.): string

---Truncate `s` to fit within `budget` columns using the specified strategy.
---@param mode Warp.String.TruncateMode Truncation strategy.
function S.truncate(s: string Input string., s, budget: integer Total columns available.): string

---Truncate from the **left**, prepending an ellipsis.
---`"plasma-csd-generator.rebupk"` → `"…ator.rebupk"`
function S.truncate_left(s: string Input string., budget: integer Total columns available (including the ellipsis).): string

---Truncate from the **middle**, keeping both ends readable.
---The left side gets the extra column when the budget is odd.
---`"plasma-csd-generator.rebupk"` → `"plasma-c…rebupk"`
function S.truncate_middle(s: string Input string., budget: integer Total columns available (including the ellipsis).): string

---Truncate from the **right**, appending an ellipsis.
---`"plasma-csd-generator.rebupk"` → `"plasma-csd-gen…"`
function S.truncate_right(s: string Input string., budget: integer Total columns available (including the ellipsis).): string

---Calculate visible string width.
---Strips any ANSI escape sequences (otherwise they would contribute to the width)
---and then calls the WezTerm internal `column_width()` function.
function S.width(s: string Input string.): integer

local record Warp.Table
local T = {}

---Check if a table contains a given value.
---Scans all values via `pairs()`. Comparison uses raw equality (`==`).
---When `opts.predicate` is `true`, `value` is treated as a predicate function that receives
---each table value and should return `true` for a match.
---Use `warp.list.contains()` for a faster check on list-like tables.
---@param tbl table Table to search.
---@param value any Value to find, or predicate.
---@param opts? { predicate?: boolean } Options.
function T.contains(tbl, value, opts): boolean

---Shallow copy of a table.
---Creates a new table with the same key-value pairs.
---Nested tables are not cloned — they share the same reference.
---Non-table values are returned as-is. Metatables are not copied.
function T.copy(obj: any Value to copy. Non-tables are returned as-is.): any

---Count all entries in a table.
---Returns the total number of key-value pairs (array and hash).
---For list-like tables the result equals `#tbl`; for mixed or hash tables it includes all keys.
function T.count(tbl: table Table to count.): integer

---Deep compare two values for equality.
---Tables are compared recursively: two tables are equal when they have
---the same set of keys and every corresponding pair of values is deeply equal.
---Reference-equal values (`a == b`) short-circuit immediately, which also respects
---any `__eq()` metamethod. All other types are compared with `==`.
function T.deep_equal(a: any First value., b: any Second value.): boolean

---Recursively merge two or more tables.
---Behaves like `warp.table.extend()` but recursively merges values that are non-list tables.
---List-like tables and non-table values are overwritten according to `behavior`, not merged.
---This is useful for combining nested configuration tables where lists should be treated
---as atomic values.
---@param behavior Warp.Table.MergeBehavior Conflict strategy.
---@param ... table Two or more tables to merge.
function T.deep_extend(behavior, ...): table

---Deep copy of a table.
---Recursively copies all nested tables, producing a fully independent clone.
---Metatables are preserved on every level. Non-table values are returned as-is.
---When `noref` is `false` (default) each table is copied at most once and circular references
---are handled — all references to the same source table point to one copy.
---When `noref` is `true` every occurrence produces a new copy, which is faster for tables with
---many unique sub-tables but will loop infinitely on cyclic structures.
---@param obj any Value to deep copy. Non-tables returned as-is.
---@param noref? boolean Skip reference tracking when `true`.
function T.deepcopy(obj, noref): any

---Merge two or more tables.
---Returns a new table built by iterating every key-value pair from each source table in order.
---The `behavior` parameter controls what happens when a key appears in more than one table:
---- `"error"` — raise an error.
---- `"keep"` — use the value from the leftmost table.
---- `"force"` — use the value from the rightmost table.
---@param behavior Warp.Table.MergeBehavior Conflict strategy.
---@param ... table Two or more tables to merge.
function T.extend(behavior, ...): table

---Filter a table using a predicate function.
---Creates a new list containing only the values for which `fn` returns a truthy value.
---Keys are discarded — the result is always a flat list.
---Iteration follows `pairs()` order (not guaranteed to be stable).
---@generic V
function T.filter(tbl: table<any, V> Table to filter., fn: fun(value: V): boolean Predicate function.): {V}

---Index into a table via successive keys.
---Traverses nested tables by indexing with each key in order.
---Returns `nil` if any intermediate key is missing or leads to a non-table value
---before the final key.
---```lua
---M.get({ key = { nested = true } }, "key", "nested")
----- true
---M.get({ key = {} }, "key", "nested")
----- nil
---```
---@param tbl table Table to index.
---@param ... any Keys to traverse (one or more).
function T.get(tbl, ...): any

---Swap keys and values of a table.
---Creates a new table where each value becomes a key and its former key becomes the value.
---When multiple keys share the same value, one of them wins arbitrarily.
---@generic K, V
function T.invert(tbl: table<K, V> Table to invert.): table<V,

---Check if a table is indexed only by integers.
---Returns `true` when every key in `tbl` is an integer (positive, negative, or zero),
---even if there are gaps.
---An empty table (`{}`) is considered a valid array.
---Returns `false` for non-table values.
---Use `warp.table.islist()` to test for a contiguous 1-based sequence.
function T.isarray(tbl: any Value to check.): boolean

---Check if a table has no entries (array or hash).
---Returns `true` when `tbl` is `nil` or `next(tbl)` is `nil`, meaning no array
---or hash-map keys exist.
---@param tbl? table Table to check.
function T.isblank(tbl): boolean

---Check if a list has no array elements.
---Returns `true` when `tbl` is `nil` or its length is `0`.
---Hash-only entries are ignored; use `warp.table.isblank()` to test for a completely empty table.
---@param tbl? table List to check.
function T.isempty(tbl): boolean

---Check if a table is a contiguous integer-indexed list.
---Returns `true` when every key in `tbl` is a consecutive integer from `1` to `#tbl`
---with no gaps or extra hash keys.
---An empty table (`{}`) is considered a valid list.
---Returns `false` for non-table values.
function T.islist(tbl: any Value to check.): boolean

---Return all keys of a table.
---Creates a new list containing every key from `tbl`.
---The order is not guaranteed (follows `pairs()` traversal).
---Works on both list-like and hash tables.
---@generic K
function T.keys(tbl: table<K, any> Table to extract keys from.): {K}

---Apply a function to every value of a table.
---Creates a new table where each value is the result of calling `fn` on
---the corresponding value in `tbl`. Keys are preserved.
---Iteration follows `pairs()` order (not guaranteed to be stable).
---@generic K, V
function T.map(tbl: table<K, V> Table to transform., fn: fun(value: V): any Mapping function.): table<K,

---In-place deep merge of tables.
---Recursively merges key-value pairs from each source table into `tbl`, modifying it directly.
---Non-list sub-tables are merged recursively; list-like tables and non-table values are
---overwritten according to `behavior`.
---When `opts.combine` is `true`, list-like incoming values are appended to existing list values
---(skipping duplicates) instead of overwriting them.
---`opts` can be a behavior string shorthand (`"error"`, `"keep"`, or `"force"`), or a table:
---- `behavior` — `"error"` | `"keep"` | `"force"` (default `"keep"`).
---- `combine` — append list values instead of overwriting.
---@param opts Warp.Table.MergeOpts|Warp.Table.MergeBehavior Options or behavior string.
---@param tbl table Base table to merge into (modified in-place).
---@param ... table One or more source tables.
function T.merge(opts, tbl, ...): table

---Fold a table into a single value.
---Iterates all entries via `pairs()` and accumulates a result by calling `fn(acc, value, key)`
---for each entry.
---The order is not guaranteed (follows `pairs()` traversal).
---@generic V, R
---@param tbl table<any, V> Table to reduce.
function T.reduce(fn: fun(acc: R, value: V, key: any): R Reducer., fn, init: R Initial accumulator.): R

---Iterate key-value pairs in sorted key order.
---Returns an iterator suitable for `for`-`in` loops.
---Keys are collected, sorted with `table.sort()`, and yielded in ascending order.
---Only works correctly when all keys are of the same comparable type
---(typically strings or numbers).
---@generic K, V
function T.spairs(tbl: table<K, V> Table to iterate.): fun():

---Return all values of a table.
---Creates a new list containing every value from `tbl`.
---The order is not guaranteed (follows `pairs()` traversal).
---Works for both list-like and hash tables.
---@generic V
function T.values(tbl: table<any, V> Table to extract values from.): {V}

---Public API surface for the Warp plugin.
local record Warp
	---Filesystem helpers.
	filesystem: Warp.FileSystem
	---List (sequence) utilities.
	list: Warp.List
	---Math helpers.
	maths: Warp.Maths
	---Path manipulation helpers.
	path: Warp.Path
	---String utilities.
	string: Warp.String
	---General table utilities.
	table: Warp.Table
end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
