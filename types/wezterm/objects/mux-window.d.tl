local record MuxWindow.TabInfo
	---The 0-based tab index.
	index: integer
	---A `boolean` indicating whether this is the active tab within the window.
	is_active: boolean
	---A `MuxTab` object.
	tab: MuxTab

local record SpawnTab
	---Specifies the argument array for the command that should be spawned.
	---If omitted the default program for the domain will be spawned.
	args: string | nil[]
	---Specifies the current working directory that should be used for the program.
	---If unspecified, it'll follow the spec from `config.default_cwd`.
	---See:
	--- - [`config.default_cwd`](lua://Config.default_cwd)
	cwd: string | nil
	---Specifies the multiplexer domain into which the program should be spawned.
	---The default value is assumed to be `"CurrentPaneDomain"`, which causes the domain
	---from the currently active pane to be used.
	domain: SpawnTabDomain | nil|{ DomainName: string }
	---Sets additional environment variables in the environment for this command invocation.
	set_environment_variables: table | nil<string, any>

---`MuxWindow` represents a window that is managed by the multiplexer.
local record MuxWindow
local M = {}

---A convenience accessor for returning the active pane in the active tab of the window.
---See:
--- - [`Pane`](lua://Pane)
function M:active_pane(): Pane

---A convenience accessor for returning the active tab within the window.
function M:active_tab(): MuxTab

---Returns the window title as set by `OSC 0`, `OSC 2` in a contained pane, or through
---`MuxWindow:set_title()`.
---See:
--- - [`MuxWindow:set_title()`](lua://MuxWindow.set_title)
function M:get_title(): string

---Returns the name of the workspace to which the window belongs.
function M:get_workspace(): nil

---Attempts to resolve this mux window to its corresponding _"GUI Window"_.
---This may not succeed for a couple of reasons:
--- - If called by the multiplexer daemon, there is no GUI, so this will never succeed
--- - If the mux window is part of a workspace that is not the active one
---This method is the inverse of `Window:mux_window()`.
---See:
--- - [`Window:mux_window()`](lua://Window.mux_window)
function M:gui_window(): Window

---Sets the window title to the provided string.
---Note that applications may subsequently change the title via escape sequences.
function M:set_title(title: string): nil

---Changes the name of the workspace to which the window belongs to.
function M:set_workspace(name: string): nil

---Spawns a program into a new tab within this window, returning the `MuxTab`, `Pane`
---and `MuxWindow` objects associated with it.
---When no arguments are passed, the default program is spawned.
---See:
--- - [`MuxTab`](lua://MuxTab)
--- - [`MuxWindow`](lua://MuxWindow)
--- - [`Pane`](lua://Pane)
---@return MuxTab tab
---@return Pane pane
function M:spawn_tab(): MuxWindow

---Spawns a program into a new tab within this window, returning the `MuxTab`, `Pane`
---and `MuxWindow` objects associated with it.
---When no arguments are passed, the default program is spawned.
---See:
--- - [`MuxTab`](lua://MuxTab)
--- - [`MuxWindow`](lua://MuxWindow)
--- - [`Pane`](lua://Pane)
---@param args? SpawnTab
---@return MuxTab tab
---@return Pane pane
function M:spawn_tab(args): MuxWindow

---Returns an array table holding each of the `MuxTab` objects contained within this window.
function M:tabs(): MuxTab[]

---Returns an array table holding an extended info entry for each of the tabs contained
---within this window.
function M:tabs_with_info(): MuxWindow.TabInfo[]

---Returns the window multiplexer ID.
function M:window_id(): integer

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
