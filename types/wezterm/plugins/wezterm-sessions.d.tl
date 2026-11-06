local _tmp = require("_tmp")

local record WeztermSessionsOpts
	auto_save_interval_s: integer | nil
	git_branch_warn: boolean | nil
end

local record WeztermSessions

	apply_to_config: function(config: _tmp.Config, user_config: WeztermSessionsOpts|nil): nil   ---Sets default keybindings.

	delete_state: function(window:_records.Window, pane: _tmp.Pane): nil   ---Allows to select which workspace to delete.

	edit_state: function(window:_records.Window, pane: _tmp.Pane): nil   ---Allows to select which workspace state to edit in favourite editor.

	fork_state: function(window:_records.Window, pane: _tmp.Pane): nil   ---Forks the current session into a new one.

	load_state: function(window:_records.Window, pane: _tmp.Pane): nil   ---Allows to select which workspace to load or which tab to restore.

	restore_state: function(window:_records.Window): nil   ---Loads the saved json file matching the current workspace.

	save_state: function(window:_records.Window, notify: boolean): nil   ---Orchestrator function to save the current workspace state. Collects workspace data, saves it to a JSON file, and displays a notification.

	start_autosave: function(window:_records.Window): nil   ---Start autosave.

	stop_autosave: function(window:_records.Window): nil   ---Stop autosave.

	toggle_autosave: function(window:_records.Window): nil   ---Toggle autosave.
end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
