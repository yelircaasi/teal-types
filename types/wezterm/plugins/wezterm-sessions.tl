local record WeztermSessionsOpts
	auto_save_interval_s: integer | nil
	git_branch_warn: boolean | nil
end

local record WeztermSessions

	---Sets default keybindings.
	apply_to_config: function(config: Config, user_config: WeztermSessionsOpts|nil) end

	---Allows to select which workspace to delete.
	delete_state: function(window: Window, pane: Pane): nil

	---Allows to select which workspace state to edit in favourite editor.
	edit_state: function(window: Window, pane: Pane): nil

	---Forks the current session into a new one.
	fork_state: function(window: Window, pane: Pane): nil

	---Allows to select which workspace to load or which tab to restore.
	load_state: function(window: Window, pane: Pane): nil

	---Loads the saved json file matching the current workspace.
	restore_state: function(window: Window): nil

	---Orchestrator function to save the current workspace state.
	---Collects workspace data, saves it to a JSON file, and displays a notification.
	save_state: function(window: Window, notify: boolean): nil

	---Start autosave.
	start_autosave: function(window: Window): nil

	---Stop autosave.
	stop_autosave: function(window: Window): nil

	---Toggle autosave.
	toggle_autosave: function(window: Window): nil
end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
