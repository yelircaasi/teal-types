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
function M.apply_to_config(config, opts) end

---Send command to panes.
function M.send_cmd_to_panes(cmd: string, panes: Pane[]): nil

---Send command to tab's panes.
function M.send_cmd_to_tab_panes(cmd: string, tab: MuxTab): nil


function M.send_cmd_to_tab_panes_action(): {

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
