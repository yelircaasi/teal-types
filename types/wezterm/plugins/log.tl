---@diagnostic disable:unused-local

---@enum Log.Levels.Level
local levels = { DEBUG = 0, INFO = 1, WARN = 2, ERROR = 3 }

local type Log.Sinks.FileFormat =
	"json"|"text"

local record Log.Levels
	---Level constants.
	levels: Log.Levels.Level
	---Map from numeric level to its name.
	names: table<integer, string>
local Levels = {}

---Normalize a log level from string or integer.
---If a string is provided (e.g., `"info"`), it is uppercased and mapped to its
---integer value. Returns `nil` for unrecognised level strings.
function Levels.normalize(level: Log.Levels.Level|string|integer Level representation to normalize.): integer|nil|? | nil

local record Log.Event
	---Local timestamp formatted as `%Y-%m-%d %H:%M:%S%.3f`.
	datetime: string
	---Log severity level.
	level: integer
	---Human-readable name of the log level.
	level_name: string
	---Final formatted log message.
	message: string
	---Original message string before formatting.
	raw_message: string
	---Identifier of the logger instance.
	tag: string
	---UNIX timestamp in seconds.
	timestamp: integer
end

local record Log.Config.Sinks
	---Prepend the default WezTerm sink to every logger.
	default_enabled: boolean | nil
end

local record Log.Config
	---Whether logging is globally enabled.
	enabled: boolean | nil
	---Sink-related settings.
	sinks: Log |Config.Sinks | nil
	---Minimum log level.
	threshold: string | nil|integer
end

local record Log.ConfigModule
local ConfigModule = {}

---Return the current configuration (read-only reference).
function ConfigModule.get(): Log.Config

---Override configuration values.
---Only keys present in the defaults are accepted; unknown keys are silently
---ignored. The `sinks` sub-table is merged one level deep.
---@param overrides? table Partial config to merge.
function ConfigModule.setup(overrides) end

local record Log.Sinks.FileOpts
	---Output format.
	---Defaults to `"json"`.
	format: Log |Sinks.FileFormat | nil
	---Custom formatter. When provided, it overrides `format`.
	formatter: fun | nil(event: Log.Event): string
	---Destination file path. Auto-resolved when omitted.
	path: string | nil
end

local record Log.Sinks.FileSink
	---Output format for written entries.
	format: Log.Sinks.FileFormat
	---Custom formatter used for serialization.
	formatter: nil|fun(event: Log.Event): string
	---Resolved destination file path.
	path: string
---@overload fun(event: Log.Event)
local FileSink = {}

---Serialize an event to the configured file format.
---@param event Log.Event
---@return boolean ok
function FileSink:serialize(event): string

---Append raw text to the sink file.
---@param payload string
---@return boolean ok
function FileSink:append(payload): string|nil|? | nil

---Encode and append an event as a formatted line.
function FileSink:write(event: Log.Event): nil

local record Log.Sinks.Json
---@overload fun(event: Log.Event)
local Json = {}

---Encode a Lua value to a JSON string.
function Json.encode(value: any): string

---Decode a JSON string back to a Lua value.
function Json.decode(payload: string): any

---Emit an event as a single JSON line through WezTerm's logger.
function Json.write(event: Log.Event): nil

local record Log.Sinks.MemoryOpts
	---Maximum stored entries.
	---Oldest are evicted when full. `0` == unlimited.
	---Defaults to `10000`.
	max_entries: integer | nil
end

local record Log.Sinks.MemorySink
	---Stored log events.
	entries: Log.{Event}
	---Maximum stored entries (`0` == unlimited).
	max_entries: integer
---@overload fun(event: Log.Event)
local MemorySink = {}

---Store event in memory.
---When `max_entries` is reached the oldest entry is discarded.
function MemorySink:write(event: Log.Event Log event to store.): nil

---Remove all stored log entries.
function MemorySink:clear(): nil

---Return shallow copy of stored entries.
function MemorySink:get_entries(): Log.{Event}

---Get number of entries in memory.
function MemorySink:count(): integer

---Stringify all entries into human-readable lines.
---Formats entries as `[LEVEL] Message`, separated by newlines.
function MemorySink:to_string(): string

local record Log.Sinks
	---JSON encode/decode helpers and JSON sink.
	json: Log.Sinks.Json
local Sinks = {}

---File sink constructor.
---@param opts? Log.Sinks.FileOpts
function Sinks.file(opts): Log.Sinks.FileSink

---Memory sink constructor.
---@param opts? Log.Sinks.MemoryOpts
function Sinks.memory(opts): Log.Sinks.MemorySink

---WezTerm native logging sink.
function Sinks.wz(entry: Log.Event): any

---A lightweight wrapper around WezTerm logging facilities.
---Logging is globally gated by `Log.Config.enabled`.
---When set to `false`, all logger instances are silenced.
local record Log
	---Whether this logger instance is currently enabled.
	enabled: boolean
	---List of active sinks.
	sinks: (fun(entry: Log.Event): any)[]
	---Printable name prefix included in each log line.
	tag: string
	---Minimum level required for logs to be emitted.
	threshold: integer
local Log = {}

---Create new logger instance.
---If `config.sinks.default_enabled` is true, the default sink is prepended
---to the list. The provided `sinks` array is shallow-copied and never mutated.
---@param tag? string Identifier printed in brackets before message. Defaults to `"Log"`.
---@param enabled? boolean Enable logging status. Defaults to `true`.
---@param sinks? (fun(entry: Log.Event): any)[] List of sinks to output to.
function Log.new(tag, enabled, sinks): Log

---Add sink to the sinks table.
function Log:add_sink(sink: fun(entry: Log.Event): any Function to handle log entry.): nil

---Log message with specified log level.
---Accepts simple string or format string. Non-string arguments are stringified
---(userdata via `tostring()`, others via pretty-printing when available).
---@param level Log.Levels.Level|string|integer Severity level.
---@param message string Log message or format string.
---@param ... any Additional arguments to format into message.
function Log:log(level, message, ...) end

---Log debug level message.
---Prepends `"DEBUG: "` to the message string.
---@param message string Log message or format string.
---@param ... any Additional arguments to format into message.
function Log:debug(message, ...) end

---Log information level message.
---@param message string Log message or format string.
---@param ... any Additional arguments to format into message.
function Log:info(message, ...) end

---Log warning level message.
---@param message string Log message or format string.
---@param ... any Additional arguments to format into message.
function Log:warn(message, ...) end

---Log error level message.
---@param message string Log message or format string.
---@param ... any Additional arguments to format into message.
function Log:error(message, ...) end

local record Log.API: Log
	---Configuration module.
	config: Log.ConfigModule
	---Level constants and normalisation.
	levels: Log.Levels
	---Lazy-loaded sink registry.
	sinks: Log.Sinks
local Api = {}

---Override default config values.
---@param overrides? table
function Api.setup(overrides) end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
