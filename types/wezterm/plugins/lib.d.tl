local _tmp = require("_tmp")

---Orientation enum for panes.
local enum Orientation
	"horizontal"
	"unknown"
	"vertical"
end

local enum LoggerLevel
	"debug"
	"error"
	"info"
	"warn"
end

local enum Separator
	"/"
	"\\"
end

---Process information returned from `get_pane_process()`.
local record LibWeztermProcessInfo
	args: {string}   ---Process arguments (if available).
	cwd: string   ---Current working directory if available.
	is_shell: boolean   ---Whether this appears to be a shell process.
	name: string   ---The process name.
	pid: integer | nil   ---Process ID if available.
end

local record Table --LibWezterm.Table

	---Deep copy.
	deepcopy: function(original: table): table

	---shallow copy.
	shallowcopy: function(original: table): table

	-- extend table
	tbl_deep_extend: function(behavior: _tmp.Behavior, ...: table): table|nil
end

local record FileIO --LibWezterm.FileIO

	---Create the folder if it does not exist.
	---@return boolean|nil|? success
	ensure_folder_exists: function(path: string): number|nil

	---Execute a cmd and return its stdout.
	---@return boolean success result
	execute: function(cmd: string): string|nil

	---Read a file and return its content.
	---@return boolean success result
	read_file: function(file_path: string): string|nil

	---Write a file with the content of a string.
	---@return boolean success result
	write_file: function(file_path: string, str: string): string|nil
end

local record Math --LibWezterm.Math
end

local record String --LibWezterm.String

	---Generate a hash from an array by concatenating elements with commas
	---then applying the DJB2 hashing algorithm.
	--
	array_hash: function<T>(arr: {T}): string

	---Get basename for dir/file.
	basename: function(str: string): string|nil

	---WezTerm module name decoder.
	decode_wezterm_dir: function(encoded: string): string

	---Compute a hash key from a string using the DJB2 algorithm (Dan Bernstein).
	---The DJB2 is a simple and fast non-cryptographic hash function.
	---Formula: `hash = ((hash << 5) + hash) + c = hash * 33 + c`
	---Starting value `5381` is a prime number chosen by Dan Bernstein for the algorithm.
	hash: function(str: string): string

	---Helper function to normalize path separator to `/`.
	norm_path: function(str: string): string

	---Replace the center of a string with another string.
	replace_center: function(str: string, len: integer, pad: string): string

	---Helper function to remove formatting esc sequences in the string.
	strip_format_esc_seq: function(str: string): string

	---Returns the length of a UTF-8 string, correctly counting multi-byte characters.
	utf8len: function (str: string): integer
end

local record Wezterm --LibWezterm.Wezterm

	---Capture scrollback buffer from a pane.
	capture_scrollback: function(pane: _tmp.Pane, max_lines: integer|nil): string|nil

	---Get current working directory from a pane.
	get_cwd: function(pane: _tmp.Pane): string

	---Determines the process running in a pane.
	get_pane_process: function(pane: _tmp.Pane, shell_list: {string}|nil): LibWeztermProcessInfo

	---Determines if two panes are adjacent and their split orientation.
	---@return boolean is_adjacent
	get_panes_orientation: function(pane1: _tmp.Pane, pane2: _tmp.Pane): Orientation
end

local record LoggerOpts --LibWezterm.LoggerOpts
	debug_enabled: boolean
	prefix: string
end

---Logger module providing consistent logging with customizable prefix and debug level control.
local record Logger --LibWezterm.Logger
	debug_enabled: boolean   ---Whether debug messages should be displayed.
	prefix: string   ---The prefix to prepend to all log messages.

	---Create a new logger instance.
	new: function(opts: LoggerOpts): Logger

	---Log a debug message (only if debug is enabled).
	debug: function(self: Logger, ...: any): nil

	---Disable debug mode for this logger.
	disable_debug: function(self: Logger): Logger

	---Enable debug mode for this logger.
	enable_debug: function(self: Logger): Logger

	---Log an error message.
	error: function(self: Logger, ...: any): nil

	---Log an info message.
	info: function(self: Logger, ...: any): nil

	---Log a message at the specified level.
	log: function(self: Logger, level: LoggerLevel, ...: any): nil

	---Set the prefix for this logger.
	set_prefix: function(self: Logger, prefix: string): Logger

	---Log a warning message.
	---@param ... any
	warn: function(self: Logger, ...: any): nil
end

local record Env --LibWezterm.Env
	home: string
	is_mac: boolean
	is_windows: boolean
	separator: Separator
end

local record LibWezterm
	env:     Env
	file_io: FileIO
	logger:  Logger
	math:    Math
	string:  String
	table:   Table
	wezterm: Wezterm
end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
