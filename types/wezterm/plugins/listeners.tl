---@diagnostic disable:unused-local

local record ListenersOpts
	---Default options for state functions.
	function_options: Listeners |FunctionOpts | nil
	toast_timeout: integer | nil

---@generic T
local record Listeners.EventListener
	error: boolean | nil
	fn: fun | nil(args: {T})
	info: boolean | nil
	log_message: string | nil
	max_time: integer | nil
	---Key of a stored function in the state.
	state_fn: string | nil
	toast_arg: integer | nil
	toast_message: string | nil
	warn: boolean | nil
end

local type Listeners.EventListeners {string: Listeners.{EventListener}|Listeners.EventListener}

local record Listeners.InternalState
	counters: {string: integer}
	data: {string: any}
	flags: {string: boolean}
	functions: {string: function}

local record Listeners.Flags
local G = {}

function G.get(key: string)(): boolean

function G.remove(key: string) end

function G.set(key: string, value: boolean)(): boolean

function G.toggle(key: string)(): boolean

local record Listeners.Data
local D = {}

function D.get(key: string): any

function D.remove(key: string) end

function D.set(key: string, value: any): any

local record Listeners.Counters
local C = {}

function C.decrement(key: string, decrement: integer): integer

function C.get(key: string)(): integer

---@param key string
---@param increment? integer
function C.increment(key, increment): integer

function C.remove(key: string) end

---@param key string
---@param value? integer
function C.set(key, value): integer

local record Listeners.FunctionOpts
	---Whether to use safe execution with error handling (default: `true`).
	safe: boolean | nil
	---Timeout setting (currently not enforced due to WezTerm limitations).
	timeout: integer | nil
end

local record Listeners.FunctionCallResult
	---Error message (if not successful).
	error: string | nil
	---The result of the function call (if successful).
	result: any
	---Whether the function executed successfully.
	success: boolean
	---Whether the function timed out.
	timed_out: boolean | nil
end

local record Listeners.Functions
local F = {}

---Call a function with variable arguments, returns result and error.
---@param key string
---@param ... any
---@return any result
function F.call(key, ...): string|nil|? | nil

function F.exists(key: string): boolean

function F.get(key: string): function

---Get the options for a function.
function F.get_options(key: string): Listeners.FunctionOpts|nil|? | nil

function F.remove(key: string) end

---Safe call with full result object.
---@param key string
---@param ... any
function F.safecall(key, ...): Listeners.FunctionCallResult

---@param key string
---@param value function
---@param options? Listeners.FunctionOpts
function F.set(key, value, options): function

local record Listeners.State: Listeners.InternalState
	counters: Listeners.Counters
	data: Listeners.Data
	flags: Listeners.Flags
	functions: Listeners.Functions

local record Listeners
	state: Listeners.State
local M = {}

config: function(event_listeners: Listeners.EventListeners, opts: ListenersOpts) end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
