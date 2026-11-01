local _tmp = require("_tmp")

local record CmdSenderOpts
	description: string | nil
	key:         string | nil
	mods:        string | nil
end

local record _Action
	EmitEvent: string
end

local record CmdSender

	---@param opts? CmdSenderOpts
	apply_to_config: function(config: _tmp.Config, opts: CmdSenderOpts|nil): nil

	send_cmd_to_panes: function(cmd: string, panes: {_tmp.Pane}): nil     ---Send command to panes.

	send_cmd_to_tab_panes: function(cmd: string, tab: _tmp.MuxTab): nil   ---Send command to tab's panes.


	send_cmd_to_tab_panes_action: function(): _Action
end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
