local _tmp = require("_tmp")

local enum OsType
	"linux"
	"mac"
	"unknown"
	"windows"
end

local enum TruncateMode
	"left"
	"middle"
	"right"
end

local enum MergeBehavior
	"error"
	"force"
end

local record MergeOpts
	behavior: Warp | MergeBehavior | nil
	combine: boolean | nil
end

local record Platform
	is_linux: boolean
	is_mac:   boolean
	is_win:   boolean
	os:       OsType
end

local record FileSystem
	home:          string
	is_win:        boolean
	target_triple: string

	---Extract base name from path.
	---Equivalent to POSIX `basename(3)`.
	---Returns the final component of the path.
	basename: function(path: string): string

	---Find git project root.
	---Traverses up the directory tree looking for a `.git` directory.
	find_git_dir: function(directory: string): string|nil

	---Get the current working directory from the given pane.
	---Parses the pane's current working directory URI.
	---Normalises the home directory to `~`.
	---Optionally resolves the git root instead of the literal CWD.
	get_cwd: function(pane: _tmp.Pane, search_git_root_instead: boolean): string

	---@deprecated Use `get_cwd` and `get_hostname` separately.
	---Kept for backwards compatibility; delegates to the two focused functions.
	---@param pane Pane WezTerm pane object.
	---@param search_git_root_instead boolean If `true`, returns the Git root instead of CWD.
	---@return string cwd Current working directory or the Git root.
	get_cwd_hostname: function(pane: _tmp.Pane, search_git_root_instead: boolean): string

	---Get the hostname associated with the given pane.
	---Parses the pane's current working directory URI to extract the host field.
	---Falls back to `wezterm.hostname()` when the URI carries no host information.
	---Strips any domain suffix and title-cases the result.
	get_hostname: function(pane: _tmp.Pane): string

	---Check whether a path is a directory.
	---Uses `io.open()` to probe the path.
	---Not 100% reliable on all platforms but avoids `lfs` or FFI dependencies — good enough
	---for WezTerm configuration code.
	is_dir: function(path: string): boolean

	---Get platform information.
	---Identifies OS based on `wezterm.target_triple`.
	platform: function(): Platform

	---Read the entire contents of a small file.
	---Returns `nil` when the file cannot be opened.
	read_file: function(path: string): string|nil
end

local record BisectOpts
	enum _UpperLower
		"lower"
		"upper"
	end
	bound: _UpperLower | nil   ---Search variant (default `"lower"`).
	hi: integer | nil   ---End index, exclusive (default `#list + 1`).
	key: nil | function(val: any): any   ---Map each element before comparison.
	lo: integer | nil   ---Start index (default `1`).
end

