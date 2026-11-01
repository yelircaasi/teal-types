local _tmp = require("_tmp")

local type AnyFunction = function(...: any): any

local record Namespace
	_prefix: string
	clear:    function(selector: table|nil): nil
	compute:  function(name: string, fn: AnyFunction, ...: any): any
	delete:   function(key:  string): nil
	expire:   function(key:  string): nil
	get:      function(key:  string): any
	has:      function(key:  string): boolean
	is_fresh: function(key:  string): boolean
	keys:     function(selector: table|nil): {string}
	set:      function(key:  string, value: any, opts: CacheOpts|nil): nil
	touch:    function(key:  string): nil
end

local record CacheOpts --Memo.CacheOpts
	debug:       boolean | nil                  ---Whether to log debug messages.
	eviction:    string  | nil                  ---Eviction policy when max_entries reached ("expire-first").
	force:       boolean | nil                  ---Force `cache.set()` to overwrite an existing value. See: [`cache.set()`](lua://Memo.Cache.set)
	max_entries: integer | boolean | nil        ---Max number of cache entries; `nil` == unlimited.
	stats:       boolean | nil                  ---Whether to track hit/miss statistics.
	ttl:         table   | boolean | nil        ---TTL configuration; `nil` == disabled.
	clock:       nil     | function(): number   ---Clock function used for TTL checks.
end

local record Cache --Memo.Cache
	_ensure_global_tbl: function(key: string, template: table): table  ---Ensure a key in `wezterm.GLOBAL` is a table and recursively fill defaults.
	_reset_config:      function(): nil                                ---Reset all configuration to defaults. Intended for test teardown; not part of the normal public API.
	_sync_to_global:    function(target: table, source: table): nil    ---Recursively assign data into a `wezterm.GLOBAL`-backed table.

	---Clear cache entries.
	---Without arguments, clears the entire cache.
	---With a selector table:
	--- - `{ prefix = "foo" }` — Deletes all keys starting with `"foo"`.
	--- - `{ older_than = N }` — Deletes entries older than `N` seconds (TTL mode).
	clear: function(selector: table|nil): nil

	---Execute a function and cache its result using an argument-derived key.
	---Generates a deterministic key from `name` plus the serialised arguments,
	---checks the cache first, and only calls `fn(...)` on miss.
	compute:   function(name: string, fn: AnyFunction, ...: any): any
	configure: function(opts: CacheOpts): nil                              ---Configure the cache. Merges the provided options into the current configuration. Pass `false` for nullable fields (`ttl`, `max_entries`) to explicitly disable them.
	delete:    function(key:  string): nil                                 ---Delete a single cache entry.
	expire:    function(key:  string): nil                                 ---Mark a key as expired immediately. Will no-op when TTL is disabled.
	get:       function(key:  string): any                                 ---Retrieve a cached value.
	has:       function(key:  string): boolean                             ---Check whether a key exists and is fresh.
	is_fresh:  function(key:  string): boolean                             ---Check whether a cached entry is still fresh. Always returns `true` when TTL is disabled (entries never expire).
	keys:      function(selector: table): {string}                         ---Return all cache keys, optionally filtered.
	namespace: function(name: string): Namespace                           ---Create a namespaced cache wrapper. All keys are automatically prefixed with `name .. ":"`. The returned wrapper exposes the same API as `Memo.Cache` but scoped to the prefix.
	set:       function(key: string, value: any, opts: CacheOpts|nil): nil ---Store a value in the cache. Functions cannot be stored in `wezterm.GLOBAL`. Attempting to store a function will log an error and return without writing.
	stats:     function(): table                                           ---Return cache statistics. Only meaningful when `configure({ stats = true })` has been called. Returns a table with `hits`, `misses`, `evictions`, and `entries`.
	touch:     function(key: string): nil                                  ---Reset the TTL on an existing key (bump its expiry to now + default TTL). Will no-op when TTL is disabled or when the key does not exist.
end

local record Key --Memo.Key
	---Generate a deterministic cache key from a name and variadic arguments.
	---String arguments are included verbatim; all other types are serialized.
	---Parts are joined with `|`.
	make_cache_key: function(name: string, ...: any): string

	---Serialize any Lua value into a deterministic string representation.
	---Tables are serialized recursively with sorted keys.
	---Cyclic references produce the sentinel `"<cycle>"` instead of looping.
	serialize:      function(v: any, seen: {table: boolean}|nil): string
end

local record Store
	_async: boolean       ---Use background_task for writes if available.
	_auto_load: boolean   ---Load from disk on first access.
	_auto_save: boolean   ---Flush to disk on every mutation.
	_path: string         ---Absolute path to the JSON file.
	_store: table         ---Reference into `wezterm.GLOBAL` slot (`{ loaded, data }`).

	clear:   function(self: Store): nil                           ---Clear all entries.
	delete:  function(self: Store, key: string): nil              ---Delete a single key.
	get:     function(self: Store, key: string): any            ---Retrieve a value by key.
	has:     function(self: Store, key: string): boolean          ---Check whether a key exists.
	load:    function(self: Store): nil                           ---Load state from the JSON file on disk. This always reads from disk (bypasses the load guard) and marks the store as loaded so subsequent `ensure_loaded` calls are no-oped.
	restore: function(self: Store): table                         ---Return a shallow copy of all stored data.
	save:    function(self: Store): nil                           ---Flush current state to disk as JSON. Uses `wezterm.background_task` when available and `async` is enabled; otherwise writes synchronously.
	set:     function(self: Store, key: string, value: any): nil  ---Store a value. Keys must be strings due to limitations from JSON. Functions cannot be persisted.
end

local record StoreOpts
	async:     boolean | nil   ---Use `background_task` when available. Defaults to `true`.
	auto_load: boolean | nil   ---Load from disk on first access. Defaults to `true`.
	auto_save: boolean | nil   ---Write to disk on every mutation. Defaults to `true`.
	path:      string          ---Absolute path to the JSON file.
end

local record State
	---Create a new file-persistent state store.
	new: function(opts: StoreOpts): Store
end

local record Memo
	cache:  Cache   ---Session-scoped memoization cache (`wezterm.GLOBAL`). See:  [`wezterm.GLOBAL`](lua://Wezterm.GLOBAL)
	key:    Key     ---Serialization and key generation utilities.
	state:  State   ---File-persistent key/value store factory.
end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
