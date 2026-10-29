---@diagnostic disable:unused-local

local record CmdSenderOpts
	description: string | nil
	key: string | nil
	mods: string | nil
end

local record CmdSender
local M = {}

---@param config Config
---@param opts? CmdSenderOpts
apply_to_config: function(config, opts) end

---Send command to panes.
send_cmd_to_panes: function(cmd: string, panes: {Pane}): nil

---Send command to tab's panes.
send_cmd_to_tab_panes: function(cmd: string, tab: MuxTab): nil


send_cmd_to_tab_panes_action: function(): {

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
