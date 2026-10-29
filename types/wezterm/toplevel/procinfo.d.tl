local type WezTerm.ProcInfo Wezterm.ProcInfo

---The `wezterm.procinfo` module exposes functions that allow querying information about processes
---that are running on the local system.
local record Wezterm.ProcInfo
local M = {}

---Returns the current working directory for the specified process ID.
---This function may return `nil` if it was unable to return the info.
current_working_dir_for_pid: function(pid: integer): string|nil|? | nil

---Returns the path to the executable image for the specified process ID.
---This function may return `nil` if it was unable to return the info.
executable_path_for_pid: function(pid: integer): string|nil|? | nil

---Returns a `LocalProcessInfo` object for the specified process ID.
---This function may return `nil` if it was unable to return the info.
---See:
--- - [`LocalProcessInfo`](lua://LocalProcessInfo)
get_info_for_pid: function(pid: integer): LocalProcessInfo|nil|? | nil

---Returns the process ID for the current process.
pid: function(): integer

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