local record List --Warp.List

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
	bisect: function<T>(list: {T}, val: T, opts: BisectOpts|nil): integer

	---Compute Cartesian product of multiple lists.
	---Collects all combinations from `cartesian_iter_copy()` into a single table.
	---Each entry is an independent table that can be safely stored or mutated.
	cartesian: function(sets: {{any}}): {any}

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
	cartesian_iter: function(sets: {table}): (function(): {integer|nil, {any}|nil})

	---Compute Cartesian product of multiple lists (copying iterator).
	---Wraps `cartesian_iter()`, copying each yielded combination into a fresh table
	---that the caller can safely store or mutate.
	cartesian_iter_copy: function(sets: {table}): (function(): {integer|nil, {any}|nil})

	---Check if a list contains a given value.
	---Scans the array portion (`1` to `#list`) using a numeric `for`.
	---Comparison uses raw equality (`==`).
	---For general tables (hash keys, predicate matching) use:
	--- - [warp.table.contains()](lua://Warp.Table.contains).
	contains: function<T>(list: {T}, value: T): boolean

	---Append elements from one list into another in-place.
	---Inserts elements from `src` (from index `start` to `finish`, inclusive)
	---at the end of `dst`. Mutates and returns `dst`.
	---@param dst T Destination list (modified in-place).
	---@param src table Source list.
	---@param start? integer First index in `src` (default `1`).
	---@param finish? integer Last index in `src` (default `#src`).
	extend: function<Table_>(dst: Table_, src: table, start: integer|nil, finish: integer|nil): Table_

	---Append elements from one list into another, skipping duplicates.
	---For each item in `src`, scans `dst` and appends the item only when it is not already present.
	---Comparison uses raw equality (`==`). Mutates and returns `dst`.
	---```lua
	---M.extend_unique({ 1, 2, 3 }, { 3, 4, 5 })
	----- { 1, 2, 3, 4, 5 }
	---```
	extend_unique: function<Table_>(dst: Table_, src: {any}): Table_

	---Find the first element matching a predicate.
	---Scans the array portion (`1` to `#list`) and returns the first element
	---for which `fn` returns a truthy value, along with its index.
	---Returns `nil` if no match is found.
	find: function<T>(list: {T}, fn: function(v: T): any): integer|nil

	---Flatten a nested list.
	---Recursively flattens sub-lists up to `depth` levels deep.
	---When `depth` is `nil`, flattens completely.
	flatten: function<T>(list: {any}, depth: integer|nil): {T}

	---Reverse list elements in-place.
	---Swaps elements from both ends toward the center.
	---Only the array portion (`1` to `#list`) is affected; hash keys are untouched.
	reverse: function<T>(list: {T}): {T}

	---Create a sub-list copy.
	---Returns a new list containing elements from `start` to `finish` (inclusive).
	---Does not modify the original list.
	---@param list {T} Source list.
	---@param start? integer First index (default `1`).
	---@param finish? integer Last index (default `#list`).
	slice: function<T>(list: {T}, start: integer|nil, finish: integer|nil): {T}

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
	unique: function<T>(list: {T}, key: function(T): any): {T}

	---Zip parallel lists into a list of tuples.
	---Combines elements at the same index from each input list.
	---Stops at the length of the shortest list.
	---@param ... {any}[] Lists to zip.
	zip: function(...: any): {any}
end

local record Maths --Warp.Maths

	---Clamp a number to the range [`minimum`, `maximum`].
	---Returns `minimum` when `number` is below the range, `maximum` when above,
	---or `number` itself when already within bounds.
	---@param number number Value to clamp.
	clamp: function(number: number, minimum: number, maximum: number): number

	---Round a number to the nearest integer (half-to-even).
	---Uses an IEEE 754 double-precision trick: adding then subtracting a magic constant
	---forces the floating-point unit to round to the nearest representable integer.
	---Ties are broken by rounding to the nearest **even** integer (banker's rounding),
	---e.g. `0.5` → `0`, `1.5` → `2`, `2.5` → `2`.
	---Only accurate for numbers whose absolute value is less than `2^51` (`2251799813685248`).
	round: function(number: number): integer

	---Round a number to the nearest given multiple (half-to-even).
	---Divides by `multiple`, rounds the quotient using the same IEEE 754 half-to-even trick
	---as `Warp.Maths.round()`, then multiplies back.
	round_to: function(number: number, multiple: integer): integer
end

local record Path --Warp.Path
	is_win: boolean   ---Whether the current platform is Windows.
	separator: string   ---Platform-specific path separator (`\` on Windows, `/` elsewhere).

	---Concatenate path components.
	---Joins arguments using the platform-specific path separator.
	---@param ... string Path components to join.
	concat: function(...: string): string

	---Return the parent directory of a path.
	dirname: function(path: string): string

	---Expand `~` prefix to the user home directory.
	---Requires the filesystem module to resolve the home path. Only expands a leading `~`
	---followed by `/`, `\`, or end-of-string.
	expand: function(path: string): string

	---Return the file extension including the leading dot.
	---Returns an empty string when no extension is found.
	extension: function(path: string): string

	---Check whether a path is absolute.
	is_absolute: function(path: string): boolean

	---Abbreviate path by shortening intermediate components to specified length.
	shorten: function(path: string, len: integer): string

	---Shorten a path to fit within a visible column budget.
	---Abbreviates intermediate directory components, and if the last component
	---still doesn't fit, then it middle-truncates it.
	---Preserves the general path shape for readability.
	shorten_to: function(path: string, max_len: integer): string

	---Normalize a path.
	---Collapses `.`, `..`, and repeated separators.
	---Converts backslashes to forward slashes.
	---Preserves a leading `~` and trailing separator only when the path is root (`/`).
	normalize: function(path: string): string
end

local record SplitOpts
	plain: boolean | nil   ---If `true`, treat `sep` as plain text.
	trimempty: boolean | nil   ---If `true`, trim empty edge segments.
end

local record _LRInts
	left: integer|nil
	right: integer|nil
end


local type Padding = integer|_LRInts


local record WarpString --Warp.String
	---Empty string constant.
	empty: _Empty
	---Single space constant.
	space: _Space

	enum _Empty
		""
	end
	enum _Space
		" "
	end

	---Alias for `wezterm.column_width`.
	col_width: function(s: string): integer

	---Check whether `s` ends with the given suffix.
	ends_with: function(s: string, suffix: string): boolean

	---Return whether `s` already fits within `budget` visible columns.
	fits: function(s: string, budget: integer): boolean

	---Iterate over substrings separated by pattern.
	---Returns an iterator yielding substrings from input `s`, separated by `sep`.
	gsplit: function(s: string, sep: string, opts: SplitOpts|nil): (function(): string|nil)

	---Left-justify `s` to a total visible width.
	---Pads on the right so the result is at least `total_width` columns wide.
	---If `s` already meets or exceeds the width, it is returned unchanged.
	---@param s string Input string.
	---@param total_width integer Desired total column width.
	---@param ch? string Padding character (default `" "`).
	ljust: function(s: string, total_width: integer, ch: string|nil): string

	---Pad string on both sides.
	---Converts input to string if necessary and adds
	---whitespace to both sides. Adds a single whitespace by
	---default but respects `nil` values when `padding` is a
	---table (e.g. `{ left = 1, right = nil }` won't add any
	---right padding).
	---@param s string|any Input value to pad.
	---@param padding? Warp.String.Padding Spaces to add per side. Defaults to `1`.
	---@param ch? string Char to use when padding. Defaults to `" "`
	pad: function(s: string, padding: integer|nil, ch: string|nil): string

	---Pad string on left side.
	---@param s any Input value to pad.
	---@param padding? integer Spaces to add. Defaults to `1`
	---@param ch? string Char to use when padding. Defaults to `" "`
	padl: function(s: string, padding: integer|nil, ch: string|nil): string

	---Pad string on right side.
	padr: function(s: string, padding: integer|nil, ch: string|nil): string

	---Right-justify `s` to a total visible width.
	---Pads on the left so the result is at least `total_width` columns wide.
	---If `s` already meets or exceeds the width, it is returned unchanged.
	rjust: function(s: string, total_width: integer, ch: string|nil): string

	---Split string into list of substrings.
	---Uses `warp.string.gsplit()` internally.
	---@param s string Input string to split.
	---@param sep string Separator pattern.
	---@param opts? Warp.String.SplitOpts Optional splitting behavior.
	split: function(s: string, sep: string, opts: SplitOpts|nil): {string}

	---Check whether `s` starts with the given prefix.
	starts_with: function(s: string, prefix: string): boolean

	---Strip ANSI/VT escape sequences from a string.
	strip_ansi: function(s: string): string

	---Remove leading and trailing whitespace.
	trim: function(s: string): string

	---Truncate `s` to fit within `budget` columns using the specified strategy.
	---@param mode Warp.String.TruncateMode Truncation strategy.
	truncate: function(s: string, budget: integer): string

	---Truncate from the **left**, prepending an ellipsis.
	---`"plasma-csd-generator.rebupk"` → `"…ator.rebupk"`
	truncate_left: function(s: string, budget: integer): string

	---Truncate from the **middle**, keeping both ends readable.
	---The left side gets the extra column when the budget is odd.
	---`"plasma-csd-generator.rebupk"` → `"plasma-c…rebupk"`
	truncate_middle: function(s: string, budget: integer): string

	---Truncate from the **right**, appending an ellipsis.
	---`"plasma-csd-generator.rebupk"` → `"plasma-csd-gen…"`
	truncate_right: function(s: string, budget: integer): string

	---Calculate visible string width.
	---Strips any ANSI escape sequences (otherwise they would contribute to the width)
	---and then calls the WezTerm internal `column_width()` function.
	width: function(s: string): integer
end

local record _Predicate
	predicate: boolean|nil
end

local record Table --Warp.Table

	---Check if a table contains a given value.
	---Scans all values via `pairs()`. Comparison uses raw equality (`==`).
	---When `opts.predicate` is `true`, `value` is treated as a predicate function that receives
	---each table value and should return `true` for a match.
	---Use `warp.list.contains()` for a faster check on list-like tables.
	contains: function(tbl: table, value: any, opts: _Predicate): boolean

	---Shallow copy of a table.
	---Creates a new table with the same key-value pairs.
	---Nested tables are not cloned — they share the same reference.
	---Non-table values are returned as-is. Metatables are not copied.
	copy: function(obj: any): any

	---Count all entries in a table.
	---Returns the total number of key-value pairs (array and hash).
	---For list-like tables the result equals `#tbl`; for mixed or hash tables it includes all keys.
	count: function(tbl: table): integer

	---Deep compare two values for equality.
	---Tables are compared recursively: two tables are equal when they have
	---the same set of keys and every corresponding pair of values is deeply equal.
	---Reference-equal values (`a == b`) short-circuit immediately, which also respects
	---any `__eq()` metamethod. All other types are compared with `==`.
	deep_equal: function(a: any, b: any): boolean

	---Recursively merge two or more tables.
	---Behaves like `warp.table.extend()` but recursively merges values that are non-list tables.
	---List-like tables and non-table values are overwritten according to `behavior`, not merged.
	---This is useful for combining nested configuration tables where lists should be treated
	---as atomic values.
	---@param behavior Warp.Table.MergeBehavior Conflict strategy.
	---@param ... table Two or more tables to merge.
	deep_extend: function(behavior: MergeBehavior, ...: table): table

	---Deep copy of a table.
	---Recursively copies all nested tables, producing a fully independent clone.
	---Metatables are preserved on every level. Non-table values are returned as-is.
	---When `noref` is `false` (default) each table is copied at most once and circular references
	---are handled — all references to the same source table point to one copy.
	---When `noref` is `true` every occurrence produces a new copy, which is faster for tables with
	---many unique sub-tables but will loop infinitely on cyclic structures.
	deepcopy: function(obj: any, noref: boolean|nil): any

	---Merge two or more tables.
	---Returns a new table built by iterating every key-value pair from each source table in order.
	---The `behavior` parameter controls what happens when a key appears in more than one table:
	---- `"error"` — raise an error.
	---- `"keep"` — use the value from the leftmost table.
	---- `"force"` — use the value from the rightmost table.
	---@param behavior Warp.Table.MergeBehavior Conflict strategy.
	---@param ... table Two or more tables to merge.
	extend: function(behavior: MergeBehavior, ...: table): table

	---Filter a table using a predicate function.
	---Creates a new list containing only the values for which `fn` returns a truthy value.
	---Keys are discarded — the result is always a flat list.
	---Iteration follows `pairs()` order (not guaranteed to be stable).
	filter: function<V>(tbl: {any: V}, fn: function(value: V): boolean): {V}

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
	get: function(tbl: table, ...: any): any

	---Swap keys and values of a table.
	---Creates a new table where each value becomes a key and its former key becomes the value.
	---When multiple keys share the same value, one of them wins arbitrarily.
	invert: function<K, V>(tbl: {K: V}): {V}

	---Check if a table is indexed only by integers.
	---Returns `true` when every key in `tbl` is an integer (positive, negative, or zero),
	---even if there are gaps.
	---An empty table (`{}`) is considered a valid array.
	---Returns `false` for non-table values.
	---Use `warp.table.islist()` to test for a contiguous 1-based sequence.
	isarray: function(tbl: any): boolean

	---Check if a table has no entries (array or hash).
	---Returns `true` when `tbl` is `nil` or `next(tbl)` is `nil`, meaning no array
	---or hash-map keys exist.
	---@param tbl? table Table to check.
	isblank: function(tbl: table|nil): boolean

	---Check if a list has no array elements.
	---Returns `true` when `tbl` is `nil` or its length is `0`.
	---Hash-only entries are ignored; use `warp.table.isblank()` to test for a completely empty table.
	isempty: function(tbl: table|nil): boolean

	---Check if a table is a contiguous integer-indexed list.
	---Returns `true` when every key in `tbl` is a consecutive integer from `1` to `#tbl`
	---with no gaps or extra hash keys.
	islist: function(tbl: any): boolean

	---Return all keys of a table.
	---Creates a new list containing every key from `tbl`.
	---The order is not guaranteed (follows `pairs()` traversal).
	---Works on both list-like and hash tables.
	keys: function<K>(tbl: {K: any}): {K}

	---Apply a function to every value of a table.
	---Creates a new table where each value is the result of calling `fn` on
	---the corresponding value in `tbl`. Keys are preserved.
	---Iteration follows `pairs()` order (not guaranteed to be stable).
	map: function<K, K_, V>(tbl: {K: V}, fn: function<K_>(value: V): K_): {K_}

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
	merge: function(opts: MergeOpts|MergeBehavior, tbl: table, ...: table): table

	---Fold a table into a single value.
	---Iterates all entries via `pairs()` and accumulates a result by calling `fn(acc, value, key)`
	---for each entry.
	---The order is not guaranteed (follows `pairs()` traversal).
	reduce: function<V, R>(tbl: {any: V}, fn: function(acc: R, value: V, key: any): R, init: R): R

	---Iterate key-value pairs in sorted key order.
	---Returns an iterator suitable for `for`-`in` loops.
	---Keys are collected, sorted with `table.sort()`, and yielded in ascending order.
	---Only works correctly when all keys are of the same comparable type
	---(typically strings or numbers).
	---@generic K, V
	spairs: function<K, V, R>(tbl: {K: V}): (function(): {K|nil, V|nil})

	---Return all values of a table.
	---Creates a new list containing every value from `tbl`.
	---The order is not guaranteed (follows `pairs()` traversal).
	---Works for both list-like and hash tables.
	---@generic V
	values: function<V, R>(tbl: {any: V}): {V}
end

---Public API surface for the Warp plugin.
local record Warp
	filesystem: FileSystem   ---Filesystem helpers.
	list:   List     ---List (sequence) utilities.
	maths:  Maths    ---Math helpers.
	path:   Path     ---Path manipulation helpers.
	string: WarpString   ---String utilities.
	table:  Table    ---General table utilities.
end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
