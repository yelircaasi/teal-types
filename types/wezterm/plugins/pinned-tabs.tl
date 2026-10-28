---@diagnostic disable:unused-local

local record PinnedTabsCreateOpts
	args: string | nil[]
	cwd: string | nil
	name: string | nil
	program: string | nil
end

local record PinnedTabsKey: Key
	tab: PinnedTabsCreateOpts | nil
end

local record PinnedTabsOpts
	---Instead of WezTerm startup, you can do the cleanup on config reload.
	create: boolean | nil
	---You don't want any debug logs (errors will still be logged).
	debug: boolean | nil
	keys: PinnedTabsKey | nil[]
end

local record PinnedTabs
local M = {}

---@param config Config
---@param opts? PinnedTabsOpts
function M.apply_to_config(config, opts) end

---Clean up stale state files.
function M.cleanup(): nil

---Creates a pinned tab.
---Use this to configure the keybindings in your `wezterm.lua`.
function M.create(opts: PinnedTabsCreateOpts): nil

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
