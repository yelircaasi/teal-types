---@diagnostic disable:unused-local

local enum LocalProcessStatus =
	"Dead"
	"Idle"
	"LockBlocked"
	"Parked"
	"Run"
	"Sleep"
	"Stop"
	"Tracing"
	"Unknown"
	"Wakekill"
	"Waking"
	"Zombie"
end

---Represents a process running on the local machine.
local record LocalProcessInfo
	---A table holding the argument array for the process.
	argv: {string}
	---A table keyed by child process id and whose values are themselves.
	---`LocalProcessInfo` objects that describe the child processes.
	children: {LocalProcessInfo}
	---The current working directory for the process (may be empty).
	cwd: string
	---the full path to the executable image for the process (may be empty).
	executable: string
	---A short name for the process.
	---Due to platform limitations, this may be inaccurate and/or truncated;
	---you should look at the `executable` or `argv` fields instead of this one.
	name: string
	---The process identifier (`PID`).
	pid: integer
	---The parent process identifier.
	ppid: integer
	---A string holding the status of the process.
	---Possible values are:
	--- - `"Idle"`
	--- - `"Run"`
	--- - `"Sleep"`
	--- - `"Stop"`
	--- - `"Zombie"`
	--- - `"Tracing"`
	--- - `"Dead"`
	--- - `"Wakekill"`
	--- - `"Waking"`
	--- - `"Parked"`
	--- - `"LockBlocked"`
	--- - `"Unknown"`
	status: LocalProcessStatus

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
