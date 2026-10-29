---@diagnostic disable:unused-local

---Orientation enum for panes.
local type Orientation =
	"horizontal"|"unknown"|"vertical"

local type LoggerLevel =
	"debug"|"error"|"info"|"warn"
local type LibWezterm.Env.Separator =
	"/"|"\\"

---Process information returned from `get_pane_process()`.
local record LibWeztermProcessInfo
	---Process arguments (if available).
	args: {string}
	---Current working directory if available.
	cwd: string
	---Whether this appears to be a shell process.
	is_shell: boolean
	---The process name.
	name: string
	---Process ID if available.
	pid: integer | nil
end

local record LibWezterm.Table
local T = {}

---Deep copy.
---@generic T
function T.deepcopy(original: T<table>): T<table>

---shallow copy.
---@generic T
function T.shallowcopy(original: T<table>): T<table>

-- extend table
---@param behavior Behavior
---@param ... table
function T.tbl_deep_extend(behavior, ...): table|nil|? | nil

local record LibWezterm.FileIO
local F = {}

---Create the folder if it does not exist.
---@param path string
---@return boolean|nil|? success
function F.ensure_folder_exists(path): number|nil|? | nil

---Execute a cmd and return its stdout.
---@param cmd string command
---@return boolean success result
function F.execute(cmd): string|nil|? | nil

---Read a file and return its content.
---@param file_path string full filename
---@return boolean success result
function F.read_file(file_path): string|nil|? | nil

---Write a file with the content of a string.
---@param file_path string full filename
---@param str string content to write
---@return boolean success result
function F.write_file(file_path, str): string|nil|? | nil

local record LibWezterm.Math

local record LibWezterm.String
local S = {}

---Generate a hash from an array by concatenating elements with commas
---then applying the DJB2 hashing algorithm.
--
---@generic T
function S.array_hash(arr: {T} Array of values to hash): string

---Get basename for dir/file.
function S.basename(str: string string with the dir/file): string|nil|? | nil

---WezTerm module name decoder.
function S.decode_wezterm_dir(encoded: string): string

---Compute a hash key from a string using the DJB2 algorithm (Dan Bernstein).
---The DJB2 is a simple and fast non-cryptographic hash function.
---Formula: `hash = ((hash << 5) + hash) + c = hash * 33 + c`
---Starting value `5381` is a prime number chosen by Dan Bernstein for the algorithm.
function S.hash(str: string Input string to hash): string

---Helper function to normalize path separator to `/`.
function S.norm_path(str: string string with path): string

---Replace the center of a string with another string.
---@param str string String to be modified
function S.replace_center(len: integer Length to be removed from the middle of str, len, pad: string String that must be inserted in place of the missing part of str): string

---Helper function to remove formatting esc sequences in the string.
function S.strip_format_esc_seq(str: string Input string that may contain ANSI escape sequences): string

---Returns the length of a UTF-8 string, correctly counting multi-byte characters.
function S.utf8len(str: string UTF-8 encoded string): integer

local record LibWezterm.Wezterm
local W = {}

---Capture scrollback buffer from a pane.
---@param pane Pane WezTerm pane object
---@param max_lines? integer Maximum number of lines to capture (`nil` for all available)
function W.capture_scrollback(pane, max_lines): string|nil|? | nil

---Get current working directory from a pane.
function W.get_cwd(pane: Pane WezTerm pane object): string

---Determines the process running in a pane.
---@param pane Pane WezTerm pane object
---@param shell_list? {string} Optional list of shell names to check against
function W.get_pane_process(pane, shell_list): LibWeztermProcessInfo

---Determines if two panes are adjacent and their split orientation.
---@param pane1 Pane WezTerm pane object
---@param pane2 Pane WezTerm pane object
---@return boolean is_adjacent
function W.get_panes_orientation(pane1, pane2): Orientation

local record LibWezterm.LoggerOpts
	debug_enabled: boolean
	prefix: string

---Logger module providing consistent logging with customizable prefix and debug level control.
local record LibWezterm.Logger
	---Whether debug messages should be displayed.
	debug_enabled: boolean
	---The prefix to prepend to all log messages.
	prefix: string
local L = {}

---Create a new logger instance.
function L.new(opts: LibWezterm.LoggerOpts): LibWezterm.Logger

---Log a debug message (only if debug is enabled).
---@param ... any
function L:debug(...) end

---Disable debug mode for this logger.
function L:disable_debug(): LibWezterm.Logger

---Enable debug mode for this logger.
function L:enable_debug(): LibWezterm.Logger

---Log an error message.
---@param ... any
function L:error(...) end

---Log an info message.
---@param ... any
function L:info(...) end

---Log a message at the specified level.
---@param level LoggerLevel
---@param ... any
function L:log(level, ...) end

---Set the prefix for this logger.
function L:set_prefix(prefix: string): LibWezterm.Logger

---Log a warning message.
---@param ... any
function L:warn(...) end

local record LibWezterm.Env
	home: string
	is_mac: boolean
	is_windows: boolean
	separator: LibWezterm.Env.Separator

local record LibWezterm
	env: LibWezterm.Env
	file_io: LibWezterm.FileIO
	logger: LibWezterm.Logger
	math: LibWezterm.Math
	string: LibWezterm.String
	table: LibWezterm.Table
	wezterm: LibWezterm.Wezterm

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
