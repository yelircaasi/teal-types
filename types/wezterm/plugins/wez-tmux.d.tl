local _tmp = require("_tmp")

local enum _ClearPattern
    "ClearPattern"
end
local enum _ClearSelectionOrClearPatternOrClose
	"ClearSelectionOrClearPatternOrClose"
end
local enum _MovePaneToNewTab
	"MovePaneToNewTab"
end
local enum _NextMatch
	"NextMatch"
end
local enum _PriorMatch
	"PriorMatch"
end
local enum _RenameCurrent
	"RenameCurrent"
end
local enum _RenameWorkspace
	"RenameWorkspace"
end
local enum _SearchBackward
	"SearchBackward"
end
local enum _SearchForward
	"SearchForward"
end
local enum _SearchForward
	"SearchForward"
end

local enum _WorkspaceSelect
	"WorkspaceSelect"
end

local record WezTmuxAction
	ClearPattern:     _ClearPattern     | function(params: any): { _ClearPattern: any }
	ClearSelectionOrClearPatternOrClose: _ClearSelectionOrClearPatternOrClose | function(params: any): { _ClearSelectionOrClearPatternOrClose: any }
	MovePaneToNewTab: _MovePaneToNewTab | function(params: any): { _MovePaneToNewTab: any }
	NextMatch:        _NextMatch        | function(params: any): { _NextMatch: any }
	PriorMatch:       _PriorMatch       | function(params: any): { _PriorMatch: any }
	RenameCurrentTab: _RenameCurrent    | function(params: any): { _RenameCurrent: any }
	RenameWorkspace:  _RenameWorkspace  | function(params: any): { _RenameWorkspace: any }
	SearchBackward:   _SearchBackward   | function(params: any): { _SearchBackward: any }
	SearchForward:    _SearchForward    | function(params: any): { _SearchForward: any }
	WorkspaceSelect:  _WorkspaceSelect  | function(params: any): { _WorkspaceSelect: any }
end

local record WezTmuxOpts
	tab_and_split_indices_are_zero_based: boolean | nil
end

local record WezTmux
	action:          WezTmuxAction
	apply_to_config: function(config: _tmp.Config, opts: WezTmuxOpts|nil): nil
end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
