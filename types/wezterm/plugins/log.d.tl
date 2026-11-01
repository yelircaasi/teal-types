local _tmp = require("_tmp")

local enum LogLevel
	"DEBUG"
	"INFO"
	"WARN"
	"ERROR"
end

-- local levels = { DEBUG = 0, INFO = 1, WARN = 2, ERROR = 3 }

local enum FileFormat
	"json"
	"text"
end

local record Levels
	levels: {LogLevel: integer}   ---Level constants.
	names:  {integer: string}     ---Map from numeric level to its name.

	---Normalize a log level from string or integer. If a string is provided (e.g., `"info"`), it is uppercased and mapped to its integer value. Returns `nil` for unrecognised level strings.
	normalize: function(level: string|integer): integer|nil
end

local record LogEvent
	datetime: string      ---Local timestamp formatted as `%Y-%m-%d %H:%M:%S%.3f`.
	level: integer        ---Log severity level.
	level_name: string    ---Human-readable name of the log level.
	message: string       ---Final formatted log message.
	raw_message: string   ---Original message string before formatting.
	tag: string           ---Identifier of the logger instance.
	timestamp: integer    ---UNIX timestamp in seconds.
end

local record Sinks
	default_enabled: boolean | nil   ---Prepend the default WezTerm sink to every logger.
end

local record LogConfig --Log.Config
	enabled:   boolean | nil               ---Whether logging is globally enabled.
	sinks:     Log     | Sinks | nil       ---Sink-related settings.
	threshold: string  | nil   | integer   ---Minimum log level.
end

local record ConfigModule

	-- ConfigModule.
	---Return the current configuration (read-only reference).
	get: function(): LogConfig

	---Override configuration values. Only keys present in the defaults are accepted; unknown keys are silently ignored. The `sinks` sub-table is merged one level deep.
	setup: function(overrides: table|nil): nil
end

local record FileOpts
	format: FileFormat | nil                          ---Output format. Defaults to `"json"`.
	formatter: nil | function(event: LogEvent): string   ---Custom formatter. When provided, it overrides `format`.
	path: string | nil                                ---Destination file path. Auto-resolved when omitted.
end

local record FileSink
	format: FileFormat                              ---Output format for written entries.
	formatter: nil|function(event: LogEvent): string   ---Custom formatter used for serialization.
	path: string                                    ---Resolved destination file path.

	---@overload function(event: LogEvent)

	serialize: function(self: FileSink, event: LogEvent): {boolean, string}        ---Serialize an event to the configured file format.
	append:    function(self: FileSink, payload: string): {boolean, string|nil} ---Append raw text to the sink file.
	write:     function(self: FileSink, event: LogEvent): nil                  ---Encode and append an event as a formatted line.
end

local record Json
	---@overload function(event: LogEvent)
	encode: function(value: any): string   ---Encode a Lua value to a JSON string.
	decode: function(payload: string): any ---Decode a JSON string back to a Lua value.
	write:  function(event: LogEvent): nil ---Emit an event as a single JSON line through WezTerm's logger.
end

local record MemoryOpts
	max_entries: integer | nil   ---Maximum stored entries. Oldest are evicted when full. `0` == unlimited. Defaults to `10000`.
end

local record MemorySink
	entries:     {LogEvent}   ---Stored log events.
	max_entries: integer       ---Maximum stored entries (`0` == unlimited).

	write:       function(self: MemorySink, event: LogEvent): nil ---Store event in memory. When `max_entries` is reached the oldest entry is discarded.
	clear:       function(self: MemorySink): nil                  ---Remove all stored log entries.
	get_entries: function(self: MemorySink): {LogEvent}           ---Return shallow copy of stored entries.
	count:       function(self: MemorySink): integer              ---Get number of entries in memory.
	to_string:   function(self: MemorySink): string               ---Stringify all entries into human-readable lines. Formats entries as `[LEVEL] Message`, separated by newlines.
end

local record Sinks
	json: Json                                          ---JSON encode/decode helpers and JSON sink.
	file:   function(opts:  FileOpts): FileSink          ---File sink constructor.
	memory: function(opts:  MemoryOpts|nil): MemorySink  ---Memory sink constructor.
	wz:     function(entry: LogEvent): any                 ---WezTerm native logging sink.
end

local type _LogSink = function(entry: LogEvent): any

---A lightweight wrapper around WezTerm logging facilities.
---Logging is globally gated by `Log.Config.enabled`.
---When set to `false`, all logger instances are silenced.
local record   Log
	enabled:   boolean    ---Whether this logger instance is currently enabled.
	sinks:     {_LogSink} ---List of active sinks.
	tag:       string     ---Printable name prefix included in each log line.
	threshold: integer    ---Minimum level required for logs to be emitted.

	---Create new logger instance.
	---If `config.sinks.default_enabled` is true, the default sink is prepended
	---to the list. The provided `sinks` array is shallow-copied and never mutated.
	---@param tag? string Identifier printed in brackets before message. Defaults to `"Log"`.
	---@param enabled? boolean Enable logging status. Defaults to `true`.
	---@param sinks? {} List of sinks to output to.
	new: function(tag: string|nil, enabled: boolean|nil, sinks: {_LogSink}|nil): Log

	---Add sink to the sinks table.
	add_sink: function(self: Log, sink: function(entry: LogEvent): any): nil

	---Log message with specified log level.
	---Accepts simple string or format string. Non-string arguments are stringified
	---(userdata via `tostring()`, others via pretty-printing when available).
	log: function(self: Log, level: string|integer, message: string, ...: any): nil

	---Log debug level message.
	---Prepends `"DEBUG: "` to the message string.
	debug: function(self: Log, message: string, ...: any): nil

	---Log information level message.
	---@param ... any Additional arguments to format into message.
	info: function(self: Log, message: string, ...: any): nil

	---Log warning level message.
	warn: function(self: Log, message: string, ...: any): nil

	---Log error level message.
	error: function(self: Log, message: string, ...: any): nil
end

local record API --Log.API: Log
	config: ConfigModule   ---Configuration module.
	levels: Levels         ---Level constants and normalisation.
	sinks:  Sinks          ---Lazy-loaded sink registry.

	---Override default config values.
	setup: function(overrides: table|nil): nil
end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
