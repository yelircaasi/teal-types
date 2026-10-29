local record WezTmuxAction
	ClearPattern: "ClearPattern"|fun(params: any): { ClearPattern: any }
	ClearSelectionOrClearPatternOrClose: "ClearSelectionOrClearPatternOrClose"|fun(params: any): { ClearSelectionOrClearPatternOrClose: any }
	MovePaneToNewTab: "MovePaneToNewTab"|fun(params: any): { MovePaneToNewTab: any }
	NextMatch: "NextMatch"|fun(params: any): { NextMatch: any }
	PriorMatch: "PriorMatch"|fun(params: any): { PriorMatch: any }
	RenameCurrentTab: "RenameCurrent"|fun(params: any): { RenameCurrent: any }
	RenameWorkspace: "RenameWorkspace"|fun(params: any): { RenameWorkspace: any }
	SearchBackward: "SearchBackward"|fun(params: any): { SearchBackward: any }
	SearchForward: "SearchForward"|fun(params: any): { SearchForward: any }
	WorkspaceSelect: "WorkspaceSelect"|fun(params: any): { WorkspaceSelect: any }

local record WezTmuxOpts
	tab_and_split_indices_are_zero_based: boolean | nil
end

local record WezTmux
	action: WezTmuxAction
	apply_to_config: function(config: Config, opts: WezTmuxOpts|nil) end
end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
