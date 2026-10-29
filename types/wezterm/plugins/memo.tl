---@diagnostic disable:unused-local

local record Memo.Cache.Namespace
	_prefix: string
local NS = {}

---@param selector? table
function NS.clear(selector) end

function NS.compute(name: string, fn: fun(...: any): any, ...: any)(): any

function NS.delete(key: string) end

function NS.expire(key: string) end

function NS.get(key: string)(): any

function NS.has(key: string): boolean

function NS.is_fresh(key: string): boolean

---@param selector? table
function NS.keys(selector): string[]

---@param key string
---@param value any
---@param opts? Memo.CacheOpts
function NS.set(key, value, opts) end

function NS.touch(key: string) end

local record Memo.CacheOpts
	---Whether to log debug messages.
	debug: boolean | nil
	---Eviction policy when max_entries reached ("expire-first").
	eviction: string | nil
	---Force `cache.set()` to overwrite an existing value.
	---See:
	--- - [`cache.set()`](lua://Memo.Cache.set)
	force: boolean | nil
	---Max number of cache entries; `nil` == unlimited.
	max_entries: integer | nil|false
	---Whether to track hit/miss statistics.
	stats: boolean | nil
	---TTL configuration; `nil` == disabled.
	ttl: table | nil|false
	---Clock function used for TTL checks.
	clock: fun | nil(): number
end

local record Memo.Cache
local C = {}

---Ensure a key in `wezterm.GLOBAL` is a table and recursively fill defaults.
function C._ensure_global_tbl(key: string, template: table)(): table

---Reset all configuration to defaults.
---Intended for test teardown; not part of the normal public API.
function C._reset_config(): nil

---Recursively assign data into a `wezterm.GLOBAL`-backed table.
function C._sync_to_global(target: table, source: table): nil

---Clear cache entries.
---Without arguments, clears the entire cache.
---With a selector table:
--- - `{ prefix = "foo" }` — Deletes all keys starting with `"foo"`.
--- - `{ older_than = N }` — Deletes entries older than `N` seconds (TTL mode).
---@param selector? table
function C.clear(selector) end

---Execute a function and cache its result using an argument-derived key.
---Generates a deterministic key from `name` plus the serialised arguments,
---checks the cache first, and only calls `fn(...)` on miss.
---@param name string Namespace or context identifier.
---@param fn fun(...: any): any Function to execute on cache miss.
---@param ... any Parameters to be passed to `fn`.
function C.compute(name, fn, ...): any

---Configure the cache.
---Merges the provided options into the current configuration.
---Pass `false` for nullable fields (`ttl`, `max_entries`) to explicitly disable them.
function C.configure(opts: Memo.CacheOpts  Partial config table (see `memo.cache.Config` fields).): nil

---Delete a single cache entry.
function C.delete(key: string Cache key.): nil

---Mark a key as expired immediately.
---Will no-op when TTL is disabled.
function C.expire(key: string Cache key.): nil

---Retrieve a cached value.
function C.get(key: string  Cache key.): any

---Check whether a key exists and is fresh.
function C.has(key: string Cache key.): boolean

---Check whether a cached entry is still fresh.
---Always returns `true` when TTL is disabled (entries never expire).
function C.is_fresh(key: string Cache key.)(): boolean

---Return all cache keys, optionally filtered.
---@param selector? table `{ prefix = "foo" }` to filter.
function C.keys(selector): string[]

---Create a namespaced cache wrapper.
---All keys are automatically prefixed with `name .. ":"`.
---The returned wrapper exposes the same API as `Memo.Cache` but scoped to the prefix.
function C.namespace(name: string Namespace identifier.): Memo.Cache.Namespace

---Store a value in the cache.
---Functions cannot be stored in `wezterm.GLOBAL`. Attempting to store a function
---will log an error and return without writing.
---@param key string Cache key.
---@param value any Value to store (must not be a function).
---@param opts? Memo.CacheOpts Per-call options `{ ttl = N }`.
function C.set(key, value, opts) end

---Return cache statistics.
---Only meaningful when `configure({ stats = true })` has been called.
---Returns a table with `hits`, `misses`, `evictions`, and `entries`.
function C.stats(): table

---Reset the TTL on an existing key (bump its expiry to now + default TTL).
---Will no-op when TTL is disabled or when the key does not exist.
function C.touch(key: string Cache key.): nil

local record Memo.Key
local K = {}

---Generate a deterministic cache key from a name and variadic arguments.
---String arguments are included verbatim; all other types are serialized.
---Parts are joined with `|`.
---@param name string Namespace or context identifier.
---@param ... any Parameters for the cached computation.
function K.make_cache_key(name, ...): string

---Serialize any Lua value into a deterministic string representation.
---Tables are serialized recursively with sorted keys.
---Cyclic references produce the sentinel `"<cycle>"` instead of looping.
---@param v any
---@param seen? table<table, boolean> Cycle-detection set (internal).
function K.serialize(v, seen): string

local record Memo.State.Store
	---Use background_task for writes if available.
	_async: boolean
	---Load from disk on first access.
	_auto_load: boolean
	---Flush to disk on every mutation.
	_auto_save: boolean
	---Absolute path to the JSON file.
	_path: string
	---Reference into `wezterm.GLOBAL` slot (`{ loaded, data }`).
	_store: table
local ST = {}

---Clear all entries.
function ST:clear(): nil

---Delete a single key.
function ST:delete(key: string): nil

---Retrieve a value by key.
function ST:get(key: string)(): any

---Check whether a key exists.
function ST:has(key: string): boolean

---Load state from the JSON file on disk.
---This always reads from disk (bypasses the load guard) and marks the store
---as loaded so subsequent `ensure_loaded` calls are no-oped.
function ST:load(): nil

---Return a shallow copy of all stored data.
function ST:restore(): table

---Flush current state to disk as JSON.
---Uses `wezterm.background_task` when available and `async` is enabled;
---otherwise writes synchronously.
function ST:save(): nil

---Store a value.
---Keys must be strings due to limitations from JSON.
---Functions cannot be persisted.
function ST:set(key: string, value: any): nil

local record Memo.State.StoreOpts
	---Use `background_task` when available.
	---Defaults to `true`.
	async: boolean | nil
	---Load from disk on first access.
	---Defaults to `true`.
	auto_load: boolean | nil
	---Write to disk on every mutation.
	---Defaults to `true`.
	auto_save: boolean | nil
	---Absolute path to the JSON file.
	path: string
end

local record Memo.State
local S = {}

---Create a new file-persistent state store.
function S.new(opts: Memo.State.StoreOpts Options:): Memo.State.Store

local record Memo
	---Session-scoped memoization cache (`wezterm.GLOBAL`).
	---See:
	--- - [`wezterm.GLOBAL`](lua://Wezterm.GLOBAL)
	cache: Memo.Cache
	---Serialization and key generation utilities.
	key: Memo.Key
	---File-persistent key/value store factory.
	state: Memo.State

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
