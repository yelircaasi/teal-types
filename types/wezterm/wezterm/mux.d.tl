local type WezTerm.Mux Wezterm.Mux

---The `wezterm.mux` module exposes functions that operate on the multiplexer layer.
---The multiplexer manages the set of running programs into panes, tabs, windows and workspaces.
---The multiplexer may not be connected to a GUI so certain operations that require a running
---Window management system are not present in the interface exposed by this module.
---You will typically use something like:
---```lua
---local wezterm = require("wezterm")
---local mux = wezterm.mux
---```
---at the top of your configuration file to access it.
--- ---
---## Important Note
---You should avoid using, at the file scope in your config, mux functions that cause new splits,
---tabs or windows to be created. The configuration file can be evaluated multiple times
---in various contexts.
---If you want to spawn new programs when WezTerm starts up, look at the [`gui-startup`](https://wezterm.org/config/lua/gui-events/gui-startup.html)
---and [`mux-startup`](https://wezterm.org/config/lua/mux-events/mux-startup.html) events.
local record Wezterm.Mux
local M = {}

---Returns an array table holding all of the known`MuxDomain` objects.
---See:
--- - [`MuxDomain`](lua://MuxDomain)
function M.all_domains(): MuxDomain[]

---Returns an array table holding all of the known `MuxWindow` objects.
---See:
--- - [`MuxWindow`](lua://MuxWindow)
function M.all_windows(): MuxWindow[]

---Returns the name of the active workspace.
function M.get_active_workspace(): string

---Resolves `name_or_id` to a domain and returns a `MuxDomain` object representation of it.
---`name_or_id` can be:
--- - A domain name string to resolve the domain by name
--- - A domain id to resolve the domain by id
--- - `nil` or omitted to return the current default domain
---> Other lua types will generate a lua error
---If the name or id don't map to a valid domain, this function will return `nil`.
---See:
--- - [`MuxDomain`](lua://MuxDomain)
function M.get_domain(): MuxDomain|nil|?

---Resolves `name_or_id` to a domain and returns a `MuxDomain` object representation of it.
---`name_or_id` can be:
--- - A domain name string to resolve the domain by name
--- - A domain id to resolve the domain by id
--- - `nil` or omitted to return the current default domain
---> Other Lua types will generate a Lua error
---If the name or id don't map to a valid domain, this function will return `nil`.
---See:
--- - [`MuxDomain`](lua://MuxDomain)
---@param name_or_id? string|integer
function M.get_domain(name_or_id): MuxDomain|nil|? | nil

---Given a pane ID, verifies that it is a valid pane known to the mux and returns a `Pane` object
---that can be used to operate on the pane.
---This is useful for situations where you have obtained a pane id from some other source and
---want to use the various `Pane` methods with it.
---See:
--- - [`Pane`](lua://Pane)
function M.get_pane(pane_id: integer): Pane

---Given a tab ID, verifies that it is a valid tab known to the mux and returns a `MuxTab` object
---that can be used to operate on the tab.
---This is useful for situations where you have obtained a tab ID from some other source and want to
---use the various `MuxTab` methods with it.
---See:
--- - [`MuxTab`](lua://MuxTab)
function M.get_tab(tab_id: integer): MuxTab

---Given a window ID, verifies that it is a valid window known to the mux and returns a
---`MuxWindow` object that can be used to operate on the window.
---This is useful for situations where you have obtained a window ID from some other source and
---want to use the various `MuxWindow` methods with it.
---See:
--- - [`MuxWindow`](lua://MuxWindow)
function M.get_window(id: integer): MuxWindow

---Returns a table containing the names of the workspaces known to the mux.
function M.get_workspace_names(): string[]

---Renames the workspace `old` to `new`.
---```lua
---local wezterm = require("wezterm")
---local active = wezterm.mux.get_active_workspace()
---wezterm.mux.rename_workspace(active,'something different')
---```
function M.rename_workspace(old: string, new: string): nil

---Sets the active workspace name.
---If the requested name doesn't correspond to an existing workspace, then an error is raised.
function M.set_active_workspace(workspace: string): nil

---Assign a new default domain in the mux.
---The domain that you assign here will override any configured value of `config.default_domain` or
---the implicit assignment of the default domain that may have happened as a result of
---starting WezTerm via `wezterm connect` or `wezterm serial`.
---See:
--- - [`config.default_domain`](lua://Config.default_domain)
function M.set_default_domain(domain: MuxDomain): nil

---Spawns a program into a new window, returning the associated objects:
---1. [`MuxTab`](lua://MuxTab)
---2. [`Pane`](lua://Pane)
---3. [`MuxWindow`](lua://MuxWindow)
---```lua
---local tab, pane, window = wezterm.mux.spawn_window {}
---```
---When no arguments are passed, the default program is spawned.
---For the parameter fields, see:
--- - [`SpawnCommand`](lua://SpawnCommand)
---@return MuxTab tab
---@return Pane pane
function M.spawn_window(): MuxWindow

---Spawns a program into a new window, returning the associated objects:
---1. [`MuxTab`](lua://MuxTab)
---2. [`Pane`](lua://Pane)
---3. [`MuxWindow`](lua://MuxWindow)
---```lua
---local tab, pane, window = wezterm.mux.spawn_window {}
---```
---When no arguments are passed, the default program is spawned.
---For the parameter fields, see:
--- - [`SpawnCommand`](lua://SpawnCommand)
---@param T? SpawnCommand
---@return MuxTab tab
---@return Pane pane
function M.spawn_window(T): MuxWindow

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
