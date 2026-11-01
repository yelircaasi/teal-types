local _tmp = require("_tmp")

local record ListenersOpts
	function_options: FunctionOpts | nil   ---Default options for state functions.
	toast_timeout: integer | nil
end

local record EventListener where self._tl_type == "EventListener"
	_tl_type: string
	error: boolean | nil
	fn: nil | function<T>(args: {T}): nil
	info: boolean | nil
	log_message: string | nil
	max_time: integer | nil
	state_fn: string | nil   ---Key of a stored function in the state.
	toast_arg: integer | nil
	toast_message: string | nil
	warn: boolean | nil
end

local record _EventListenerArray
	is {EventListener}
	where self._tl_type == nil	
	_tl_type: nil
end
local type EventListenerArray = {EventListener}

local type EventListeners = {string, _EventListenerArray|EventListener}

local record InternalState
	counters: {string: integer}
	data: {string: any}
	flags: {string: boolean}
	functions: {string: function}
end

local record Flags --Listeners.Flags

	-- G.
	get: function(key: string): boolean

	-- G.
	remove: function(key: string): nil

	-- G.
	set: function(key: string, value: boolean): boolean

	-- G.
	toggle: function(key: string): boolean
end

local record Data --Listeners.Data

	get: function(key: string): any

	remove: function(key: string): nil

	set: function(key: string, value: any): any
end

local record Counters --Listeners.Counters

	decrement: function(key: string, decrement: integer): integer

	get: function(key: string): integer

	increment: function(key: string, increment: integer|nil): integer

	remove: function(key: string): nil

	set: function(key: string, value: integer|nil): integer
end

local record FunctionOpts --Listeners.FunctionOpts
	safe: boolean | nil   ---Whether to use safe execution with error handling (default: `true`).
	timeout: integer | nil   ---Timeout setting (currently not enforced due to WezTerm limitations).
end

local record FunctionCallResult --Listeners.FunctionCallResult
	error: string | nil   ---Error message (if not successful).
	result: any   ---The result of the function call (if successful).
	success: boolean   ---Whether the function executed successfully.
	timed_out: boolean | nil   ---Whether the function timed out.
end

local record Functions --Listeners.Functions

	---Call a function with variable arguments, returns result and error.
	call: function(key: string, ...: any): {any, string|nil}

	exists: function(key: string): boolean

	get: function(key: string): function

	---Get the options for a function.
	get_options: function(key: string): FunctionOpts|nil

	remove: function(key: string): nil

	---Safe call with full result object.
	safecall: function(key: string, ...: any): FunctionCallResult

	set: function(key: string, value: function, options: FunctionOpts|nil): function
end

local record State --Listeners.State: Listeners.InternalState
	counters:  Counters
	data:      Data
	flags:     Flags
	functions: Functions
end

local record Listeners
	state: State

	config: function(event_listeners: EventListeners, opts: ListenersOpts): nil
end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
