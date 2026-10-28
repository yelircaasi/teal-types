local type WezTerm.Gui Wezterm.Gui
local type Wezterm.GUI Wezterm.Gui
local type WezTerm.GUI Wezterm.Gui

---The `wezterm.gui` module exposes functions that operate on the GUI layer.
---The multiplexer may not be connected to a GUI, so attempting to
---resolve this module from the mux server will return `nil`.
---You will typically use something like:
---```lua
---local wezterm = require 'wezterm'
---local gui = wezterm.gui
---if gui then
---  -- do something that depends on the GUI layer
---end
---````
local record Wezterm.Gui
local M = {}

---Returns a table holding the effective default set of `key_tables`.
---That is the set of keys that is used as a base
---if there was no configuration file.
---This is useful in cases where you want to override a
---key table assignment without replacing the entire set
---of key tables.
---This example shows how to add a key assignment for `Backspace`
---to `copy_mode`, without having to manually specify
---the entire key table:
---```lua
---local wezterm = require 'wezterm'
---local act = wezterm.action
---local copy_mode = nil
---if wezterm.gui then
---  copy_mode = wezterm.gui.default_key_tables().copy_mode
---  table.insert(
---    copy_mode,
---    { key = 'Backspace', mods = 'NONE', action = act.CopyMode 'MoveLeft' }
---  )
---end
---return {
---  key_tables = {
---    copy_mode = copy_mode,
---  },
---}
---```
function M.default_key_tables(): Key[]|{

---Returns a table holding the effective default values
---for key assignments.
---That is the set of keys that is used as a base
---if there was no configuration file.
function M.default_keys(): Key[]

---Returns the list of available GPUs supported by WebGpu.
---[`config.webgpu_preferred_adapter`](lua://Config.webgpu_preferred_adapter)
---is useful in conjunction with this function.
function M.enumerate_gpus(): GpuInfo[]

---This function returns the appearance of the window environment.
---The appearance can be one of the following 4 values:
--- - `"Dark"`: Dark mode with predominantly dark colors
--- - `"Light"`: The normal appearance, with dark text on a light background
---            lower contrasting, text color on a dark background
--- - `"DarkHighContrast"`: Dark mode but with high contrast colors
---                       (not reported on all systems)
--- - `"LightHighContrast"`: Light mode but with high contrast colors
---                        (not reported on all systems)
---WezTerm is able to detect when the appearance has changed and
---will reload the configuration when that happens.
function M.get_appearance(): "Dark"|"DarkHighContrast"|"Light"|"LightHighContrast"

---Attempts to resolve a mux window to its corresponding GUI Window.
---This may not succeed for a couple of reasons:
--- - If called by the multiplexer daemon, there is no GUI,
---   so this will never succeed
--- - If the mux window is part of a workspace that is not
---   the active workspace
function M.gui_window_for_mux_window(window_id: integer): userdata

---Returns an array table listing all `GUI Window` objects
---in a stable/consistent order.
function M.gui_windows(): Window[]

---Returns information about the screens connected to the system.
function M.screens(): GuiScreensInfo

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
