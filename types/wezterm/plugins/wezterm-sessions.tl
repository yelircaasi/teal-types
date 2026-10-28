---@diagnostic disable:unused-local

local record WeztermSessionsOpts
	auto_save_interval_s: integer | nil
	git_branch_warn: boolean | nil
end

local record WeztermSessions
local M = {}

---Sets default keybindings.
---@param config Config
---@param user_config? WeztermSessionsOpts
function M.apply_to_config(config, user_config) end

---Allows to select which workspace to delete.
function M.delete_state(window: Window, pane: Pane): nil

---Allows to select which workspace state to edit in favourite editor.
function M.edit_state(window: Window, pane: Pane): nil

---Forks the current session into a new one.
function M.fork_state(window: Window, pane: Pane): nil

---Allows to select which workspace to load or which tab to restore.
function M.load_state(window: Window, pane: Pane): nil

---Loads the saved json file matching the current workspace.
function M.restore_state(window: Window): nil

---Orchestrator function to save the current workspace state.
---Collects workspace data, saves it to a JSON file, and displays a notification.
function M.save_state(window: Window, notify: boolean): nil

---Start autosave.
function M.start_autosave(window: Window): nil

---Stop autosave.
function M.stop_autosave(window: Window): nil

---Toggle autosave.
function M.toggle_autosave(window: Window): nil

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
