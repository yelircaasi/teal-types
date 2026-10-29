


local enum CursorStyle
	"BlinkingBar"
	"BlinkingBlock"
	"BlinkingUnderline"
	"SteadyBar"
	"SteadyBlock"
	"SteadyUnderline"
end

local enum Direction
	"Down"
	"Left"
	"Next"
	"Prev"
	"Right"
	"Up"
end

local enum EasingFunction
	"Constant"
	"Ease"
	"EaseIn"
	"EaseInOut"
	"EaseOut"
	"Linear"
	{ CubicBezier: {number} }
end

local enum Stretch
	"Condensed"
	"Expanded"
	"ExtraCondensed"
	"ExtraExpanded"
	"Normal"
	"SemiCondensed"
	"SemiExpanded"
	"UltraCondensed"
	"UltraExpanded"
end

local enum Weight
	"Black"
	"Bold"
	"Book"
	"DemiBold"
	"DemiLight"
	"ExtraBlack"
	"ExtraBold"
	"ExtraLight"
	"Light"
	"Medium"
	"Regular"
	"Thin"
end

local enum StableCursorPosition.Shape
	"BlinkingBar"
	"BlinkingBlock"
	"BlinkingUnderline"
	"SteadyBar"
	"SteadyBlock"
	"SteadyUnderline"
end

local enum FreeTypeLoadFlags
	"DEFAUlT"
	"FORCE_AUTOHINT"
	"MONOCHROME"
	"NO_AUTOHINT"
	"NO_BITMAP"
	"NO_HINTING"
end

local enum FontWeight
	"Black"
	"Bold"
	"Book"
	"DemiBold"
	"DemiLight"
	"ExtraBlack"
	"ExtraBold"
	"ExtraLight"
	"Light"
	"Medium"
	"Regular"
	"Thin"
end

local enum FontStretch
	"Condensed"
	"Expanded"
	"ExtraCondensed"
	"ExtraExpanded"
	"Normal"
	"SemiCondensed"
	"SemiExpanded"
	"UltraCondensed"
	"UltraExpanded"

---This is a virtual modifier used by wezterm
local type Modifiers
	"ALT"
	"CTRL"
	"ENHANCED_KEY"
	"LEADER"
	"LEFT_ALT"
	"LEFT_CTRL"
	"LEFT_SHIFT"
	"NONE"
	"RIGHT_ALT"
	"RIGHT_CTRL"
	"RIGHT_SHIFT"
	"SHIFT"
	"SUPER"
end

local enum PaletteAnsi
	"black"
	"green"
	"maroon"
	"navy"
	"olive"
	"purple"
	"silver"
	"teal"
end

local enum PaletteBrights
	"aqua"
	"blue"
	"fuchsia"
	"grey"
	"lime"
	"red"
	"white"
	"yellow"
end

local enum AnsiColor
	"Aqua"
	"Black"
	"Blue"
	"Fuchsia"
	"Green"
	"Grey"
	"Lime"
	"Maroon"
	"Navy"
	"Olive"
	"Purple"
	"Red"
	"Silver"
	"Teal"
	"White"
	"Yellow"


---Action callback type for `InputSelectorParams.action`
---See:
--- - [`Window`](lua://Window)
--- - [`Pane`](lua://Pane)
--- - [`InputSelectorParams`](lua://InputSelectorParams)
local type CallbackInputSelector fun(window: Window, pane: Pane, id?: string, label?: string)

---Action callback type for `PromptInputLineParams.action`
---See:
--- - [`Window`](lua://Window)
--- - [`Pane`](lua://Pane)
--- - [`PromptInputLineParams`](lua://PromptInputLineParams)
local type CallbackPromptInputLine fun(window: Window, pane: Pane, line?: string)

--- - The first event parameter is a `Window`
---   object that represents the GUI window
--- - The second event parameter is a `Pane`
---   object that represents the pane in which
---   the event was triggered.
---See:
--- - [`Pane`](lua://Pane)
--- - [`Window`](lua://Window)
local type CallbackWindowPane fun(window: Window, pane: Pane)

local enum BatteryInfo.State
	"Charging"
	"Discharging"
	"Empty"
	"Full"
	"Unknown"
enum

local enum ColorSpec
	{ AnsiColor: AnsiColor }
	{ Color: string }
local type FontStyle
	"Italic"
	"Normal"
	"Oblique"
enum

local enum FormatItem
	"ResetAttributes"
	FormatItemSpec
end

local enum FormatItemAttribute.Intensity
	"Bold"
	"Half"
	"Normal"
enum

local enum FormatItemAttribute.Underline
	"Curly"
	"Dashed"
	"Dotted"
	"Double"
	"None"
	"Single"
enum

local enum FreeTypeTarget
	"HorizontalLcd"
	"Light"
	"Mono"
	"Normal"
	"VerticalLcd"
enum

local enum GpuInfo.Backend
	"Dx12"
	"Gl"
	"Metal"
	"Vulkan"
enum

local enum GpuInfo.DeviceType
	"Cpu"
	"DiscreteGpu"
	"IntegratedGpu"
	"Other"
enum

local enum Gradient.Blend
	"Hsv"
	"LinearRgb"
	"Oklab"
	"Rgb"
enum

local enum Gradient.Interpolation
	"Basis"
	"CatmullRom"
	"Linear"
enum

local enum GradientOrientation
	"Horizontal"
	"Vertical"|{ Linear: LinearGradientOrientation }
	{ Radial: RadialGradientOrientation }
local type MouseEvent
	{ Down: MouseEventInfo }
	{ Drag: MouseEventInfo }
	{ Up: MouseEventInfo }
local type TabBarColor.Underline
	"Double"
	"None"
	"Single"
enum

-- TODO: WTF?
-- local enum WezTerm Wezterm


-- COPY-MODE ASSIGNMENT ===================================================================================================
---Mirrors `SelectionMode` and `CopyModeAssignment` in wezterm upstream:
---https://github.com/wezterm/wezterm/blob/main/config/src/keyassignment.rs

local enum SelectionMode
	"Block" -- Selection expands to define a rectangular block using the starting point and current cursor position as the corners
	"Cell" -- Selection expands a single cell at a time
	"Line" -- Selection expands by a line at a time
	"Word" -- Selection expands by a word at a time
	"SemanticZone" -- Selection expands to the current semantic zone
end

---Represents a pre-defined function that can be applied to control `CopyMode` and [Search Mode](https://wezterm.org/scrollback.html#enabledisable-scrollbar)
local enum CopyModeAssignment
	"AcceptPattern" -- Takes `CopyMode` / `SearchMode` out of editing mode: keyboard input will no longer be directed to the search pattern editor
	"ClearPattern" -- Clear the `CopyMode` / `SearchMode` search pattern
	"ClearSelectionMode" -- Clears the current `CopyMode` selection mode without leaving `CopyMode`
	"Close" -- Closes the copy mode
	"CycleMatchType" -- Move the `CopyMode` / `SearchMode` cycle between `case-sensitive`, `case-insensitive` and `regular expression match types`
	"EditPattern" -- Put `CopyMode` / `SearchMode` into editing mode: keyboard input will be directed to the search pattern editor
	"JumpAgain" -- Repeat the last `JumpForward` or `JumpBackward` movement
	"JumpReverse" -- Repeat the last jump in the opposite direction
	"MoveBackwardSemanticZone" -- Moves the `CopyMode` cursor position one semantic zone to the left
	"MoveBackwardWord" -- Moves the `CopyMode` cursor position one word to the left
	"MoveDown" -- Moves the `CopyMode` cursor position one cell down
	"MoveForwardSemanticZone" -- Moves the `CopyMode` cursor position one semantic zone to the right
	"MoveForwardWord" -- Moves the `CopyMode` cursor position one word to the right
	"MoveForwardWordEnd" -- Moves the `CopyMode` cursor position forward to the end of word
	"MoveLeft" -- Moves the `CopyMode` cursor position one cell to the left
	"MoveRight" -- Moves the `CopyMode` cursor position one cell to the right
	"MoveToEndOfLineContent" -- Moves the `CopyMode` cursor position to the last non-space cell in the current line
	"MoveToScrollbackBottom" -- Moves the `CopyMode` cursor position to the bottom of the scrollback
	"MoveToScrollbackTop" -- Moves the `CopyMode` cursor position to the top of the scrollback
	"MoveToSelectionOtherEnd" -- Moves the `CopyMode` cursor position to the other end of the selection; if the cursor is at the top left corner and the starting point is the bottom right corner, then the cursor and starting point are swapped, with the cursor now positioned at the bottom right corner
	"MoveToSelectionOtherEndHoriz" -- Moves the `CopyMode` cursor position to the other horizontal end of the selection without changing the y-coordinate; if the cursor at the left end and the starting point at the right end, then the cursor and starting point are swapped, with the cursor now positioned at the right end
	"MoveToStartOfLine" -- Moves the `CopyMode` cursor position to the first cell in the current line
	"MoveToStartOfLineContent" -- Moves the `CopyMode` cursor position to the first non-space cell in the current line
	"MoveToStartOfNextLine" -- Moves the `CopyMode` cursor position to the first cell in the next line
	"MoveToViewportBottom" -- Moves the `CopyMode` cursor position to the bottom of the viewport
	"MoveToViewportMiddle" -- Moves the `CopyMode` cursor position to the middle of the viewport
	"MoveToViewportTop" -- Moves the `CopyMode` cursor position to the top of the viewport
	"MoveUp" -- Moves the `CopyMode` cursor position one cell up
	"NextMatch" -- Move the `CopyMode` / `SearchMode` selection to the next matching text, if any
	"NextMatchPage" -- Move the `CopyMode` / `SearchMode` selection to the next matching text on the next page of the screen, if any
	"PageDown" -- Move down by one page
	"PageUp" -- Move up by one page
	"PriorMatch" -- Move the `CopyMode` / `SearchMode` selection to the previous matching text, if any
	"PriorMatchPage" -- Move the `CopyMode` / `SearchMode` selection to the previous matching text on the previous page of the screen, if any
	{ "JumpBackward": { prev_char: boolean } }
	{ "JumpForward": { prev_char: boolean } }
	{ "MoveBackwardZoneOfType": "Input"
	"Output"
	"Prompt" }
	{ "MoveByPage": integer }
	{ "MoveForwardZoneOfType": "Input"
	"Output"
	"Prompt" }
	{ "SetSelectionMode": SelectionMode }
end

-- KEY ASSIGNMENT ====================================================================================================================================

---@diagnostic disable:unused-local

---Mirrors `KeyAssignment`-related types in wezterm upstream:
---https://github.com/wezterm/wezterm/blob/main/config/src/keyassignment.rs

local enum SearchParams
	{ Regex: string }
	{ CaseSensitiveString: string }
	{ CaseInSensitiveString: string }
end

local enum ScrollbackEraseMode
	"ScrollbackAndViewport"
	"ScrollbackOnly"
end

local enum SetWindowLevelParams
	"AlwaysOnBottom"
	"AlwaysOnTop"
	"Normal"
end

local enum SpawnTabDomain
	"CurrentPaneDomain"
	"DefaultDomain"|{ DomainId: integer }
	{ DomainName: string }
end

local enum ClipboardCopyDestination
	"Clipboard"
	"ClipboardAndPrimarySelection"
	"PrimarySelection"
end

local enum PaneDirection
	"Up"
	"Down"
	"Left"
	"Right"
	"Next"
	"Prev"
end

local enum ClipboardPasteDestination
	"Clipboard"
	"PrimarySelection"
enum

local enum PaneSelectMode
	"Activate"
	"MoveToNewTab"
	"MoveToNewWindow"
	"SwapWithActive"
	"SwapWithActiveKeepFocus"
end

local enum RotationDirection
	"Clockwise"
	"CounterClockwise"
end

local enum KeyAssignmentLiterals
	"ActivateCommandPalette"
	"ActivateCopyMode"
	"ActivateLastTab"
	"ClearKeyTableStack"
	"ClearSelection"
	"DecreaseFontSize"
	"DisableDefaultAssignment"
	"Hide"
	"HideApplication"
	"IncreaseFontSize"
	"Nop"
	"OpenLinkAtMouseCursor"
	"PopKeyTable"
	"QuickSelect"
	"QuitApplication"
	"ReloadConfiguration"
	"ResetFontAndWindowSize"
	"ResetFontSize"
	"ResetTerminal"
	"ScrollByCurrentEventWheelDelta"
	"ScrollToBottom"
	"ScrollToTop"
	"Show"
	"ShowDebugOverlay"
	"ShowLauncher"
	"ShowTabNavigator"
	"SpawnWindow"
	"StartWindowDrag"
	"ToggleAlwaysOnBottom"
	"ToggleAlwaysOnTop"
	"ToggleFullScreen"
	"TogglePaneZoomState"
end

local enum CharGroup
	"Activities"
	"AnimalsAndNature"
	"Flags"
	"FoodAndDrink"
	"NerdFonts"
	"Objects"
	"PeopleAndBody"
	"RecentlyUsed"
	"ShortCodes"
	"SmileysAndEmotion"
	"Symbols"
	"TravelAndPlaces"
	"UnicodeNames"
end

local enum CopyModeStr
	"AcceptPattern"
	"ClearPattern"
	"ClearSelectionMode"
	"Close"
	"CycleMatchType"
	"EditPattern"
	"JumpAgain"
	"JumpReverse"
	"MoveBackwardSemanticZone"
	"MoveBackwardWord"
	"MoveDown"
	"MoveForwardSemanticZone"
	"MoveForwardWord"
	"MoveForwardWordEnd"
	"MoveLeft"
	"MoveRight"
	"MoveToEndOfLineContent"
	"MoveToScrollbackBottom"
	"MoveToScrollbackTop"
	"MoveToSelectionOtherEnd"
	"MoveToSelectionOtherEndHoriz"
	"MoveToStartOfLine"
	"MoveToStartOfLineContent"
	"MoveToStartOfNextLine"
	"MoveToViewportBottom"
	"MoveToViewportMiddle"
	"MoveToViewportTop"
	"MoveUp"
	"NextMatch"
	"NextMatchPage"
	"PageDown"
	"PageUp"
	"PriorMatch"
	"PriorMatchPage"
end

local enum MovementType
	"Input"
	"Output"
	"Prompt"
end

-- LOCAL FOR CopyModeParams
local record PrevChar 
	prev_char: boolean
end

local record BackwardJump
	JumpBackward: PrevChar
end

local record ForwardJump
	JumpForward: PrevChar
end

local record BackwardJumpZone -- TODO: revisit name
	MoveBackwardZoneOfType: MovementType
end

local record ForwardJumpZone -- TODO: revisit name
	MoveForwardZoneOfType: MovementType
end

local record PageMovement
	MoveByPage: number
end

local record SelectionModeSetter
	SetSelectionMode: SelectionMode
end

local type CopyModeParams = CopyModeStr|BackwardJump|ForwardJump|BackwardJumpZone|ForwardJumpZone|PageMovement|SelectionModeSetter

local record ConfirmationParams
	---Event callback registered via `wezterm.action_callback()`.
	---The callback's function signature is `(window, pane)` where `window` and `pane`
	---are the `Window` and `Pane` objects from the current pane and window, respectively.

	---This callback is called when the user selects `Yes`.
	---```lua
	---wezterm.action.Confirmation({
	---  action = wezterm.action_callback(function(window, pane)
	---    --- ...
	---  end),
	---})
	---```
	action: { EmitEvent: string }
	---The text to show for confirmation.
	---You may embed escape sequences and/or use `wezterm.format()`.
	---Defaults to: `"🛑 Really continue?"`.
	message: string | nil
	---Event callback registered via `wezterm.action_callback()`.
	---The callback's function signature is `(window, pane)` where `window` and `pane`
	---are the `Window` and `Pane`.
	---This is an optional argument. If present, this callback is called
	---when the user selects `No` or closes the confirmation menu.
	---```lua
	---wezterm.action.Confirmation({
	---  cancel = wezterm.action_callback(function(window, pane)
	---    --- ...
	---  end),
	---})
	---```
	cancel: { EmitEvent: string } | nil
end

---Activates a named key table.
local record ActivateKeyTableParams
	---The name of the table to activate.
	---The name must match up to an entry in the `config.key_tables` configuration.
	---For more information, see:
	--- - [`config.key_tables`](lua://Config.key_tables)
	name: string
	---An optional duration expressed in milliseconds. If specified, then the activation
	---will automatically expire and pop itself from the key table stack once that duration elapses.
	---If omitted, this activation will not expire due to time.
	timeout_milliseconds: integer | nil
	---An optional boolean that controls whether the activation will pop itself
	---after a single additional key press.
	---The default if left unspecified is `true`.
	---When set to `false`, pressing a key will not automatically pop the activation
	---and you will need to use either a timeout or an explicit key assignment
	---that triggers `PopKeyTable` to cancel the activation.
	one_shot: boolean | nil
	---An optional boolean.
	---Defaults to `false` if unspecified.
	---If set to `true` then it will behave as though `PopKeyTable` was triggered
	---before pushing this new activation on the stack.
	---This is most useful for key assignments in a table that was activated
	---with `one_shot` set to `false`.
	replace_current: boolean | nil
	---An optional boolean.
	---Defaults to `false` if unspecified.
	---If set to `true` then a key press that doesn't match any entries
	---in the named key table will implicitly pop this entry from the stack.
	---This can be used together with `timeout_milliseconds`.
	until_unknown: boolean | nil
	---An optional boolean.
	---Defaults to `false` if unspecified.
	---If set to `true` then a key press that doesn't match any entries
	---in the named key table will halt any further key table stack matching,
	---allowing only key assignments that are defined in the current key table activation to match.
	---**Use with care**: If you haven't defined an explicit `PopKeyTable` assignment
	---in the key table you may lock yourself out of the keyboard
	---and will need to reload the configuration file
	---(e.g. by re-saving it) to get back in.
	prevent_fallback: boolean | nil
end

--[[NOTE: use totality in tl?

local enum LauncherArgsFlag
    "verbose"
    "quiet"
end

local flags <total>: {LauncherArgsFlag: boolean} = {
    ["verbose"] = true,
    ["quiet"] = false,
}

]]

---@enum (key) LauncherArgsFlags
local enum LauncherArgsFlags
	"COMMANDS"
	"DOMAINS"
	"FUZZY"
	"KEY_ASSIGNMENTS"
	"LAUNCH_MENU_ITEMS"
	"TABS"
	"WORKSPACES"
    "COMMANDS|DOMAINS"
    "COMMANDS|FUZZY"
    "COMMANDS|KEY_ASSIGNMENTS"
    "COMMANDS|LAUNCH_MENU_ITEMS"
    "COMMANDS|TABS"
    "COMMANDS|WORKSPACES"
    "DOMAINS|COMMANDS"
    "DOMAINS|FUZZY"
    "DOMAINS|KEY_ASSIGNMENTS"
    "DOMAINS|LAUNCH_MENU_ITEMS"
    "DOMAINS|TABS"
    "DOMAINS|WORKSPACES"
    "FUZZY|COMMANDS"
    "FUZZY|DOMAINS"
    "FUZZY|KEY_ASSIGNMENTS"
    "FUZZY|LAUNCH_MENU_ITEMS"
    "FUZZY|TABS"
    "FUZZY|WORKSPACES"
    "KEY_ASSIGNMENTS|COMMANDS"
    "KEY_ASSIGNMENTS|DOMAINS"
    "KEY_ASSIGNMENTS|FUZZY"
    "KEY_ASSIGNMENTS|LAUNCH_MENU_ITEMS"
    "KEY_ASSIGNMENTS|TABS"
    "KEY_ASSIGNMENTS|WORKSPACES"
    "LAUNCH_MENU_ITEMS|COMMANDS"
    "LAUNCH_MENU_ITEMS|DOMAINS"
    "LAUNCH_MENU_ITEMS|FUZZY"
    "LAUNCH_MENU_ITEMS|KEY_ASSIGNMENTS"
    "LAUNCH_MENU_ITEMS|TABS"
    "LAUNCH_MENU_ITEMS|WORKSPACES"
    "TABS|COMMANDS"
    "TABS|DOMAINS"
    "TABS|FUZZY"
    "TABS|KEY_ASSIGNMENTS"
    "TABS|LAUNCH_MENU_ITEMS"
    "TABS|WORKSPACES"
    "WORKSPACES|COMMANDS"
    "WORKSPACES|DOMAINS"
    "WORKSPACES|FUZZY"
    "WORKSPACES|KEY_ASSIGNMENTS"
    "WORKSPACES|LAUNCH_MENU_ITEMS"
    "WORKSPACES|TABS"
    "COMMANDS|DOMAINS|FUZZY"
    "COMMANDS|DOMAINS|KEY_ASSIGNMENTS"
    "COMMANDS|DOMAINS|LAUNCH_MENU_ITEMS"
    "COMMANDS|DOMAINS|TABS"
    "COMMANDS|DOMAINS|WORKSPACES"
    "COMMANDS|FUZZY|KEY_ASSIGNMENTS"
    "COMMANDS|FUZZY|LAUNCH_MENU_ITEMS"
    "COMMANDS|FUZZY|TABS"
    "COMMANDS|FUZZY|WORKSPACES"
    "COMMANDS|KEY_ASSIGNMENTS|DOMAINS"
    "COMMANDS|KEY_ASSIGNMENTS|FUZZY"
    "COMMANDS|KEY_ASSIGNMENTS|LAUNCH_MENU_ITEMS"
    "COMMANDS|KEY_ASSIGNMENTS|TABS"
    "COMMANDS|KEY_ASSIGNMENTS|WORKSPACES"
    "COMMANDS|LAUNCH_MENU_ITEMS|DOMAINS"
    "COMMANDS|LAUNCH_MENU_ITEMS|FUZZY"
    "COMMANDS|LAUNCH_MENU_ITEMS|KEY_ASSIGNMENTS"
    "COMMANDS|LAUNCH_MENU_ITEMS|TABS"
    "COMMANDS|LAUNCH_MENU_ITEMS|WORKSPACES"
    "COMMANDS|TABS|DOMAINS"
    "COMMANDS|TABS|FUZZY"
    "COMMANDS|TABS|KEY_ASSIGNMENTS"
    "COMMANDS|TABS|LAUNCH_MENU_ITEMS"
    "COMMANDS|TABS|WORKSPACES"
    "COMMANDS|WORKSPACES|DOMAINS"
    "COMMANDS|WORKSPACES|FUZZY"
    "COMMANDS|WORKSPACES|KEY_ASSIGNMENTS"
    "COMMANDS|WORKSPACES|LAUNCH_MENU_ITEMS"
    "COMMANDS|WORKSPACES|TABS"
    "DOMAINS|COMMANDS|FUZZY"
    "DOMAINS|COMMANDS|KEY_ASSIGNMENTS"
    "DOMAINS|COMMANDS|LAUNCH_MENU_ITEMS"
    "DOMAINS|COMMANDS|TABS"
    "DOMAINS|COMMANDS|WORKSPACES"
    "DOMAINS|FUZZY|COMMANDS"
    "DOMAINS|FUZZY|KEY_ASSIGNMENTS"
    "DOMAINS|FUZZY|LAUNCH_MENU_ITEMS"
    "DOMAINS|FUZZY|TABS"
    "DOMAINS|FUZZY|WORKSPACES"
    "DOMAINS|KEY_ASSIGNMENTS|COMMANDS"
    "DOMAINS|KEY_ASSIGNMENTS|FUZZY"
    "DOMAINS|KEY_ASSIGNMENTS|LAUNCH_MENU_ITEMS"
    "DOMAINS|KEY_ASSIGNMENTS|TABS"
    "DOMAINS|KEY_ASSIGNMENTS|WORKSPACES"
    "DOMAINS|LAUNCH_MENU_ITEMS|COMMANDS"
    "DOMAINS|LAUNCH_MENU_ITEMS|FUZZY"
    "DOMAINS|LAUNCH_MENU_ITEMS|KEY_ASSIGNMENTS"
    "DOMAINS|LAUNCH_MENU_ITEMS|TABS"
    "DOMAINS|LAUNCH_MENU_ITEMS|WORKSPACES"
    "DOMAINS|TABS|COMMANDS"
    "DOMAINS|TABS|FUZZY"
    "DOMAINS|TABS|KEY_ASSIGNMENTS"
    "DOMAINS|TABS|LAUNCH_MENU_ITEMS"
    "DOMAINS|TABS|WORKSPACES"
    "DOMAINS|WORKSPACES|COMMANDS"
    "DOMAINS|WORKSPACES|FUZZY"
    "DOMAINS|WORKSPACES|KEY_ASSIGNMENTS"
    "DOMAINS|WORKSPACES|LAUNCH_MENU_ITEMS"
    "DOMAINS|WORKSPACES|TABS"
    "FUZZY|COMMANDS|DOMAINS"
    "FUZZY|COMMANDS|KEY_ASSIGNMENTS"
    "FUZZY|COMMANDS|LAUNCH_MENU_ITEMS"
    "FUZZY|COMMANDS|TABS"
    "FUZZY|COMMANDS|WORKSPACES"
    "FUZZY|DOMAINS|COMMANDS"
    "FUZZY|DOMAINS|KEY_ASSIGNMENTS"
    "FUZZY|DOMAINS|LAUNCH_MENU_ITEMS"
    "FUZZY|DOMAINS|TABS"
    "FUZZY|DOMAINS|WORKSPACES"
    "FUZZY|KEY_ASSIGNMENTS|COMMANDS"
    "FUZZY|KEY_ASSIGNMENTS|DOMAINS"
    "FUZZY|KEY_ASSIGNMENTS|LAUNCH_MENU_ITEMS"
    "FUZZY|KEY_ASSIGNMENTS|TABS"
    "FUZZY|KEY_ASSIGNMENTS|WORKSPACES"
    "FUZZY|LAUNCH_MENU_ITEMS|COMMANDS"
    "FUZZY|LAUNCH_MENU_ITEMS|DOMAINS"
    "FUZZY|LAUNCH_MENU_ITEMS|KEY_ASSIGNMENTS"
    "FUZZY|LAUNCH_MENU_ITEMS|TABS"
    "FUZZY|LAUNCH_MENU_ITEMS|WORKSPACES"
    "FUZZY|TABS|COMMANDS"
    "FUZZY|TABS|DOMAINS"
    "FUZZY|TABS|KEY_ASSIGNMENTS"
    "FUZZY|TABS|LAUNCH_MENU_ITEMS"
    "FUZZY|TABS|WORKSPACES"
    "FUZZY|WORKSPACES|COMMANDS"
    "FUZZY|WORKSPACES|DOMAINS"
    "FUZZY|WORKSPACES|KEY_ASSIGNMENTS"
    "FUZZY|WORKSPACES|LAUNCH_MENU_ITEMS"
    "FUZZY|WORKSPACES|TABS"
    "KEY_ASSIGNMENTS|COMMANDS|DOMAINS"
    "KEY_ASSIGNMENTS|COMMANDS|FUZZY"
    "KEY_ASSIGNMENTS|COMMANDS|LAUNCH_MENU_ITEMS"
    "KEY_ASSIGNMENTS|COMMANDS|TABS"
    "KEY_ASSIGNMENTS|COMMANDS|WORKSPACES"
    "LAUNCH_MENU_ITEMS|COMMANDS|DOMAINS"
    "LAUNCH_MENU_ITEMS|COMMANDS|FUZZY"
    "LAUNCH_MENU_ITEMS|COMMANDS|KEY_ASSIGNMENTS"
    "LAUNCH_MENU_ITEMS|COMMANDS|TABS"
    "LAUNCH_MENU_ITEMS|COMMANDS|WORKSPACES"
    "TABS|COMMANDS|DOMAINS"
    "TABS|COMMANDS|FUZZY"
    "TABS|COMMANDS|KEY_ASSIGNMENTS"
    "TABS|COMMANDS|LAUNCH_MENU_ITEMS"
    "TABS|COMMANDS|WORKSPACES"
    "WORKSPACES|COMMANDS|DOMAINS"
    "WORKSPACES|COMMANDS|FUZZY"
    "WORKSPACES|COMMANDS|KEY_ASSIGNMENTS"
    "WORKSPACES|COMMANDS|LAUNCH_MENU_ITEMS"
    "WORKSPACES|COMMANDS|TABS"
end


local launcher_args_flags {
  COMMANDS = 1,
  DOMAINS = 1,
  FUZZY = 1,
  KEY_ASSIGNMENTS = 1,
  LAUNCH_MENU_ITEMS = 1,
  TABS = 1,
  WORKSPACES = 1,
  ["COMMANDS|DOMAINS"] = 1,
  ["COMMANDS|FUZZY"] = 1,
  ["COMMANDS|KEY_ASSIGNMENTS"] = 1,
  ["COMMANDS|LAUNCH_MENU_ITEMS"] = 1,
  ["COMMANDS|TABS"] = 1,
  ["COMMANDS|WORKSPACES"] = 1,
  ["DOMAINS|COMMANDS"] = 1,
  ["DOMAINS|FUZZY"] = 1,
  ["DOMAINS|KEY_ASSIGNMENTS"] = 1,
  ["DOMAINS|LAUNCH_MENU_ITEMS"] = 1,
  ["DOMAINS|TABS"] = 1,
  ["DOMAINS|WORKSPACES"] = 1,
  ["FUZZY|COMMANDS"] = 1,
  ["FUZZY|DOMAINS"] = 1,
  ["FUZZY|KEY_ASSIGNMENTS"] = 1,
  ["FUZZY|LAUNCH_MENU_ITEMS"] = 1,
  ["FUZZY|TABS"] = 1,
  ["FUZZY|WORKSPACES"] = 1,
  ["KEY_ASSIGNMENTS|COMMANDS"] = 1,
  ["KEY_ASSIGNMENTS|DOMAINS"] = 1,
  ["KEY_ASSIGNMENTS|FUZZY"] = 1,
  ["KEY_ASSIGNMENTS|LAUNCH_MENU_ITEMS"] = 1,
  ["KEY_ASSIGNMENTS|TABS"] = 1,
  ["KEY_ASSIGNMENTS|WORKSPACES"] = 1,
  ["LAUNCH_MENU_ITEMS|COMMANDS"] = 1,
  ["LAUNCH_MENU_ITEMS|DOMAINS"] = 1,
  ["LAUNCH_MENU_ITEMS|FUZZY"] = 1,
  ["LAUNCH_MENU_ITEMS|KEY_ASSIGNMENTS"] = 1,
  ["LAUNCH_MENU_ITEMS|TABS"] = 1,
  ["LAUNCH_MENU_ITEMS|WORKSPACES"] = 1,
  ["TABS|COMMANDS"] = 1,
  ["TABS|DOMAINS"] = 1,
  ["TABS|FUZZY"] = 1,
  ["TABS|KEY_ASSIGNMENTS"] = 1,
  ["TABS|LAUNCH_MENU_ITEMS"] = 1,
  ["TABS|WORKSPACES"] = 1,
  ["WORKSPACES|COMMANDS"] = 1,
  ["WORKSPACES|DOMAINS"] = 1,
  ["WORKSPACES|FUZZY"] = 1,
  ["WORKSPACES|KEY_ASSIGNMENTS"] = 1,
  ["WORKSPACES|LAUNCH_MENU_ITEMS"] = 1,
  ["WORKSPACES|TABS"] = 1,
  ["COMMANDS|DOMAINS|FUZZY"] = 1,
  ["COMMANDS|DOMAINS|KEY_ASSIGNMENTS"] = 1,
  ["COMMANDS|DOMAINS|LAUNCH_MENU_ITEMS"] = 1,
  ["COMMANDS|DOMAINS|TABS"] = 1,
  ["COMMANDS|DOMAINS|WORKSPACES"] = 1,
  ["COMMANDS|FUZZY|KEY_ASSIGNMENTS"] = 1,
  ["COMMANDS|FUZZY|LAUNCH_MENU_ITEMS"] = 1,
  ["COMMANDS|FUZZY|TABS"] = 1,
  ["COMMANDS|FUZZY|WORKSPACES"] = 1,
  ["COMMANDS|KEY_ASSIGNMENTS|DOMAINS"] = 1,
  ["COMMANDS|KEY_ASSIGNMENTS|FUZZY"] = 1,
  ["COMMANDS|KEY_ASSIGNMENTS|LAUNCH_MENU_ITEMS"] = 1,
  ["COMMANDS|KEY_ASSIGNMENTS|TABS"] = 1,
  ["COMMANDS|KEY_ASSIGNMENTS|WORKSPACES"] = 1,
  ["COMMANDS|LAUNCH_MENU_ITEMS|DOMAINS"] = 1,
  ["COMMANDS|LAUNCH_MENU_ITEMS|FUZZY"] = 1,
  ["COMMANDS|LAUNCH_MENU_ITEMS|KEY_ASSIGNMENTS"] = 1,
  ["COMMANDS|LAUNCH_MENU_ITEMS|TABS"] = 1,
  ["COMMANDS|LAUNCH_MENU_ITEMS|WORKSPACES"] = 1,
  ["COMMANDS|TABS|DOMAINS"] = 1,
  ["COMMANDS|TABS|FUZZY"] = 1,
  ["COMMANDS|TABS|KEY_ASSIGNMENTS"] = 1,
  ["COMMANDS|TABS|LAUNCH_MENU_ITEMS"] = 1,
  ["COMMANDS|TABS|WORKSPACES"] = 1,
  ["COMMANDS|WORKSPACES|DOMAINS"] = 1,
  ["COMMANDS|WORKSPACES|FUZZY"] = 1,
  ["COMMANDS|WORKSPACES|KEY_ASSIGNMENTS"] = 1,
  ["COMMANDS|WORKSPACES|LAUNCH_MENU_ITEMS"] = 1,
  ["COMMANDS|WORKSPACES|TABS"] = 1,
  ["DOMAINS|COMMANDS|FUZZY"] = 1,
  ["DOMAINS|COMMANDS|KEY_ASSIGNMENTS"] = 1,
  ["DOMAINS|COMMANDS|LAUNCH_MENU_ITEMS"] = 1,
  ["DOMAINS|COMMANDS|TABS"] = 1,
  ["DOMAINS|COMMANDS|WORKSPACES"] = 1,
  ["DOMAINS|FUZZY|COMMANDS"] = 1,
  ["DOMAINS|FUZZY|KEY_ASSIGNMENTS"] = 1,
  ["DOMAINS|FUZZY|LAUNCH_MENU_ITEMS"] = 1,
  ["DOMAINS|FUZZY|TABS"] = 1,
  ["DOMAINS|FUZZY|WORKSPACES"] = 1,
  ["DOMAINS|KEY_ASSIGNMENTS|COMMANDS"] = 1,
  ["DOMAINS|KEY_ASSIGNMENTS|FUZZY"] = 1,
  ["DOMAINS|KEY_ASSIGNMENTS|LAUNCH_MENU_ITEMS"] = 1,
  ["DOMAINS|KEY_ASSIGNMENTS|TABS"] = 1,
  ["DOMAINS|KEY_ASSIGNMENTS|WORKSPACES"] = 1,
  ["DOMAINS|LAUNCH_MENU_ITEMS|COMMANDS"] = 1,
  ["DOMAINS|LAUNCH_MENU_ITEMS|FUZZY"] = 1,
  ["DOMAINS|LAUNCH_MENU_ITEMS|KEY_ASSIGNMENTS"] = 1,
  ["DOMAINS|LAUNCH_MENU_ITEMS|TABS"] = 1,
  ["DOMAINS|LAUNCH_MENU_ITEMS|WORKSPACES"] = 1,
  ["DOMAINS|TABS|COMMANDS"] = 1,
  ["DOMAINS|TABS|FUZZY"] = 1,
  ["DOMAINS|TABS|KEY_ASSIGNMENTS"] = 1,
  ["DOMAINS|TABS|LAUNCH_MENU_ITEMS"] = 1,
  ["DOMAINS|TABS|WORKSPACES"] = 1,
  ["DOMAINS|WORKSPACES|COMMANDS"] = 1,
  ["DOMAINS|WORKSPACES|FUZZY"] = 1,
  ["DOMAINS|WORKSPACES|KEY_ASSIGNMENTS"] = 1,
  ["DOMAINS|WORKSPACES|LAUNCH_MENU_ITEMS"] = 1,
  ["DOMAINS|WORKSPACES|TABS"] = 1,
  ["FUZZY|COMMANDS|DOMAINS"] = 1,
  ["FUZZY|COMMANDS|KEY_ASSIGNMENTS"] = 1,
  ["FUZZY|COMMANDS|LAUNCH_MENU_ITEMS"] = 1,
  ["FUZZY|COMMANDS|TABS"] = 1,
  ["FUZZY|COMMANDS|WORKSPACES"] = 1,
  ["FUZZY|DOMAINS|COMMANDS"] = 1,
  ["FUZZY|DOMAINS|KEY_ASSIGNMENTS"] = 1,
  ["FUZZY|DOMAINS|LAUNCH_MENU_ITEMS"] = 1,
  ["FUZZY|DOMAINS|TABS"] = 1,
  ["FUZZY|DOMAINS|WORKSPACES"] = 1,
  ["FUZZY|KEY_ASSIGNMENTS|COMMANDS"] = 1,
  ["FUZZY|KEY_ASSIGNMENTS|DOMAINS"] = 1,
  ["FUZZY|KEY_ASSIGNMENTS|LAUNCH_MENU_ITEMS"] = 1,
  ["FUZZY|KEY_ASSIGNMENTS|TABS"] = 1,
  ["FUZZY|KEY_ASSIGNMENTS|WORKSPACES"] = 1,
  ["FUZZY|LAUNCH_MENU_ITEMS|COMMANDS"] = 1,
  ["FUZZY|LAUNCH_MENU_ITEMS|DOMAINS"] = 1,
  ["FUZZY|LAUNCH_MENU_ITEMS|KEY_ASSIGNMENTS"] = 1,
  ["FUZZY|LAUNCH_MENU_ITEMS|TABS"] = 1,
  ["FUZZY|LAUNCH_MENU_ITEMS|WORKSPACES"] = 1,
  ["FUZZY|TABS|COMMANDS"] = 1,
  ["FUZZY|TABS|DOMAINS"] = 1,
  ["FUZZY|TABS|KEY_ASSIGNMENTS"] = 1,
  ["FUZZY|TABS|LAUNCH_MENU_ITEMS"] = 1,
  ["FUZZY|TABS|WORKSPACES"] = 1,
  ["FUZZY|WORKSPACES|COMMANDS"] = 1,
  ["FUZZY|WORKSPACES|DOMAINS"] = 1,
  ["FUZZY|WORKSPACES|KEY_ASSIGNMENTS"] = 1,
  ["FUZZY|WORKSPACES|LAUNCH_MENU_ITEMS"] = 1,
  ["FUZZY|WORKSPACES|TABS"] = 1,
  ["KEY_ASSIGNMENTS|COMMANDS|DOMAINS"] = 1,
  ["KEY_ASSIGNMENTS|COMMANDS|FUZZY"] = 1,
  ["KEY_ASSIGNMENTS|COMMANDS|LAUNCH_MENU_ITEMS"] = 1,
  ["KEY_ASSIGNMENTS|COMMANDS|TABS"] = 1,
  ["KEY_ASSIGNMENTS|COMMANDS|WORKSPACES"] = 1,
  ["LAUNCH_MENU_ITEMS|COMMANDS|DOMAINS"] = 1,
  ["LAUNCH_MENU_ITEMS|COMMANDS|FUZZY"] = 1,
  ["LAUNCH_MENU_ITEMS|COMMANDS|KEY_ASSIGNMENTS"] = 1,
  ["LAUNCH_MENU_ITEMS|COMMANDS|TABS"] = 1,
  ["LAUNCH_MENU_ITEMS|COMMANDS|WORKSPACES"] = 1,
  ["TABS|COMMANDS|DOMAINS"] = 1,
  ["TABS|COMMANDS|FUZZY"] = 1,
  ["TABS|COMMANDS|KEY_ASSIGNMENTS"] = 1,
  ["TABS|COMMANDS|LAUNCH_MENU_ITEMS"] = 1,
  ["TABS|COMMANDS|WORKSPACES"] = 1,
  ["WORKSPACES|COMMANDS|DOMAINS"] = 1,
  ["WORKSPACES|COMMANDS|FUZZY"] = 1,
  ["WORKSPACES|COMMANDS|KEY_ASSIGNMENTS"] = 1,
  ["WORKSPACES|COMMANDS|LAUNCH_MENU_ITEMS"] = 1,
  ["WORKSPACES|COMMANDS|TABS"] = 1,
}

local record PaneSelectParams
	alphabet: QuickSelectAlphabet | nil|string
	mode: PaneSelectMode | nil
	show_pane_ids: boolean | nil
end

local record PromptInputLineParams
	---The text to show at the top of the display area.
	---You may embed escape sequences and/or use `wezterm.format()`.
	description: string
---An event callback registered via `wezterm.action_callback()`.
---The callback's function signature is `(window, pane, line)` where `window` and `pane`
---are the `Window` and `Pane` objects from the current pane and window,
---and `line` is the text that the user entered.
	---Note that `line` may be `nil` if `Escape` is hit without entering anything,
	---or `CTRL-C` to cancel the input.
	---```lua
	---wezterm.action.PromptInputLine({
	---  action = wezterm.action_callback(function(window, pane, line)
	---    --- ...
	---  end),
	---})
	---```
	action: { EmitEvent: string }
	---The text to show as the prompt.
	---You may embed escape sequences and/or use `wezterm.format()`.
	---Defaults to: `"> "`.
	prompt: string | nil
	---If provided, the initial content of the input field will be set to this value.
	---The user may edit it prior to submitting the input.
	initial_value: string | nil
end

local record QuickSelectArgsParams
	---If present, completely overrides the normal set of patterns
	---and uses only the patterns specified.
	patterns: string | {nil}
	---If present, this alphabet is used instead of `config.quick_select_alphabet`.
	---See:
	--- - [`config.quick_select_alphabet`](lua://Config.quick_select_alphabet)
	alphabet: QuickSelectAlphabet | nil|string
	---If present, this key assignment action is performed as if by `Window:perform_action`
	---when an item is selected.
	---The normal clipboard action is NOT performed in this case.
	action: Action | nil
	---Overrides whether `action` is performed after an item is selected
	---using a capital value (when paste occurs).
	skip_action_on_paste: boolean | nil
	---If present, replaces the string `"copy"` that is shown at the bottom of the overlay;
	---you can use this to indicate which action will happen if you are using `action`.
	label: string | nil
	---Specifies the number of lines to search above and below the current viewport.
	---The default is 1000 lines.
	---The scope will be increased to the current viewport height if the viewport is smaller.
	scope_lines: integer | nil
end

local record CopyTextToParams
	text: string
	destination: ClipboardCopyDestination

local record ShowLauncherArgsParams
	---The set of flags that specifies what to show in the launcher.
	---The flags can be joined together using a `|` character,
	---so `"TABS|DOMAINS"` is an example of a set of flags that will
	---include both tabs and domains in the list.
	flags: LauncherArgsFlags|string
	---The title to show in the tab while the launcher is active.
	title: string | nil
	---A string to display when in the default mode.
	---Defaults to: `"Select an item and press Enter=launch Esc=cancel /=filter"`.
	help_text: string | nil
	---A string to display when in fuzzy finding mode.
	---Defaults to: `"Fuzzy matching: "`.
	fuzzy_help_text: string | nil
	---A string of unique characters.
	---The characters in the string are used to calculate one or two key press shortcuts
	---that can be used to quickly choose from the Launcher when in the default mode.
	---Defaults to the same value as `config.launcher_alphabet` (`"1234567890abcdefghilmnopqrstuvwxyz"`).
	---See:
	--- - [`config.launcher_alphabet`](lua://Config.launcher_alphabet)
	alphabet: QuickSelectAlphabet | nil|string
end

local record SplitPaneParams
	---Specifies where the new pane will end up.
	---This field is required.
	direction: PaneDirection
	---Controls the size of the new pane.
	---Can be either:
	--- - `{ Cells = 10 }` (i.e. 10 cells)
	--- - `{ Percent = 50 }` (i.e. 50% of the available space)
	---If omitted, `{ Percent = 50 }` is the default.
	size: { Cells: integer } | nil
	{ Percent: integer }
	---The `SpawnCommand` specifying what program to launch into the new pane.
	---If omitted, `config.default_prog` will be used.
	---For more information, see:
	--- - [`SpawnCommand`](lua://SpawnCommand)
	--- - [`config.default_prog`](lua://Config.default_prog)
	command: SpawnCommand | nil
	---If set to true, rather than splitting the active pane, the split will be made
	---at the root of the tab and effectively split the entire tab
	---across the fullest possible extent.
	---The default is `false`.
	top_level: boolean | nil
end



---@generic T
local type ActivateKeyTable fun(params: ActivateKeyTableParams): { ActivateKeyTable: ActivateKeyTableParams }
local type ActivatePaneByIndex fun(params: T<integer>): { ActivatePaneByIndex: T<integer> }
local type ActivatePaneDirection fun(params: T<PaneDirection>): { ActivatePaneDirection: T<PaneDirection> }
local type ActivateTab fun(params: T<integer>): { ActivateTab: T<integer> }
local type ActivateTabRelative fun(params: T<integer>): { ActivateTabRelative: T<integer> }
local type ActivateTabRelativeNoWrap fun(params: T<integer>): { ActivateTabRelativeNoWrap: T<integer> }
local type ActivateWindow fun(params: T<integer>): { ActivateWindow: T<integer> }
local type ActivateWindowRelative fun(params: T<integer>): { ActivateWindowRelative: T<integer> }
local type ActivateWindowRelativeNoWrap fun(params: T<integer>): { ActivateWindowRelativeNoWrap: T<integer> }
local type AdjustPaneSize fun(params: { [1]: PaneDirection, [2]: integer }): { AdjustPaneSize: { [1]: PaneDirection, [2]: integer } }
local type AttachDomain fun(domain: T<string>): { AttachDomain: T<string> }
local type CharSelect
	{ CharSelect: CharSelectParams }|fun(params: CharSelectParams): { CharSelect: CharSelectParams }
local type ClearScrollback fun(params: ScrollbackEraseMode): { ClearScrollback: ScrollbackEraseMode }
local type CloseCurrentPane fun(params: { confirm: boolean }): { CloseCurrentPane: { confirm: boolean } }
local type CloseCurrentTab fun(params: { confirm: boolean }): { CloseCurrentTab: { confirm: boolean } }
local type CompleteSelection fun(params: ClipboardCopyDestination): { CompleteSelection: ClipboardCopyDestination }
local type CompleteSelectionOrOpenLinkAtMouseCursor fun(params: ClipboardCopyDestination): { CompleteSelectionOrOpenLinkAtMouseCursor: ClipboardCopyDestination }
local type Confirmation fun(params: ConfirmationParams): { Confirmation: ConfirmationParams }
local type CopyMode fun(params: CopyModeParams): { CopyMode: CopyModeParams }
local type CopyTo fun(params: ClipboardCopyDestination): { CopyTo: ClipboardCopyDestination }
local type CopyTextTo fun(params: CopyTextToParams): { CopyTextTo: CopyTextToParams }
local type DetachDomain fun(params: SpawnTabDomain): { DetachDomain: SpawnTabDomain }
local type EmitEvent fun(event_id: T<string>): { EmitEvent: T<string> }
local type ExtendSelectionToMouseCursor fun(params: SelectionMode): { ExtendSelectionToMouseCursor: SelectionMode }
local type InputSelector fun(params: InputSelectorParams): { InputSelector: InputSelectorParams }
local type MoveTab fun(index: T<integer>): { MoveTab: T<integer> }
local type MoveTabRelative fun(index: T<integer>): { MoveTabRelative: T<integer> }
local type Multiple
	{ Multiple: {Action} }|fun(events: {Action}): { Multiple: {Action} }
local type OpenUri fun(uri: T<string>): { OpenUri: T<string> }
local type PaneSelect
	{ PaneSelect: PaneSelectParams }|fun(params: PaneSelectParams): { PaneSelect: PaneSelectParams }
local type PasteFrom fun(source: ClipboardPasteDestination): { PasteFrom: ClipboardPasteDestination }
local type PromptInputLine fun(params: PromptInputLineParams): { PromptInputLine: PromptInputLineParams }
local type QuickSelectArgs
	{ QuickSelectArgs: QuickSelectArgsParams }|fun(params: QuickSelectArgsParams): { QuickSelectArgs: QuickSelectArgsParams }
local type RotatePanes fun(params: RotationDirection): { RotatePanes: RotationDirection }
local type ScrollByLine fun(amount: T<integer>): { ScrollByLine: T<integer> }
local type ScrollByPage fun(amount: T<number>): { ScrollByPage: T<number> }
local type ScrollToPrompt fun(amount: T<integer>): { ScrollToPrompt: T<integer> }
local type Search fun(params: "CurrentSelectionOrEmptyString"|SearchParams): { Search: "CurrentSelectionOrEmptyString"|SearchParams }
local type SelectTextAtMouseCursor fun(params: SelectionMode): { SelectTextAtMouseCursor: SelectionMode }
local type SendKey fun(params: SendKeyParams): { SendKey: SendKeyParams }
local type SendString fun(params: T<string>): { SendString: T<string> }
local type SetPaneZoomState fun(state: boolean): { SetPaneZoomState: boolean }
local type SetWindowLevel fun(level: SetWindowLevelParams): { SetWindowLevel: SetWindowLevelParams }
local type ShowLauncherArgs fun(params: ShowLauncherArgsParams): { ShowLauncherArgs: ShowLauncherArgsParams }
local type SpawnCommandInNewTab
	{ SpawnCommandInNewTab: SpawnCommand }
	fun(params: SpawnCommand): { SpawnCommandInNewTab: SpawnCommand }
end

local type SpawnCommandInNewWindow
	{ SpawnCommandInNewWindow: SpawnCommand }
	fun(params: SpawnCommand): { SpawnCommandInNewWindow: SpawnCommand }

local type SpawnTabAction fun(params: SpawnTabDomain): { SpawnTab: SpawnTabDomain }

local type SplitHorizontal
	{ SplitHorizontal: SpawnCommand }
	fun(params: SpawnCommand): { SplitHorizontal: SpawnCommand }

local type SplitPane fun(params: SplitPaneParams): { SplitPane: SplitPaneParams }

local type SplitVertical
	{ SplitVertical: SpawnCommand }
	fun(params: SpawnCommand): { SplitVertical: SpawnCommand }

local type SwitchToWorkspace
	{ SwitchToWorkspace: SwitchToWorkspaceParams }
	fun(params: SwitchToWorkspaceParams): { SwitchToWorkspace: SwitchToWorkspaceParams }

local type SwitchWorkspaceRelative fun(params: T<integer>): { SwitchWorkspaceRelative: T<integer> }

local enum Actions
	{ ActivateKeyTable: ActivateKeyTableParams }
	{ ActivatePaneByIndex: integer }
	{ ActivatePaneDirection: PaneDirection }
	{ ActivateTab: integer }
	{ ActivateTabRelative: integer }
	{ ActivateTabRelativeNoWrap: integer }
	{ ActivateWindow: integer }
	{ ActivateWindowRelative: integer }
	{ ActivateWindowRelativeNoWrap: integer }
	{ AdjustPaneSize: { [1]: PaneDirection, [2]: integer } }
	{ AttachDomain: string }
	{ CharSelect: CharSelectParams }
	{ ClearScrollback: ScrollbackEraseMode }
	{ CloseCurrentPane: { confirm: boolean } }
	{ CloseCurrentTab: { confirm: boolean } }
	{ CompleteSelection: ClipboardCopyDestination }
	{ CompleteSelectionOrOpenLinkAtMouseCursor: ClipboardCopyDestination }
	{ Confirmation: ConfirmationParams }
	{ CopyMode: CopyModeParams }
	{ CopyTo: ClipboardCopyDestination }
	{ CopyTextTo: CopyTextToParams }
	{ DetachDomain: SpawnTabDomain }
	{ EmitEvent: string }
	{ ExtendSelectionToMouseCursor: SelectionMode }
	{ InputSelector: InputSelectorParams }
	{ MoveTab: integer }
	{ MoveTabRelative: integer }
	{ Multiple: {Action} }
	{ OpenUri: string }
	{ PaneSelect: PaneSelectParams }
	{ PasteFrom: ClipboardPasteDestination }
	{ PromptInputLine: PromptInputLineParams }
	{ QuickSelectArgs: QuickSelectArgsParams }
	{ RotatePanes: RotationDirection }
	{ ScrollByLine: integer }
	{ ScrollByPage: number }
	{ ScrollToPrompt: integer }
	{ Search: "CurrentSelectionOrEmptyString"|SearchParams }
	{ SelectTextAtMouseCursor: SelectionMode }
	{ SendKey: SendKeyParams }
	{ SendString: string }
	{ SetPaneZoomState: boolean }
	{ SetWindowLevel: SetWindowLevelParams }
	{ ShowLauncherArgs: ShowLauncherArgsParams }
	{ SpawnCommandInNewTab: SpawnCommand }
	{ SpawnCommandInNewWindow: SpawnCommand }
	{ SpawnTab: SpawnTabDomain }
	{ SplitHorizontal: SpawnCommand }
	{ SplitPane: SplitPaneParams }
	{ SplitVertical: SpawnCommand }
	{ SwitchToWorkspace: SwitchToWorkspaceParams }
	{ SwitchWorkspaceRelative: integer }
end

---Helper for defining key assignment actions in your configuration file.
---This is really just sugar for the underlying Lua -> Rust deserialation mapping
---that makes it a bit easier to identify where syntax errors may exist
---in your configuration file.
local record KeyAssignment
	ActivateCommandPalette: "ActivateCommandPalette"
	ActivateCopyMode: "ActivateCopyMode"
	ActivateKeyTable: ActivateKeyTable
	ActivateLastTab: "ActivateLastTab"
	ActivatePaneByIndex: ActivatePaneByIndex
	ActivatePaneDirection: ActivatePaneDirection
	ActivateTab: ActivateTab
	ActivateTabRelative: ActivateTabRelative
	ActivateTabRelativeNoWrap: ActivateTabRelativeNoWrap
	ActivateWindow: ActivateWindow
	ActivateWindowRelative: ActivateWindowRelative
	ActivateWindowRelativeNoWrap: ActivateWindowRelativeNoWrap
	AdjustPaneSize: AdjustPaneSize
	AttachDomain: AttachDomain
	CharSelect: CharSelect
	ClearKeyTableStack: "ClearKeyTableStack"
	ClearScrollback: ClearScrollback
	ClearSelection: "ClearSelection"
	CloseCurrentPane: CloseCurrentPane
	CloseCurrentTab: CloseCurrentTab
	CompleteSelection: CompleteSelection
	CompleteSelectionOrOpenLinkAtMouseCursor: CompleteSelectionOrOpenLinkAtMouseCursor
	Confirmation: Confirmation
	CopyMode: CopyMode
	CopyTo: CopyTo
	CopyTextTo: CopyTextTo
	DecreaseFontSize: "DecreaseFontSize"
	DetachDomain: DetachDomain
	DisableDefaultAssignment: "DisableDefaultAssignment"
	EmitEvent: EmitEvent
	ExtendSelectionToMouseCursor: ExtendSelectionToMouseCursor
	Hide: "Hide"
	HideApplication: "HideApplication"
	IncreaseFontSize: "IncreaseFontSize"
	InputSelector: InputSelector
	MoveTab: MoveTab
	MoveTabRelative: MoveTabRelative
	---Performs a sequence of multiple assignments.
	---This is useful when you want a single key press to trigger multiple actions.
	Multiple: Multiple
	Nop: "Nop"
	OpenLinkAtMouseCursor: "OpenLinkAtMouseCursor"
	OpenUri: OpenUri
	PaneSelect: PaneSelect
	PasteFrom: PasteFrom
	PopKeyTable: "PopKeyTable"
	PromptInputLine: PromptInputLine
	QuickSelect: "QuickSelect"
	QuickSelectArgs: QuickSelectArgs
	QuitApplication: "QuitApplication"
	ReloadConfiguration: "ReloadConfiguration"
	ResetFontAndWindowSize: "ResetFontAndWindowSize"
	ResetFontSize: "ResetFontSize"
	ResetTerminal: "ResetTerminal"
	RotatePanes: RotatePanes
	ScrollByCurrentEventWheelDelta: "ScrollByCurrentEventWheelDelta"
	ScrollByLine: ScrollByLine
	ScrollByPage: ScrollByPage
	ScrollToBottom: "ScrollToBottom"
	ScrollToPrompt: ScrollToPrompt
	ScrollToTop: "ScrollToTop"
	Search: Search
	SelectTextAtMouseCursor: SelectTextAtMouseCursor
	SendKey: SendKey
	SendString: SendString
	SetPaneZoomState: SetPaneZoomState
	SetWindowLevel: SetWindowLevel
	Show: "Show"
	ShowDebugOverlay: "ShowDebugOverlay"
	ShowLauncher: "ShowLauncher"
	ShowLauncherArgs: ShowLauncherArgs
	ShowTabNavigator: "ShowTabNavigator"
	SpawnCommandInNewTab: SpawnCommandInNewTab
	SpawnCommandInNewWindow: SpawnCommandInNewWindow
	SpawnTab: SpawnTabAction
	SpawnWindow: "SpawnWindow"
	SplitHorizontal: SplitHorizontal
	SplitPane: SplitPane
	SplitVertical: SplitVertical
	StartWindowDrag: "StartWindowDrag"
	SwitchToWorkspace: SwitchToWorkspace
	SwitchWorkspaceRelative: SwitchWorkspaceRelative
	ToggleAlwaysOnBottom: "ToggleAlwaysOnBottom"
	ToggleAlwaysOnTop: "ToggleAlwaysOnTop"
	ToggleFullScreen: "ToggleFullScreen"
	TogglePaneZoomState: "TogglePaneZoomState"

local record InputSelectorParams
	---The title that will be set for the overlay pane.
	title: string
---A table consisting of the potential choices.
---Each entry is itself a table with a label field and an optional id field.
---The label will be shown in the list, while the id can be a different string
---that is meaningful to your action.
---The label can be used together with `wezterm.format()` to produce styled text.
choices: { label: string, id: string }[]
---An event callback registered via `wezterm.action_callback()`.
---The callback's function signature is `(window, pane, id, label)`
---where `window` and `pane` are the `Window` and `Pane` objects
	---from the current pane and window, and `id` and `label` hold
	---the corresponding fields from the selected choice.
	---Both will be `nil` if the overlay is cancelled without selecting anything.
	---```lua
	---wezterm.action.InputSelector({
	---  action = wezterm.action_callback(function(window, pane, id, label)
	---    --- ...
	---  end),
	---})
	---```
	action: { EmitEvent: string }
	---A boolean that defaults to `false`.
	---If `true`, `InputSelector` will start in its fuzzy finding mode,
	---equivalent to starting the `InputSelector` and pressing `/` in the default mode.
	fuzzy: boolean | nil
	---A string of unique characters.
	alphabet: QuickSelectAlphabet | nil|string
	---A string to display when in the default mode.
	description: string | nil
	---A string to display when in fuzzy finding mode.
	fuzzy_description: string | nil
end

local record CharSelectParams
	copy_on_select: boolean
	copy_to: ClipboardCopyDestination
	group: CharGroup | nil
end

local record SendKeyParams
---A single unicode character, like 'A' or 'a'. Pay attention to the case of the text that you use
---and the state of the SHIFT modifier, as this matters whether 'A' or 'a' is matched.
---Alternatively you can use on the following keycode identifiers, although note that not all of
---these are meaningful on all platforms:
--- - `Add`
--- - `Alt`
--- - `ApplicationDownArrow`
--- - `ApplicationLeftArrow`
--- - `ApplicationRightArrow`
--- - `ApplicationUpArrow`
--- - `Applications`
--- - `Backspace`
--- - `BrowserBack`
--- - `BrowserFavorites`
--- - `BrowserForward`
--- - `BrowserHome`
--- - `BrowserRefresh`
--- - `BrowserSearch`
--- - `BrowserStop`
--- - `Cancel`
--- - `CapsLock`
--- - `Clear`
--- - `Control`
--- - `Decimal`
--- - `Delete`
--- - `Divide`
--- - `DownArrow`
--- - `End`
--- - `Enter`
--- - `Escape`
--- - `Execute`
--- - `F1`
--- - `F2`
--- - `F3`
--- - `F4`
--- - `F5`
--- - `F6`
--- - `F7`
--- - `F8`
--- - `F9`
--- - `F10`
--- - `F11`
--- - `F12`
--- - `F13`
--- - `F14`
--- - `F15`
--- - `F16`
--- - `F17`
--- - `F18`
--- - `F19`
--- - `F20`
--- - `F21`
--- - `F22`
--- - `F23`
--- - `F24`
--- - `Help`
--- - `Home`
--- - `Hyper`
--- - `Insert`
--- - `LeftAlt`
--- - `LeftArrow`
--- - `LeftControl`
--- - `LeftMenu`
--- - `LeftShift`
--- - `LeftWindows`
--- - `MediaNextTrack`
--- - `MediaPlayPause`
--- - `MediaPrevTrack`
--- - `MediaStop`
--- - `Menu`
--- - `Meta`
--- - `Multiply`
--- - `NumLock`
--- - `Numpad0`
--- - `Numpad1`
--- - `Numpad2`
--- - `Numpad3`
--- - `Numpad4`
--- - `Numpad5`
--- - `Numpad6`
--- - `Numpad7`
--- - `Numpad8`
--- - `Numpad9`
--- - `PageDown`
--- - `PageUp`
--- - `Pause`
--- - `Print`
--- - `PrintScreen`
--- - `RightAlt`
--- - `RightArrow`
--- - `RightControl`
--- - `RightMenu`
--- - `RightShift`
--- - `RightWindows`
--- - `ScrollLock`
--- - `Select`
--- - `Separator`
--- - `Shift`
--- - `Sleep`
--- - `Subtract`
--- - `Super`
--- - `Tab`
--- - `UpArrow`
--- - `VoidSymbol`
--- - `VolumeDown`
--- - `VolumeMute`
--- - `VolumeUp`
---The key value can refer either to the physical position of a key on an ANSI US keyboard or to the
---post-keyboard-layout-mapped value produced by a key press.
---You can explicitly assign using the physical position by adding a phys: prefix to the value, for
---example: `key="phys:A"`. This will match key presses for the key that would be in the position of
---the A key on an ANSI US keyboard.
---You can explicitly assign the mapped key by adding a mapped:
---prefix to the value, for example: key="mapped:a" will match a
---key press where the OS keyboard layout produces a, regardless of
---its physical position.
---If you omit an explicit prefix, wezterm will assume phys: and use the physical position of the
---specified key.
---The default key assignments listed above use `phys:`. In previous releases there was no physical
---position support and those assignments were all `mapped:`.
---When upgrading from earlier releases, if you had `{key="N", mods="CMD", ..}` in your config, you
---will need to change it to either `{key="N", mods="CMD|SHIFT", ..}` or `{ key="mapped:N",
---mods="CMD", ..}` in order to continue to respect the SHIFT modifier.
---The `key_map_preference` option controls how keys without an explicit `phys:` or `mapped:` prefix
---are treated. If `key_map_preference = "Mapped"` (the default), then `mapped:` is assumed. If
	---`key_map_preference = "Physical"` then `phys:` is assumed.
	---The default key assignments will respect `key_map_preference`.
	---In some cases, wezterm may not know how to represent a key event in either its phys: or mapped:
	---forms. In that case, you may wish to define an assignment in terms of the underlying operating
	---system key code, using a `raw: prefix`.
	---Similar in concept to the `phys:` mapping described above, the `raw:` mapping is independent of
	---the OS keyboard layout. Raw codes are hardware and windowing system dependent, so there is no
	---portable way to list which key does what.
	---To discover these values, you can set `debug_key_events = true` and press the keys of interest.
	---You can specify a raw key value of 123 by using `key="raw:123"` in your config rather than one of
	---the other key values.
	key: string
---Possible Modifier labels are:
--- - `SUPER`, `CMD`, `WIN`: These are all equivalent: on macOS the `Command` key,
---                  on Windows the `WIN`,
---                  on Linux this can also be the `Super` or `Hyper` key.
	---                  Left and right are equivalent
	--- - `CTRL`: The control key.
	---         Left and right are equivalent
	--- - `SHIFT`: The shift key.
	---          Left and right are equivalent
	--- - `ALT`, `OPT`, `META`: These are all equivalent.
	---                  on macOS the Option key, on
	---                  other systems the Alt or Meta key.
	---                  Left and right are equivalent
	--- - `LEADER`: A special modal modifier state managed by WezTerm
	--- - `VoidSymbol`: This keycode is emitted in special cases where
	---               the original function of the key has been removed.
	---               Such as in Linux and using `setxkbmap -option caps:none`.
	---The `CapsLock` will no longer function as before in all applications,
	---instead emitting `VoidSymbol`.
	---You can also combine modifiers using the `|` symbol, like `"CMD|CTRL"`.
	mods: string | nil
end

local record Key: SendKeyParams
	action: Action | nil

-- WINDOW DECORATIONS ==============================================================================================================

---@diagnostic disable:unused-local

---Configures whether the window has a title bar and/or resizable border.
---The value is a set of flags:
---  - `"NONE"`: Disables titlebar and border (borderless mode),
---            but causes problems with resizing and minimizing the window,
---            so you probably want to use `"RESIZE"` instead of `"NONE"`
---            if you just want to remove the title bar
---  - `"TITLE"`: Disable the resizable border and enable only the title bar
---  - `"RESIZE"`: Disable the title bar but enable the resizable border
---  - `"TITLE|RESIZE"`: Enable titlebar and border.
---                    This is the default
---  - `"INTEGRATED_BUTTONS|RESIZE"`: Place window management buttons (minimize, maximize, close)
---                                 into the tab bar instead of showing a title bar
---  - `"MACOS_FORCE_DISABLE_SHADOW"`: (macOS only) disable the window shadow effect
---  - `"MACOS_FORCE_ENABLE_SHADOW"`: (macOS only) enable the window shadow effect
---  - `"MACOS_FORCE_SQUARE_CORNERS"`: (macOS only) force the window to have square
---                                  rather than rounded corners.
---                                  It is not compatible with `"TITLE"` or `"INTEGRATED_BUTTONS"`
---  - `"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"`: (macOS only) change the system titlebar background color
---                                                    to match the terminal background color defined
---                                                    by your configuration.
---                                                    This option doesn't make sense to use without
---                                                    also including `"TITLE|RESIZE"` in the set of decorations
local enum WindowDecorations
	"NONE"
	"TITLE"
	"RESIZE"
	"TITLE|RESIZE"
	"RESIZE|TITLE"
	"INTEGRATED_BUTTONS"
	"TITLE|INTEGRATED_BUTTONS"
	"INTEGRATED_BUTTONS|TITLE"
	"RESIZE|INTEGRATED_BUTTONS"
	"INTEGRATED_BUTTONS|RESIZE"
	"TITLE|RESIZE|INTEGRATED_BUTTONS"
	"TITLE|INTEGRATED_BUTTONS|RESIZE"
	"RESIZE|TITLE|INTEGRATED_BUTTONS"
	"RESIZE|INTEGRATED_BUTTONS|TITLE"
	"INTEGRATED_BUTTONS|RESIZE|TITLE"
	"INTEGRATED_BUTTONS|TITLE|RESIZE"
	"MACOS_FORCE_ENABLE_SHADOW"
	"TITLE|MACOS_FORCE_ENABLE_SHADOW"
	"MACOS_FORCE_ENABLE_SHADOW|TITLE"
	"RESIZE|MACOS_FORCE_ENABLE_SHADOW"
	"MACOS_FORCE_ENABLE_SHADOW|RESIZE"
	"TITLE|RESIZE|MACOS_FORCE_ENABLE_SHADOW"
	"TITLE|MACOS_FORCE_ENABLE_SHADOW|RESIZE"
	"RESIZE|TITLE|MACOS_FORCE_ENABLE_SHADOW"
	"RESIZE|MACOS_FORCE_ENABLE_SHADOW|TITLE"
	"MACOS_FORCE_ENABLE_SHADOW|RESIZE|TITLE"
	"MACOS_FORCE_ENABLE_SHADOW|TITLE|RESIZE"
	"INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW"
	"MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS"
	"TITLE|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW"
	"TITLE|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS"
	"INTEGRATED_BUTTONS|TITLE|MACOS_FORCE_ENABLE_SHADOW"
	"INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|TITLE"
	"MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|TITLE"
	"MACOS_FORCE_ENABLE_SHADOW|TITLE|INTEGRATED_BUTTONS"
	"RESIZE|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW"
	"RESIZE|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS"
	"INTEGRATED_BUTTONS|RESIZE|MACOS_FORCE_ENABLE_SHADOW"
	"INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|RESIZE"
	"MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|RESIZE"
	"MACOS_FORCE_ENABLE_SHADOW|RESIZE|INTEGRATED_BUTTONS"
	"TITLE|RESIZE|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW"
	"TITLE|RESIZE|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS"
	"TITLE|INTEGRATED_BUTTONS|RESIZE|MACOS_FORCE_ENABLE_SHADOW"
	"TITLE|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|RESIZE"
	"TITLE|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|RESIZE"
	"TITLE|MACOS_FORCE_ENABLE_SHADOW|RESIZE|INTEGRATED_BUTTONS"
	"RESIZE|TITLE|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW"
	"RESIZE|TITLE|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS"
	"RESIZE|INTEGRATED_BUTTONS|TITLE|MACOS_FORCE_ENABLE_SHADOW"
	"RESIZE|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|TITLE"
	"RESIZE|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|TITLE"
	"RESIZE|MACOS_FORCE_ENABLE_SHADOW|TITLE|INTEGRATED_BUTTONS"
	"INTEGRATED_BUTTONS|RESIZE|TITLE|MACOS_FORCE_ENABLE_SHADOW"
	"INTEGRATED_BUTTONS|RESIZE|MACOS_FORCE_ENABLE_SHADOW|TITLE"
	"INTEGRATED_BUTTONS|TITLE|RESIZE|MACOS_FORCE_ENABLE_SHADOW"
	"INTEGRATED_BUTTONS|TITLE|MACOS_FORCE_ENABLE_SHADOW|RESIZE"
	"INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|TITLE|RESIZE"
	"INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|RESIZE|TITLE"
	"MACOS_FORCE_ENABLE_SHADOW|RESIZE|INTEGRATED_BUTTONS|TITLE"
	"MACOS_FORCE_ENABLE_SHADOW|RESIZE|TITLE|INTEGRATED_BUTTONS"
	"MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|RESIZE|TITLE"
	"MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|TITLE|RESIZE"
	"MACOS_FORCE_ENABLE_SHADOW|TITLE|INTEGRATED_BUTTONS|RESIZE"
	"MACOS_FORCE_ENABLE_SHADOW|TITLE|RESIZE|INTEGRATED_BUTTONS"
	"MACOS_FORCE_DISABLE_SHADOW"
	"TITLE|MACOS_FORCE_DISABLE_SHADOW"
	"MACOS_FORCE_DISABLE_SHADOW|TITLE"
	"RESIZE|MACOS_FORCE_DISABLE_SHADOW"
	"MACOS_FORCE_DISABLE_SHADOW|RESIZE"
	"TITLE|RESIZE|MACOS_FORCE_DISABLE_SHADOW"
	"TITLE|MACOS_FORCE_DISABLE_SHADOW|RESIZE"
	"RESIZE|TITLE|MACOS_FORCE_DISABLE_SHADOW"
	"RESIZE|MACOS_FORCE_DISABLE_SHADOW|TITLE"
	"MACOS_FORCE_DISABLE_SHADOW|RESIZE|TITLE"
	"MACOS_FORCE_DISABLE_SHADOW|TITLE|RESIZE"
	"INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW"
	"MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS"
	"TITLE|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW"
	"TITLE|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS"
	"INTEGRATED_BUTTONS|TITLE|MACOS_FORCE_DISABLE_SHADOW"
	"INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|TITLE"
	"MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|TITLE"
	"MACOS_FORCE_DISABLE_SHADOW|TITLE|INTEGRATED_BUTTONS"
	"RESIZE|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW"
	"RESIZE|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS"
	"INTEGRATED_BUTTONS|RESIZE|MACOS_FORCE_DISABLE_SHADOW"
	"INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|RESIZE"
	"MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|RESIZE"
	"MACOS_FORCE_DISABLE_SHADOW|RESIZE|INTEGRATED_BUTTONS"
	"TITLE|RESIZE|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW"
	"TITLE|RESIZE|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS"
	"TITLE|INTEGRATED_BUTTONS|RESIZE|MACOS_FORCE_DISABLE_SHADOW"
	"TITLE|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|RESIZE"
	"TITLE|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|RESIZE"
	"TITLE|MACOS_FORCE_DISABLE_SHADOW|RESIZE|INTEGRATED_BUTTONS"
	"RESIZE|TITLE|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW"
	"RESIZE|TITLE|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS"
	"RESIZE|INTEGRATED_BUTTONS|TITLE|MACOS_FORCE_DISABLE_SHADOW"
	"RESIZE|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|TITLE"
	"RESIZE|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|TITLE"
	"RESIZE|MACOS_FORCE_DISABLE_SHADOW|TITLE|INTEGRATED_BUTTONS"
	"INTEGRATED_BUTTONS|RESIZE|TITLE|MACOS_FORCE_DISABLE_SHADOW"
	"INTEGRATED_BUTTONS|RESIZE|MACOS_FORCE_DISABLE_SHADOW|TITLE"
	"INTEGRATED_BUTTONS|TITLE|RESIZE|MACOS_FORCE_DISABLE_SHADOW"
	"INTEGRATED_BUTTONS|TITLE|MACOS_FORCE_DISABLE_SHADOW|RESIZE"
	"INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|TITLE|RESIZE"
	"INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|RESIZE|TITLE"
	"MACOS_FORCE_DISABLE_SHADOW|RESIZE|INTEGRATED_BUTTONS|TITLE"
	"MACOS_FORCE_DISABLE_SHADOW|RESIZE|TITLE|INTEGRATED_BUTTONS"
	"MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|RESIZE|TITLE"
	"MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|TITLE|RESIZE"
	"MACOS_FORCE_DISABLE_SHADOW|TITLE|INTEGRATED_BUTTONS|RESIZE"
	"MACOS_FORCE_DISABLE_SHADOW|TITLE|RESIZE|INTEGRATED_BUTTONS"
	"MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW"
	"MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW"
	"TITLE|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW"
	"TITLE|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW"
	"MACOS_FORCE_ENABLE_SHADOW|TITLE|MACOS_FORCE_DISABLE_SHADOW"
	"MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|TITLE"
	"MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|TITLE"
	"MACOS_FORCE_DISABLE_SHADOW|TITLE|MACOS_FORCE_ENABLE_SHADOW"
	"RESIZE|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW"
	"RESIZE|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW"
	"MACOS_FORCE_ENABLE_SHADOW|RESIZE|MACOS_FORCE_DISABLE_SHADOW"
	"MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|RESIZE"
	"MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|RESIZE"
	"MACOS_FORCE_DISABLE_SHADOW|RESIZE|MACOS_FORCE_ENABLE_SHADOW"
	"TITLE|RESIZE|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW"
	"TITLE|RESIZE|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW"
	"TITLE|MACOS_FORCE_ENABLE_SHADOW|RESIZE|MACOS_FORCE_DISABLE_SHADOW"
	"TITLE|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|RESIZE"
	"TITLE|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|RESIZE"
	"TITLE|MACOS_FORCE_DISABLE_SHADOW|RESIZE|MACOS_FORCE_ENABLE_SHADOW"
	"RESIZE|TITLE|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW"
	"RESIZE|TITLE|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW"
	"RESIZE|MACOS_FORCE_ENABLE_SHADOW|TITLE|MACOS_FORCE_DISABLE_SHADOW"
	"RESIZE|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|TITLE"
	"RESIZE|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|TITLE"
	"RESIZE|MACOS_FORCE_DISABLE_SHADOW|TITLE|MACOS_FORCE_ENABLE_SHADOW"
	"MACOS_FORCE_ENABLE_SHADOW|RESIZE|TITLE|MACOS_FORCE_DISABLE_SHADOW"
	"MACOS_FORCE_ENABLE_SHADOW|RESIZE|MACOS_FORCE_DISABLE_SHADOW|TITLE"
	"MACOS_FORCE_ENABLE_SHADOW|TITLE|RESIZE|MACOS_FORCE_DISABLE_SHADOW"
	"MACOS_FORCE_ENABLE_SHADOW|TITLE|MACOS_FORCE_DISABLE_SHADOW|RESIZE"
	"MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|TITLE|RESIZE"
	"MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|RESIZE|TITLE"
	"MACOS_FORCE_DISABLE_SHADOW|RESIZE|MACOS_FORCE_ENABLE_SHADOW|TITLE"
	"MACOS_FORCE_DISABLE_SHADOW|RESIZE|TITLE|MACOS_FORCE_ENABLE_SHADOW"
	"MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|RESIZE|TITLE"
	"MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|TITLE|RESIZE"
	"MACOS_FORCE_DISABLE_SHADOW|TITLE|MACOS_FORCE_ENABLE_SHADOW|RESIZE"
	"MACOS_FORCE_DISABLE_SHADOW|TITLE|RESIZE|MACOS_FORCE_ENABLE_SHADOW"
	"INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW"
	"INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW"
	"MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW"
	"MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS"
	"MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS"
	"MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW"
	"TITLE|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW"
	"TITLE|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW"
	"TITLE|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW"
	"TITLE|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS"
	"TITLE|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS"
	"TITLE|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW"
	"INTEGRATED_BUTTONS|TITLE|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW"
	"INTEGRATED_BUTTONS|TITLE|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW"
	"INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|TITLE|MACOS_FORCE_DISABLE_SHADOW"
	"INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|TITLE"
	"INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|TITLE"
	"INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|TITLE|MACOS_FORCE_ENABLE_SHADOW"
	"MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|TITLE|MACOS_FORCE_DISABLE_SHADOW"
	"MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|TITLE"
	"MACOS_FORCE_ENABLE_SHADOW|TITLE|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW"
	"MACOS_FORCE_ENABLE_SHADOW|TITLE|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS"
	"MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|TITLE|INTEGRATED_BUTTONS"
	"MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|TITLE"
	"MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|TITLE"
	"MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|TITLE|MACOS_FORCE_ENABLE_SHADOW"
	"MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|TITLE"
	"MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|TITLE|INTEGRATED_BUTTONS"
	"MACOS_FORCE_DISABLE_SHADOW|TITLE|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS"
	"MACOS_FORCE_DISABLE_SHADOW|TITLE|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW"
	"RESIZE|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW"
	"RESIZE|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW"
	"RESIZE|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW"
	"RESIZE|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS"
	"RESIZE|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS"
	"RESIZE|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW"
	"INTEGRATED_BUTTONS|RESIZE|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW"
	"INTEGRATED_BUTTONS|RESIZE|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW"
	"INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|RESIZE|MACOS_FORCE_DISABLE_SHADOW"
	"INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|RESIZE"
	"INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|RESIZE"
	"INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|RESIZE|MACOS_FORCE_ENABLE_SHADOW"
	"MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|RESIZE|MACOS_FORCE_DISABLE_SHADOW"
	"MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|RESIZE"
	"MACOS_FORCE_ENABLE_SHADOW|RESIZE|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW"
	"MACOS_FORCE_ENABLE_SHADOW|RESIZE|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS"
	"MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|RESIZE|INTEGRATED_BUTTONS"
	"MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|RESIZE"
	"MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|RESIZE"
	"MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|RESIZE|MACOS_FORCE_ENABLE_SHADOW"
	"MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|RESIZE"
	"MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|RESIZE|INTEGRATED_BUTTONS"
	"MACOS_FORCE_DISABLE_SHADOW|RESIZE|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS"
	"MACOS_FORCE_DISABLE_SHADOW|RESIZE|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW"
	"TITLE|RESIZE|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW"
	"TITLE|RESIZE|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW"
	"TITLE|RESIZE|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW"
	"TITLE|RESIZE|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS"
	"TITLE|RESIZE|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS"
	"TITLE|RESIZE|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW"
	"TITLE|INTEGRATED_BUTTONS|RESIZE|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW"
	"TITLE|INTEGRATED_BUTTONS|RESIZE|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW"
	"TITLE|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|RESIZE|MACOS_FORCE_DISABLE_SHADOW"
	"TITLE|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|RESIZE"
	"TITLE|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|RESIZE"
	"TITLE|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|RESIZE|MACOS_FORCE_ENABLE_SHADOW"
	"TITLE|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|RESIZE|MACOS_FORCE_DISABLE_SHADOW"
	"TITLE|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|RESIZE"
	"TITLE|MACOS_FORCE_ENABLE_SHADOW|RESIZE|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW"
	"TITLE|MACOS_FORCE_ENABLE_SHADOW|RESIZE|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS"
	"TITLE|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|RESIZE|INTEGRATED_BUTTONS"
	"TITLE|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|RESIZE"
	"TITLE|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|RESIZE"
	"TITLE|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|RESIZE|MACOS_FORCE_ENABLE_SHADOW"
	"TITLE|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|RESIZE"
	"TITLE|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|RESIZE|INTEGRATED_BUTTONS"
	"TITLE|MACOS_FORCE_DISABLE_SHADOW|RESIZE|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS"
	"TITLE|MACOS_FORCE_DISABLE_SHADOW|RESIZE|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW"
	"RESIZE|TITLE|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW"
	"RESIZE|TITLE|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW"
	"RESIZE|TITLE|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW"
	"RESIZE|TITLE|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS"
	"RESIZE|TITLE|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS"
	"RESIZE|TITLE|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW"
	"RESIZE|INTEGRATED_BUTTONS|TITLE|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW"
	"RESIZE|INTEGRATED_BUTTONS|TITLE|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW"
	"RESIZE|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|TITLE|MACOS_FORCE_DISABLE_SHADOW"
	"RESIZE|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|TITLE"
	"RESIZE|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|TITLE"
	"RESIZE|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|TITLE|MACOS_FORCE_ENABLE_SHADOW"
	"RESIZE|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|TITLE|MACOS_FORCE_DISABLE_SHADOW"
	"RESIZE|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|TITLE"
	"RESIZE|MACOS_FORCE_ENABLE_SHADOW|TITLE|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW"
	"RESIZE|MACOS_FORCE_ENABLE_SHADOW|TITLE|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS"
	"RESIZE|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|TITLE|INTEGRATED_BUTTONS"
	"RESIZE|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|TITLE"
	"RESIZE|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|TITLE"
	"RESIZE|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|TITLE|MACOS_FORCE_ENABLE_SHADOW"
	"RESIZE|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|TITLE"
	"RESIZE|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|TITLE|INTEGRATED_BUTTONS"
	"RESIZE|MACOS_FORCE_DISABLE_SHADOW|TITLE|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS"
	"RESIZE|MACOS_FORCE_DISABLE_SHADOW|TITLE|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW"
	"INTEGRATED_BUTTONS|RESIZE|TITLE|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW"
	"INTEGRATED_BUTTONS|RESIZE|TITLE|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW"
	"INTEGRATED_BUTTONS|RESIZE|MACOS_FORCE_ENABLE_SHADOW|TITLE|MACOS_FORCE_DISABLE_SHADOW"
	"INTEGRATED_BUTTONS|RESIZE|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|TITLE"
	"INTEGRATED_BUTTONS|RESIZE|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|TITLE"
	"INTEGRATED_BUTTONS|RESIZE|MACOS_FORCE_DISABLE_SHADOW|TITLE|MACOS_FORCE_ENABLE_SHADOW"
	"INTEGRATED_BUTTONS|TITLE|RESIZE|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW"
	"INTEGRATED_BUTTONS|TITLE|RESIZE|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW"
	"INTEGRATED_BUTTONS|TITLE|MACOS_FORCE_ENABLE_SHADOW|RESIZE|MACOS_FORCE_DISABLE_SHADOW"
	"INTEGRATED_BUTTONS|TITLE|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|RESIZE"
	"INTEGRATED_BUTTONS|TITLE|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|RESIZE"
	"INTEGRATED_BUTTONS|TITLE|MACOS_FORCE_DISABLE_SHADOW|RESIZE|MACOS_FORCE_ENABLE_SHADOW"
	"INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|TITLE|RESIZE|MACOS_FORCE_DISABLE_SHADOW"
	"INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|TITLE|MACOS_FORCE_DISABLE_SHADOW|RESIZE"
	"INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|RESIZE|TITLE|MACOS_FORCE_DISABLE_SHADOW"
	"INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|RESIZE|MACOS_FORCE_DISABLE_SHADOW|TITLE"
	"INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|RESIZE|TITLE"
	"INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|TITLE|RESIZE"
	"INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|TITLE|MACOS_FORCE_ENABLE_SHADOW|RESIZE"
	"INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|TITLE|RESIZE|MACOS_FORCE_ENABLE_SHADOW"
	"INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|TITLE|RESIZE"
	"INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|RESIZE|TITLE"
	"INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|RESIZE|MACOS_FORCE_ENABLE_SHADOW|TITLE"
	"INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|RESIZE|TITLE|MACOS_FORCE_ENABLE_SHADOW"
	"MACOS_FORCE_ENABLE_SHADOW|RESIZE|INTEGRATED_BUTTONS|TITLE|MACOS_FORCE_DISABLE_SHADOW"
	"MACOS_FORCE_ENABLE_SHADOW|RESIZE|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|TITLE"
	"MACOS_FORCE_ENABLE_SHADOW|RESIZE|TITLE|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW"
	"MACOS_FORCE_ENABLE_SHADOW|RESIZE|TITLE|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS"
	"MACOS_FORCE_ENABLE_SHADOW|RESIZE|MACOS_FORCE_DISABLE_SHADOW|TITLE|INTEGRATED_BUTTONS"
	"MACOS_FORCE_ENABLE_SHADOW|RESIZE|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|TITLE"
	"MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|RESIZE|TITLE|MACOS_FORCE_DISABLE_SHADOW"
	"MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|RESIZE|MACOS_FORCE_DISABLE_SHADOW|TITLE"
	"MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|TITLE|RESIZE|MACOS_FORCE_DISABLE_SHADOW"
	"MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|TITLE|MACOS_FORCE_DISABLE_SHADOW|RESIZE"
	"MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|TITLE|RESIZE"
	"MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|RESIZE|TITLE"
	"MACOS_FORCE_ENABLE_SHADOW|TITLE|INTEGRATED_BUTTONS|RESIZE|MACOS_FORCE_DISABLE_SHADOW"
	"MACOS_FORCE_ENABLE_SHADOW|TITLE|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|RESIZE"
	"MACOS_FORCE_ENABLE_SHADOW|TITLE|RESIZE|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW"
	"MACOS_FORCE_ENABLE_SHADOW|TITLE|RESIZE|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS"
	"MACOS_FORCE_ENABLE_SHADOW|TITLE|MACOS_FORCE_DISABLE_SHADOW|RESIZE|INTEGRATED_BUTTONS"
	"MACOS_FORCE_ENABLE_SHADOW|TITLE|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|RESIZE"
	"MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|TITLE|RESIZE"
	"MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|RESIZE|TITLE"
	"MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|TITLE|INTEGRATED_BUTTONS|RESIZE"
	"MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|TITLE|RESIZE|INTEGRATED_BUTTONS"
	"MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|RESIZE|TITLE|INTEGRATED_BUTTONS"
	"MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|RESIZE|INTEGRATED_BUTTONS|TITLE"
	"MACOS_FORCE_DISABLE_SHADOW|RESIZE|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|TITLE"
	"MACOS_FORCE_DISABLE_SHADOW|RESIZE|INTEGRATED_BUTTONS|TITLE|MACOS_FORCE_ENABLE_SHADOW"
	"MACOS_FORCE_DISABLE_SHADOW|RESIZE|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|TITLE"
	"MACOS_FORCE_DISABLE_SHADOW|RESIZE|MACOS_FORCE_ENABLE_SHADOW|TITLE|INTEGRATED_BUTTONS"
	"MACOS_FORCE_DISABLE_SHADOW|RESIZE|TITLE|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS"
	"MACOS_FORCE_DISABLE_SHADOW|RESIZE|TITLE|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW"
	"MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|RESIZE|MACOS_FORCE_ENABLE_SHADOW|TITLE"
	"MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|RESIZE|TITLE|MACOS_FORCE_ENABLE_SHADOW"
	"MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|RESIZE|TITLE"
	"MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|TITLE|RESIZE"
	"MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|TITLE|MACOS_FORCE_ENABLE_SHADOW|RESIZE"
	"MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|TITLE|RESIZE|MACOS_FORCE_ENABLE_SHADOW"
	"MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|RESIZE|TITLE"
	"MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|TITLE|RESIZE"
	"MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|RESIZE|INTEGRATED_BUTTONS|TITLE"
	"MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|RESIZE|TITLE|INTEGRATED_BUTTONS"
	"MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|TITLE|RESIZE|INTEGRATED_BUTTONS"
	"MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|TITLE|INTEGRATED_BUTTONS|RESIZE"
	"MACOS_FORCE_DISABLE_SHADOW|TITLE|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|RESIZE"
	"MACOS_FORCE_DISABLE_SHADOW|TITLE|INTEGRATED_BUTTONS|RESIZE|MACOS_FORCE_ENABLE_SHADOW"
	"MACOS_FORCE_DISABLE_SHADOW|TITLE|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|RESIZE"
	"MACOS_FORCE_DISABLE_SHADOW|TITLE|MACOS_FORCE_ENABLE_SHADOW|RESIZE|INTEGRATED_BUTTONS"
	"MACOS_FORCE_DISABLE_SHADOW|TITLE|RESIZE|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS"
	"MACOS_FORCE_DISABLE_SHADOW|TITLE|RESIZE|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW"
	"MACOS_FORCE_SQUARE_CORNERS"
	"RESIZE|MACOS_FORCE_SQUARE_CORNERS"
	"MACOS_FORCE_SQUARE_CORNERS|RESIZE"
	"MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_SQUARE_CORNERS"
	"MACOS_FORCE_SQUARE_CORNERS|MACOS_FORCE_ENABLE_SHADOW"
	"RESIZE|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_SQUARE_CORNERS"
	"RESIZE|MACOS_FORCE_SQUARE_CORNERS|MACOS_FORCE_ENABLE_SHADOW"
	"MACOS_FORCE_ENABLE_SHADOW|RESIZE|MACOS_FORCE_SQUARE_CORNERS"
	"MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_SQUARE_CORNERS|RESIZE"
	"MACOS_FORCE_SQUARE_CORNERS|MACOS_FORCE_ENABLE_SHADOW|RESIZE"
	"MACOS_FORCE_SQUARE_CORNERS|RESIZE|MACOS_FORCE_ENABLE_SHADOW"
	"MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_SQUARE_CORNERS"
	"MACOS_FORCE_SQUARE_CORNERS|MACOS_FORCE_DISABLE_SHADOW"
	"RESIZE|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_SQUARE_CORNERS"
	"RESIZE|MACOS_FORCE_SQUARE_CORNERS|MACOS_FORCE_DISABLE_SHADOW"
	"MACOS_FORCE_DISABLE_SHADOW|RESIZE|MACOS_FORCE_SQUARE_CORNERS"
	"MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_SQUARE_CORNERS|RESIZE"
	"MACOS_FORCE_SQUARE_CORNERS|MACOS_FORCE_DISABLE_SHADOW|RESIZE"
	"MACOS_FORCE_SQUARE_CORNERS|RESIZE|MACOS_FORCE_DISABLE_SHADOW"
	"MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_SQUARE_CORNERS"
	"MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_SQUARE_CORNERS|MACOS_FORCE_DISABLE_SHADOW"
	"MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_SQUARE_CORNERS"
	"MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_SQUARE_CORNERS|MACOS_FORCE_ENABLE_SHADOW"
	"MACOS_FORCE_SQUARE_CORNERS|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW"
	"MACOS_FORCE_SQUARE_CORNERS|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW"
	"RESIZE|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_SQUARE_CORNERS"
	"RESIZE|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_SQUARE_CORNERS|MACOS_FORCE_DISABLE_SHADOW"
	"RESIZE|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_SQUARE_CORNERS"
	"RESIZE|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_SQUARE_CORNERS|MACOS_FORCE_ENABLE_SHADOW"
	"RESIZE|MACOS_FORCE_SQUARE_CORNERS|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW"
	"RESIZE|MACOS_FORCE_SQUARE_CORNERS|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW"
	"MACOS_FORCE_ENABLE_SHADOW|RESIZE|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_SQUARE_CORNERS"
	"MACOS_FORCE_ENABLE_SHADOW|RESIZE|MACOS_FORCE_SQUARE_CORNERS|MACOS_FORCE_DISABLE_SHADOW"
	"MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|RESIZE|MACOS_FORCE_SQUARE_CORNERS"
	"MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_SQUARE_CORNERS|RESIZE"
	"MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_SQUARE_CORNERS|MACOS_FORCE_DISABLE_SHADOW|RESIZE"
	"MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_SQUARE_CORNERS|RESIZE|MACOS_FORCE_DISABLE_SHADOW"
	"MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|RESIZE|MACOS_FORCE_SQUARE_CORNERS"
	"MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_SQUARE_CORNERS|RESIZE"
	"MACOS_FORCE_DISABLE_SHADOW|RESIZE|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_SQUARE_CORNERS"
	"MACOS_FORCE_DISABLE_SHADOW|RESIZE|MACOS_FORCE_SQUARE_CORNERS|MACOS_FORCE_ENABLE_SHADOW"
	"MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_SQUARE_CORNERS|RESIZE|MACOS_FORCE_ENABLE_SHADOW"
	"MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_SQUARE_CORNERS|MACOS_FORCE_ENABLE_SHADOW|RESIZE"
	"MACOS_FORCE_SQUARE_CORNERS|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|RESIZE"
	"MACOS_FORCE_SQUARE_CORNERS|MACOS_FORCE_ENABLE_SHADOW|RESIZE|MACOS_FORCE_DISABLE_SHADOW"
	"MACOS_FORCE_SQUARE_CORNERS|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|RESIZE"
	"MACOS_FORCE_SQUARE_CORNERS|MACOS_FORCE_DISABLE_SHADOW|RESIZE|MACOS_FORCE_ENABLE_SHADOW"
	"MACOS_FORCE_SQUARE_CORNERS|RESIZE|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW"
	"MACOS_FORCE_SQUARE_CORNERS|RESIZE|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW"
	"TITLE|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE"
	"RESIZE|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|TITLE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|RESIZE"
	"TITLE|RESIZE|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"TITLE|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS"
	"TITLE|INTEGRATED_BUTTONS|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"TITLE|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE"
	"TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|RESIZE"
	"TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|INTEGRATED_BUTTONS"
	"RESIZE|TITLE|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"RESIZE|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS"
	"RESIZE|INTEGRATED_BUTTONS|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"RESIZE|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE"
	"RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|TITLE"
	"RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|INTEGRATED_BUTTONS"
	"INTEGRATED_BUTTONS|RESIZE|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"INTEGRATED_BUTTONS|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE"
	"INTEGRATED_BUTTONS|TITLE|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"INTEGRATED_BUTTONS|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE"
	"INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|RESIZE"
	"INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|TITLE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|INTEGRATED_BUTTONS|TITLE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|TITLE|INTEGRATED_BUTTONS"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|RESIZE|TITLE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|TITLE|RESIZE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|INTEGRATED_BUTTONS|RESIZE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|RESIZE|INTEGRATED_BUTTONS"
	"TITLE|RESIZE|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"TITLE|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW"
	"TITLE|MACOS_FORCE_ENABLE_SHADOW|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"TITLE|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE"
	"TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|RESIZE"
	"TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|MACOS_FORCE_ENABLE_SHADOW"
	"RESIZE|TITLE|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"RESIZE|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW"
	"RESIZE|MACOS_FORCE_ENABLE_SHADOW|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"RESIZE|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE"
	"RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|TITLE"
	"RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|MACOS_FORCE_ENABLE_SHADOW"
	"MACOS_FORCE_ENABLE_SHADOW|RESIZE|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"MACOS_FORCE_ENABLE_SHADOW|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE"
	"MACOS_FORCE_ENABLE_SHADOW|TITLE|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"MACOS_FORCE_ENABLE_SHADOW|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE"
	"MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|RESIZE"
	"MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|TITLE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|MACOS_FORCE_ENABLE_SHADOW|TITLE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|TITLE|MACOS_FORCE_ENABLE_SHADOW"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|RESIZE|TITLE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|TITLE|RESIZE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|MACOS_FORCE_ENABLE_SHADOW|RESIZE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|RESIZE|MACOS_FORCE_ENABLE_SHADOW"
	"TITLE|RESIZE|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"TITLE|RESIZE|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW"
	"TITLE|RESIZE|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"TITLE|RESIZE|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS"
	"TITLE|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS"
	"TITLE|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW"
	"TITLE|INTEGRATED_BUTTONS|RESIZE|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"TITLE|INTEGRATED_BUTTONS|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW"
	"TITLE|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"TITLE|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE"
	"TITLE|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|RESIZE"
	"TITLE|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|MACOS_FORCE_ENABLE_SHADOW"
	"TITLE|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"TITLE|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE"
	"TITLE|MACOS_FORCE_ENABLE_SHADOW|RESIZE|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"TITLE|MACOS_FORCE_ENABLE_SHADOW|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS"
	"TITLE|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|INTEGRATED_BUTTONS"
	"TITLE|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|RESIZE"
	"TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|RESIZE"
	"TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|RESIZE|MACOS_FORCE_ENABLE_SHADOW"
	"TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|RESIZE"
	"TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|RESIZE|INTEGRATED_BUTTONS"
	"TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS"
	"TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW"
	"RESIZE|TITLE|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"RESIZE|TITLE|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW"
	"RESIZE|TITLE|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"RESIZE|TITLE|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS"
	"RESIZE|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS"
	"RESIZE|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW"
	"RESIZE|INTEGRATED_BUTTONS|TITLE|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"RESIZE|INTEGRATED_BUTTONS|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW"
	"RESIZE|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"RESIZE|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE"
	"RESIZE|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|TITLE"
	"RESIZE|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|MACOS_FORCE_ENABLE_SHADOW"
	"RESIZE|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"RESIZE|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE"
	"RESIZE|MACOS_FORCE_ENABLE_SHADOW|TITLE|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"RESIZE|MACOS_FORCE_ENABLE_SHADOW|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS"
	"RESIZE|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|INTEGRATED_BUTTONS"
	"RESIZE|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|TITLE"
	"RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|TITLE"
	"RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|TITLE|MACOS_FORCE_ENABLE_SHADOW"
	"RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|TITLE"
	"RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|TITLE|INTEGRATED_BUTTONS"
	"RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS"
	"RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW"
	"INTEGRATED_BUTTONS|RESIZE|TITLE|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"INTEGRATED_BUTTONS|RESIZE|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW"
	"INTEGRATED_BUTTONS|RESIZE|MACOS_FORCE_ENABLE_SHADOW|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"INTEGRATED_BUTTONS|RESIZE|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE"
	"INTEGRATED_BUTTONS|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|TITLE"
	"INTEGRATED_BUTTONS|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|MACOS_FORCE_ENABLE_SHADOW"
	"INTEGRATED_BUTTONS|TITLE|RESIZE|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"INTEGRATED_BUTTONS|TITLE|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW"
	"INTEGRATED_BUTTONS|TITLE|MACOS_FORCE_ENABLE_SHADOW|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"INTEGRATED_BUTTONS|TITLE|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE"
	"INTEGRATED_BUTTONS|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|RESIZE"
	"INTEGRATED_BUTTONS|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|MACOS_FORCE_ENABLE_SHADOW"
	"INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|TITLE|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE"
	"INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|RESIZE|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE"
	"INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|TITLE"
	"INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|RESIZE"
	"INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|MACOS_FORCE_ENABLE_SHADOW|RESIZE"
	"INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|RESIZE|MACOS_FORCE_ENABLE_SHADOW"
	"INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|TITLE|RESIZE"
	"INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|RESIZE|TITLE"
	"INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|MACOS_FORCE_ENABLE_SHADOW|TITLE"
	"INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|TITLE|MACOS_FORCE_ENABLE_SHADOW"
	"MACOS_FORCE_ENABLE_SHADOW|RESIZE|INTEGRATED_BUTTONS|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"MACOS_FORCE_ENABLE_SHADOW|RESIZE|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE"
	"MACOS_FORCE_ENABLE_SHADOW|RESIZE|TITLE|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"MACOS_FORCE_ENABLE_SHADOW|RESIZE|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS"
	"MACOS_FORCE_ENABLE_SHADOW|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|INTEGRATED_BUTTONS"
	"MACOS_FORCE_ENABLE_SHADOW|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|TITLE"
	"MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|RESIZE|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE"
	"MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|TITLE|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE"
	"MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|RESIZE"
	"MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|TITLE"
	"MACOS_FORCE_ENABLE_SHADOW|TITLE|INTEGRATED_BUTTONS|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"MACOS_FORCE_ENABLE_SHADOW|TITLE|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE"
	"MACOS_FORCE_ENABLE_SHADOW|TITLE|RESIZE|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"MACOS_FORCE_ENABLE_SHADOW|TITLE|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS"
	"MACOS_FORCE_ENABLE_SHADOW|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|INTEGRATED_BUTTONS"
	"MACOS_FORCE_ENABLE_SHADOW|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|RESIZE"
	"MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|TITLE|RESIZE"
	"MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|RESIZE|TITLE"
	"MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|INTEGRATED_BUTTONS|RESIZE"
	"MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|RESIZE|INTEGRATED_BUTTONS"
	"MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|TITLE|INTEGRATED_BUTTONS"
	"MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|INTEGRATED_BUTTONS|TITLE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|TITLE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|INTEGRATED_BUTTONS|TITLE|MACOS_FORCE_ENABLE_SHADOW"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|TITLE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|MACOS_FORCE_ENABLE_SHADOW|TITLE|INTEGRATED_BUTTONS"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|TITLE|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|TITLE|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|RESIZE|MACOS_FORCE_ENABLE_SHADOW|TITLE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|RESIZE|TITLE|MACOS_FORCE_ENABLE_SHADOW"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|RESIZE|TITLE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|TITLE|RESIZE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|TITLE|MACOS_FORCE_ENABLE_SHADOW|RESIZE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|TITLE|RESIZE|MACOS_FORCE_ENABLE_SHADOW"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|RESIZE|TITLE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|TITLE|RESIZE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|RESIZE|INTEGRATED_BUTTONS|TITLE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|RESIZE|TITLE|INTEGRATED_BUTTONS"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|TITLE|RESIZE|INTEGRATED_BUTTONS"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|TITLE|INTEGRATED_BUTTONS|RESIZE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|RESIZE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|INTEGRATED_BUTTONS|RESIZE|MACOS_FORCE_ENABLE_SHADOW"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|RESIZE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|MACOS_FORCE_ENABLE_SHADOW|RESIZE|INTEGRATED_BUTTONS"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|RESIZE|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|RESIZE|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW"
	"TITLE|RESIZE|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"TITLE|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW"
	"TITLE|MACOS_FORCE_DISABLE_SHADOW|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"TITLE|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE"
	"TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|RESIZE"
	"TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|MACOS_FORCE_DISABLE_SHADOW"
	"RESIZE|TITLE|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"RESIZE|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW"
	"RESIZE|MACOS_FORCE_DISABLE_SHADOW|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"RESIZE|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE"
	"RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|TITLE"
	"RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|MACOS_FORCE_DISABLE_SHADOW"
	"MACOS_FORCE_DISABLE_SHADOW|RESIZE|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"MACOS_FORCE_DISABLE_SHADOW|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE"
	"MACOS_FORCE_DISABLE_SHADOW|TITLE|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"MACOS_FORCE_DISABLE_SHADOW|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE"
	"MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|RESIZE"
	"MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|TITLE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|MACOS_FORCE_DISABLE_SHADOW|TITLE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|TITLE|MACOS_FORCE_DISABLE_SHADOW"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|RESIZE|TITLE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|TITLE|RESIZE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|MACOS_FORCE_DISABLE_SHADOW|RESIZE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|RESIZE|MACOS_FORCE_DISABLE_SHADOW"
	"TITLE|RESIZE|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"TITLE|RESIZE|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW"
	"TITLE|RESIZE|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"TITLE|RESIZE|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS"
	"TITLE|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS"
	"TITLE|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW"
	"TITLE|INTEGRATED_BUTTONS|RESIZE|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"TITLE|INTEGRATED_BUTTONS|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW"
	"TITLE|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"TITLE|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE"
	"TITLE|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|RESIZE"
	"TITLE|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|MACOS_FORCE_DISABLE_SHADOW"
	"TITLE|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"TITLE|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE"
	"TITLE|MACOS_FORCE_DISABLE_SHADOW|RESIZE|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"TITLE|MACOS_FORCE_DISABLE_SHADOW|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS"
	"TITLE|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|INTEGRATED_BUTTONS"
	"TITLE|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|RESIZE"
	"TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|RESIZE"
	"TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|RESIZE|MACOS_FORCE_DISABLE_SHADOW"
	"TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|RESIZE"
	"TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|RESIZE|INTEGRATED_BUTTONS"
	"TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS"
	"TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW"
	"RESIZE|TITLE|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"RESIZE|TITLE|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW"
	"RESIZE|TITLE|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"RESIZE|TITLE|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS"
	"RESIZE|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS"
	"RESIZE|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW"
	"RESIZE|INTEGRATED_BUTTONS|TITLE|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"RESIZE|INTEGRATED_BUTTONS|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW"
	"RESIZE|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"RESIZE|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE"
	"RESIZE|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|TITLE"
	"RESIZE|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|MACOS_FORCE_DISABLE_SHADOW"
	"RESIZE|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"RESIZE|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE"
	"RESIZE|MACOS_FORCE_DISABLE_SHADOW|TITLE|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"RESIZE|MACOS_FORCE_DISABLE_SHADOW|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS"
	"RESIZE|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|INTEGRATED_BUTTONS"
	"RESIZE|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|TITLE"
	"RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|TITLE"
	"RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|TITLE|MACOS_FORCE_DISABLE_SHADOW"
	"RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|TITLE"
	"RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|TITLE|INTEGRATED_BUTTONS"
	"RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS"
	"RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW"
	"INTEGRATED_BUTTONS|RESIZE|TITLE|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"INTEGRATED_BUTTONS|RESIZE|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW"
	"INTEGRATED_BUTTONS|RESIZE|MACOS_FORCE_DISABLE_SHADOW|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"INTEGRATED_BUTTONS|RESIZE|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE"
	"INTEGRATED_BUTTONS|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|TITLE"
	"INTEGRATED_BUTTONS|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|MACOS_FORCE_DISABLE_SHADOW"
	"INTEGRATED_BUTTONS|TITLE|RESIZE|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"INTEGRATED_BUTTONS|TITLE|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW"
	"INTEGRATED_BUTTONS|TITLE|MACOS_FORCE_DISABLE_SHADOW|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"INTEGRATED_BUTTONS|TITLE|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE"
	"INTEGRATED_BUTTONS|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|RESIZE"
	"INTEGRATED_BUTTONS|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|MACOS_FORCE_DISABLE_SHADOW"
	"INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|TITLE|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE"
	"INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|RESIZE|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE"
	"INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|TITLE"
	"INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|RESIZE"
	"INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|MACOS_FORCE_DISABLE_SHADOW|RESIZE"
	"INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|RESIZE|MACOS_FORCE_DISABLE_SHADOW"
	"INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|TITLE|RESIZE"
	"INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|RESIZE|TITLE"
	"INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|MACOS_FORCE_DISABLE_SHADOW|TITLE"
	"INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|TITLE|MACOS_FORCE_DISABLE_SHADOW"
	"MACOS_FORCE_DISABLE_SHADOW|RESIZE|INTEGRATED_BUTTONS|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"MACOS_FORCE_DISABLE_SHADOW|RESIZE|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE"
	"MACOS_FORCE_DISABLE_SHADOW|RESIZE|TITLE|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"MACOS_FORCE_DISABLE_SHADOW|RESIZE|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS"
	"MACOS_FORCE_DISABLE_SHADOW|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|INTEGRATED_BUTTONS"
	"MACOS_FORCE_DISABLE_SHADOW|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|TITLE"
	"MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|RESIZE|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE"
	"MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|TITLE|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE"
	"MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|RESIZE"
	"MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|TITLE"
	"MACOS_FORCE_DISABLE_SHADOW|TITLE|INTEGRATED_BUTTONS|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"MACOS_FORCE_DISABLE_SHADOW|TITLE|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE"
	"MACOS_FORCE_DISABLE_SHADOW|TITLE|RESIZE|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"MACOS_FORCE_DISABLE_SHADOW|TITLE|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS"
	"MACOS_FORCE_DISABLE_SHADOW|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|INTEGRATED_BUTTONS"
	"MACOS_FORCE_DISABLE_SHADOW|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|RESIZE"
	"MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|TITLE|RESIZE"
	"MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|RESIZE|TITLE"
	"MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|INTEGRATED_BUTTONS|RESIZE"
	"MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|RESIZE|INTEGRATED_BUTTONS"
	"MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|TITLE|INTEGRATED_BUTTONS"
	"MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|INTEGRATED_BUTTONS|TITLE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|TITLE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|INTEGRATED_BUTTONS|TITLE|MACOS_FORCE_DISABLE_SHADOW"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|TITLE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|MACOS_FORCE_DISABLE_SHADOW|TITLE|INTEGRATED_BUTTONS"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|TITLE|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|TITLE|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|RESIZE|MACOS_FORCE_DISABLE_SHADOW|TITLE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|RESIZE|TITLE|MACOS_FORCE_DISABLE_SHADOW"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|RESIZE|TITLE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|TITLE|RESIZE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|TITLE|MACOS_FORCE_DISABLE_SHADOW|RESIZE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|TITLE|RESIZE|MACOS_FORCE_DISABLE_SHADOW"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|RESIZE|TITLE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|TITLE|RESIZE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|RESIZE|INTEGRATED_BUTTONS|TITLE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|RESIZE|TITLE|INTEGRATED_BUTTONS"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|TITLE|RESIZE|INTEGRATED_BUTTONS"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|TITLE|INTEGRATED_BUTTONS|RESIZE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|RESIZE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|INTEGRATED_BUTTONS|RESIZE|MACOS_FORCE_DISABLE_SHADOW"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|RESIZE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|MACOS_FORCE_DISABLE_SHADOW|RESIZE|INTEGRATED_BUTTONS"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|RESIZE|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|RESIZE|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW"
	"TITLE|RESIZE|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"TITLE|RESIZE|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW"
	"TITLE|RESIZE|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"TITLE|RESIZE|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW"
	"TITLE|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW"
	"TITLE|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW"
	"TITLE|MACOS_FORCE_ENABLE_SHADOW|RESIZE|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"TITLE|MACOS_FORCE_ENABLE_SHADOW|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW"
	"TITLE|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"TITLE|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE"
	"TITLE|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|RESIZE"
	"TITLE|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|MACOS_FORCE_DISABLE_SHADOW"
	"TITLE|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"TITLE|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE"
	"TITLE|MACOS_FORCE_DISABLE_SHADOW|RESIZE|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"TITLE|MACOS_FORCE_DISABLE_SHADOW|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW"
	"TITLE|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|MACOS_FORCE_ENABLE_SHADOW"
	"TITLE|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|RESIZE"
	"TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|RESIZE"
	"TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|RESIZE|MACOS_FORCE_DISABLE_SHADOW"
	"TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|RESIZE"
	"TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|RESIZE|MACOS_FORCE_ENABLE_SHADOW"
	"TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW"
	"TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW"
	"RESIZE|TITLE|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"RESIZE|TITLE|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW"
	"RESIZE|TITLE|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"RESIZE|TITLE|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW"
	"RESIZE|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW"
	"RESIZE|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW"
	"RESIZE|MACOS_FORCE_ENABLE_SHADOW|TITLE|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"RESIZE|MACOS_FORCE_ENABLE_SHADOW|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW"
	"RESIZE|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"RESIZE|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE"
	"RESIZE|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|TITLE"
	"RESIZE|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|MACOS_FORCE_DISABLE_SHADOW"
	"RESIZE|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"RESIZE|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE"
	"RESIZE|MACOS_FORCE_DISABLE_SHADOW|TITLE|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"RESIZE|MACOS_FORCE_DISABLE_SHADOW|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW"
	"RESIZE|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|MACOS_FORCE_ENABLE_SHADOW"
	"RESIZE|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|TITLE"
	"RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|TITLE"
	"RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|TITLE|MACOS_FORCE_DISABLE_SHADOW"
	"RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|TITLE"
	"RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|TITLE|MACOS_FORCE_ENABLE_SHADOW"
	"RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW"
	"RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW"
	"MACOS_FORCE_ENABLE_SHADOW|RESIZE|TITLE|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"MACOS_FORCE_ENABLE_SHADOW|RESIZE|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW"
	"MACOS_FORCE_ENABLE_SHADOW|RESIZE|MACOS_FORCE_DISABLE_SHADOW|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"MACOS_FORCE_ENABLE_SHADOW|RESIZE|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE"
	"MACOS_FORCE_ENABLE_SHADOW|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|TITLE"
	"MACOS_FORCE_ENABLE_SHADOW|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|MACOS_FORCE_DISABLE_SHADOW"
	"MACOS_FORCE_ENABLE_SHADOW|TITLE|RESIZE|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"MACOS_FORCE_ENABLE_SHADOW|TITLE|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW"
	"MACOS_FORCE_ENABLE_SHADOW|TITLE|MACOS_FORCE_DISABLE_SHADOW|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"MACOS_FORCE_ENABLE_SHADOW|TITLE|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE"
	"MACOS_FORCE_ENABLE_SHADOW|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|RESIZE"
	"MACOS_FORCE_ENABLE_SHADOW|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|MACOS_FORCE_DISABLE_SHADOW"
	"MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|TITLE|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE"
	"MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|RESIZE|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE"
	"MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|TITLE"
	"MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|RESIZE"
	"MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|MACOS_FORCE_DISABLE_SHADOW|RESIZE"
	"MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|RESIZE|MACOS_FORCE_DISABLE_SHADOW"
	"MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|TITLE|RESIZE"
	"MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|RESIZE|TITLE"
	"MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|MACOS_FORCE_DISABLE_SHADOW|TITLE"
	"MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|TITLE|MACOS_FORCE_DISABLE_SHADOW"
	"MACOS_FORCE_DISABLE_SHADOW|RESIZE|MACOS_FORCE_ENABLE_SHADOW|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"MACOS_FORCE_DISABLE_SHADOW|RESIZE|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE"
	"MACOS_FORCE_DISABLE_SHADOW|RESIZE|TITLE|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"MACOS_FORCE_DISABLE_SHADOW|RESIZE|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW"
	"MACOS_FORCE_DISABLE_SHADOW|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|MACOS_FORCE_ENABLE_SHADOW"
	"MACOS_FORCE_DISABLE_SHADOW|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|TITLE"
	"MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|RESIZE|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE"
	"MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|TITLE|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE"
	"MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|RESIZE"
	"MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|TITLE"
	"MACOS_FORCE_DISABLE_SHADOW|TITLE|MACOS_FORCE_ENABLE_SHADOW|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"MACOS_FORCE_DISABLE_SHADOW|TITLE|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE"
	"MACOS_FORCE_DISABLE_SHADOW|TITLE|RESIZE|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"MACOS_FORCE_DISABLE_SHADOW|TITLE|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW"
	"MACOS_FORCE_DISABLE_SHADOW|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|MACOS_FORCE_ENABLE_SHADOW"
	"MACOS_FORCE_DISABLE_SHADOW|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|RESIZE"
	"MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|TITLE|RESIZE"
	"MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|RESIZE|TITLE"
	"MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|MACOS_FORCE_ENABLE_SHADOW|RESIZE"
	"MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|RESIZE|MACOS_FORCE_ENABLE_SHADOW"
	"MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|TITLE|MACOS_FORCE_ENABLE_SHADOW"
	"MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|MACOS_FORCE_ENABLE_SHADOW|TITLE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|TITLE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|MACOS_FORCE_ENABLE_SHADOW|TITLE|MACOS_FORCE_DISABLE_SHADOW"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|TITLE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|MACOS_FORCE_DISABLE_SHADOW|TITLE|MACOS_FORCE_ENABLE_SHADOW"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|TITLE|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|TITLE|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|RESIZE|MACOS_FORCE_DISABLE_SHADOW|TITLE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|RESIZE|TITLE|MACOS_FORCE_DISABLE_SHADOW"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|RESIZE|TITLE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|TITLE|RESIZE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|TITLE|MACOS_FORCE_DISABLE_SHADOW|RESIZE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|TITLE|RESIZE|MACOS_FORCE_DISABLE_SHADOW"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|RESIZE|TITLE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|TITLE|RESIZE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|RESIZE|MACOS_FORCE_ENABLE_SHADOW|TITLE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|RESIZE|TITLE|MACOS_FORCE_ENABLE_SHADOW"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|TITLE|RESIZE|MACOS_FORCE_ENABLE_SHADOW"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|TITLE|MACOS_FORCE_ENABLE_SHADOW|RESIZE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|RESIZE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|MACOS_FORCE_ENABLE_SHADOW|RESIZE|MACOS_FORCE_DISABLE_SHADOW"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|RESIZE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|MACOS_FORCE_DISABLE_SHADOW|RESIZE|MACOS_FORCE_ENABLE_SHADOW"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|RESIZE|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|RESIZE|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW"
	"TITLE|RESIZE|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"TITLE|RESIZE|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW"
	"TITLE|RESIZE|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"TITLE|RESIZE|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW"
	"TITLE|RESIZE|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW"
	"TITLE|RESIZE|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW"
	"TITLE|RESIZE|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"TITLE|RESIZE|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW"
	"TITLE|RESIZE|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"TITLE|RESIZE|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS"
	"TITLE|RESIZE|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS"
	"TITLE|RESIZE|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW"
	"TITLE|RESIZE|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"TITLE|RESIZE|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS"
	"TITLE|RESIZE|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"TITLE|RESIZE|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW"
	"TITLE|RESIZE|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW"
	"TITLE|RESIZE|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS"
	"TITLE|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS"
	"TITLE|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW"
	"TITLE|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS"
	"TITLE|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW"
	"TITLE|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW"
	"TITLE|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW"
	"TITLE|INTEGRATED_BUTTONS|RESIZE|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"TITLE|INTEGRATED_BUTTONS|RESIZE|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW"
	"TITLE|INTEGRATED_BUTTONS|RESIZE|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"TITLE|INTEGRATED_BUTTONS|RESIZE|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW"
	"TITLE|INTEGRATED_BUTTONS|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW"
	"TITLE|INTEGRATED_BUTTONS|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW"
	"TITLE|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|RESIZE|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"TITLE|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW"
	"TITLE|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"TITLE|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE"
	"TITLE|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|RESIZE"
	"TITLE|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|MACOS_FORCE_DISABLE_SHADOW"
	"TITLE|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"TITLE|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE"
	"TITLE|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|RESIZE|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"TITLE|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW"
	"TITLE|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|MACOS_FORCE_ENABLE_SHADOW"
	"TITLE|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|RESIZE"
	"TITLE|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|RESIZE"
	"TITLE|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|RESIZE|MACOS_FORCE_DISABLE_SHADOW"
	"TITLE|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|RESIZE"
	"TITLE|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|RESIZE|MACOS_FORCE_ENABLE_SHADOW"
	"TITLE|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW"
	"TITLE|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW"
	"TITLE|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|RESIZE|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"TITLE|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW"
	"TITLE|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"TITLE|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE"
	"TITLE|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|RESIZE"
	"TITLE|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|MACOS_FORCE_DISABLE_SHADOW"
	"TITLE|MACOS_FORCE_ENABLE_SHADOW|RESIZE|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"TITLE|MACOS_FORCE_ENABLE_SHADOW|RESIZE|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW"
	"TITLE|MACOS_FORCE_ENABLE_SHADOW|RESIZE|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"TITLE|MACOS_FORCE_ENABLE_SHADOW|RESIZE|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS"
	"TITLE|MACOS_FORCE_ENABLE_SHADOW|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS"
	"TITLE|MACOS_FORCE_ENABLE_SHADOW|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW"
	"TITLE|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|RESIZE|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"TITLE|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS"
	"TITLE|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"TITLE|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE"
	"TITLE|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|RESIZE"
	"TITLE|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|INTEGRATED_BUTTONS"
	"TITLE|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS"
	"TITLE|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW"
	"TITLE|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|RESIZE|INTEGRATED_BUTTONS"
	"TITLE|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|RESIZE"
	"TITLE|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|RESIZE"
	"TITLE|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|RESIZE|MACOS_FORCE_DISABLE_SHADOW"
	"TITLE|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"TITLE|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE"
	"TITLE|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|RESIZE|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"TITLE|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW"
	"TITLE|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|MACOS_FORCE_ENABLE_SHADOW"
	"TITLE|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|RESIZE"
	"TITLE|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"TITLE|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE"
	"TITLE|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|RESIZE|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"TITLE|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS"
	"TITLE|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|INTEGRATED_BUTTONS"
	"TITLE|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|RESIZE"
	"TITLE|MACOS_FORCE_DISABLE_SHADOW|RESIZE|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"TITLE|MACOS_FORCE_DISABLE_SHADOW|RESIZE|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS"
	"TITLE|MACOS_FORCE_DISABLE_SHADOW|RESIZE|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"TITLE|MACOS_FORCE_DISABLE_SHADOW|RESIZE|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW"
	"TITLE|MACOS_FORCE_DISABLE_SHADOW|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW"
	"TITLE|MACOS_FORCE_DISABLE_SHADOW|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS"
	"TITLE|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|RESIZE|INTEGRATED_BUTTONS"
	"TITLE|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|RESIZE"
	"TITLE|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS"
	"TITLE|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW"
	"TITLE|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|RESIZE|MACOS_FORCE_ENABLE_SHADOW"
	"TITLE|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|RESIZE"
	"TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|RESIZE"
	"TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|RESIZE|MACOS_FORCE_DISABLE_SHADOW"
	"TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|RESIZE"
	"TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|RESIZE|MACOS_FORCE_ENABLE_SHADOW"
	"TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|RESIZE|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW"
	"TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|RESIZE|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW"
	"TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|RESIZE"
	"TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|RESIZE|MACOS_FORCE_DISABLE_SHADOW"
	"TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|RESIZE"
	"TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|RESIZE|INTEGRATED_BUTTONS"
	"TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|RESIZE|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS"
	"TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|RESIZE|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW"
	"TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|RESIZE"
	"TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|RESIZE|INTEGRATED_BUTTONS"
	"TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|RESIZE"
	"TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|RESIZE|MACOS_FORCE_ENABLE_SHADOW"
	"TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|RESIZE|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW"
	"TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|RESIZE|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS"
	"TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS"
	"TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW"
	"TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS"
	"TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW"
	"TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW"
	"TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW"
	"RESIZE|TITLE|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"RESIZE|TITLE|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW"
	"RESIZE|TITLE|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"RESIZE|TITLE|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW"
	"RESIZE|TITLE|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW"
	"RESIZE|TITLE|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW"
	"RESIZE|TITLE|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"RESIZE|TITLE|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW"
	"RESIZE|TITLE|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"RESIZE|TITLE|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS"
	"RESIZE|TITLE|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS"
	"RESIZE|TITLE|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW"
	"RESIZE|TITLE|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"RESIZE|TITLE|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS"
	"RESIZE|TITLE|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"RESIZE|TITLE|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW"
	"RESIZE|TITLE|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW"
	"RESIZE|TITLE|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS"
	"RESIZE|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS"
	"RESIZE|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW"
	"RESIZE|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS"
	"RESIZE|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW"
	"RESIZE|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW"
	"RESIZE|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW"
	"RESIZE|INTEGRATED_BUTTONS|TITLE|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"RESIZE|INTEGRATED_BUTTONS|TITLE|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW"
	"RESIZE|INTEGRATED_BUTTONS|TITLE|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"RESIZE|INTEGRATED_BUTTONS|TITLE|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW"
	"RESIZE|INTEGRATED_BUTTONS|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW"
	"RESIZE|INTEGRATED_BUTTONS|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW"
	"RESIZE|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|TITLE|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"RESIZE|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW"
	"RESIZE|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"RESIZE|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE"
	"RESIZE|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|TITLE"
	"RESIZE|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|MACOS_FORCE_DISABLE_SHADOW"
	"RESIZE|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"RESIZE|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE"
	"RESIZE|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|TITLE|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"RESIZE|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW"
	"RESIZE|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|MACOS_FORCE_ENABLE_SHADOW"
	"RESIZE|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|TITLE"
	"RESIZE|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|TITLE"
	"RESIZE|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|TITLE|MACOS_FORCE_DISABLE_SHADOW"
	"RESIZE|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|TITLE"
	"RESIZE|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|TITLE|MACOS_FORCE_ENABLE_SHADOW"
	"RESIZE|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW"
	"RESIZE|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW"
	"RESIZE|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|TITLE|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"RESIZE|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW"
	"RESIZE|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"RESIZE|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE"
	"RESIZE|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|TITLE"
	"RESIZE|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|MACOS_FORCE_DISABLE_SHADOW"
	"RESIZE|MACOS_FORCE_ENABLE_SHADOW|TITLE|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"RESIZE|MACOS_FORCE_ENABLE_SHADOW|TITLE|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW"
	"RESIZE|MACOS_FORCE_ENABLE_SHADOW|TITLE|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"RESIZE|MACOS_FORCE_ENABLE_SHADOW|TITLE|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS"
	"RESIZE|MACOS_FORCE_ENABLE_SHADOW|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS"
	"RESIZE|MACOS_FORCE_ENABLE_SHADOW|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW"
	"RESIZE|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|TITLE|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"RESIZE|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS"
	"RESIZE|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"RESIZE|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE"
	"RESIZE|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|TITLE"
	"RESIZE|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|INTEGRATED_BUTTONS"
	"RESIZE|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS"
	"RESIZE|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW"
	"RESIZE|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|TITLE|INTEGRATED_BUTTONS"
	"RESIZE|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|TITLE"
	"RESIZE|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|TITLE"
	"RESIZE|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|TITLE|MACOS_FORCE_DISABLE_SHADOW"
	"RESIZE|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"RESIZE|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE"
	"RESIZE|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|TITLE|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"RESIZE|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW"
	"RESIZE|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|MACOS_FORCE_ENABLE_SHADOW"
	"RESIZE|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|TITLE"
	"RESIZE|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"RESIZE|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE"
	"RESIZE|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|TITLE|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"RESIZE|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS"
	"RESIZE|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|INTEGRATED_BUTTONS"
	"RESIZE|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|TITLE"
	"RESIZE|MACOS_FORCE_DISABLE_SHADOW|TITLE|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"RESIZE|MACOS_FORCE_DISABLE_SHADOW|TITLE|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS"
	"RESIZE|MACOS_FORCE_DISABLE_SHADOW|TITLE|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"RESIZE|MACOS_FORCE_DISABLE_SHADOW|TITLE|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW"
	"RESIZE|MACOS_FORCE_DISABLE_SHADOW|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW"
	"RESIZE|MACOS_FORCE_DISABLE_SHADOW|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS"
	"RESIZE|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|TITLE|INTEGRATED_BUTTONS"
	"RESIZE|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|TITLE"
	"RESIZE|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS"
	"RESIZE|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW"
	"RESIZE|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|TITLE|MACOS_FORCE_ENABLE_SHADOW"
	"RESIZE|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|TITLE"
	"RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|TITLE"
	"RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|TITLE|MACOS_FORCE_DISABLE_SHADOW"
	"RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|TITLE"
	"RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|TITLE|MACOS_FORCE_ENABLE_SHADOW"
	"RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|TITLE|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW"
	"RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|TITLE|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW"
	"RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|TITLE"
	"RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|TITLE|MACOS_FORCE_DISABLE_SHADOW"
	"RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|TITLE"
	"RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|TITLE|INTEGRATED_BUTTONS"
	"RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|TITLE|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS"
	"RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|TITLE|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW"
	"RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|TITLE"
	"RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|TITLE|INTEGRATED_BUTTONS"
	"RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|TITLE"
	"RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|TITLE|MACOS_FORCE_ENABLE_SHADOW"
	"RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|TITLE|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW"
	"RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|TITLE|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS"
	"RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS"
	"RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW"
	"RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS"
	"RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW"
	"RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW"
	"RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW"
	"INTEGRATED_BUTTONS|RESIZE|TITLE|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"INTEGRATED_BUTTONS|RESIZE|TITLE|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW"
	"INTEGRATED_BUTTONS|RESIZE|TITLE|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"INTEGRATED_BUTTONS|RESIZE|TITLE|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW"
	"INTEGRATED_BUTTONS|RESIZE|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW"
	"INTEGRATED_BUTTONS|RESIZE|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW"
	"INTEGRATED_BUTTONS|RESIZE|MACOS_FORCE_ENABLE_SHADOW|TITLE|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"INTEGRATED_BUTTONS|RESIZE|MACOS_FORCE_ENABLE_SHADOW|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW"
	"INTEGRATED_BUTTONS|RESIZE|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"INTEGRATED_BUTTONS|RESIZE|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE"
	"INTEGRATED_BUTTONS|RESIZE|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|TITLE"
	"INTEGRATED_BUTTONS|RESIZE|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|MACOS_FORCE_DISABLE_SHADOW"
	"INTEGRATED_BUTTONS|RESIZE|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"INTEGRATED_BUTTONS|RESIZE|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE"
	"INTEGRATED_BUTTONS|RESIZE|MACOS_FORCE_DISABLE_SHADOW|TITLE|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"INTEGRATED_BUTTONS|RESIZE|MACOS_FORCE_DISABLE_SHADOW|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW"
	"INTEGRATED_BUTTONS|RESIZE|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|MACOS_FORCE_ENABLE_SHADOW"
	"INTEGRATED_BUTTONS|RESIZE|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|TITLE"
	"INTEGRATED_BUTTONS|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|TITLE"
	"INTEGRATED_BUTTONS|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|TITLE|MACOS_FORCE_DISABLE_SHADOW"
	"INTEGRATED_BUTTONS|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|TITLE"
	"INTEGRATED_BUTTONS|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|TITLE|MACOS_FORCE_ENABLE_SHADOW"
	"INTEGRATED_BUTTONS|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW"
	"INTEGRATED_BUTTONS|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW"
	"INTEGRATED_BUTTONS|TITLE|RESIZE|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"INTEGRATED_BUTTONS|TITLE|RESIZE|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW"
	"INTEGRATED_BUTTONS|TITLE|RESIZE|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"INTEGRATED_BUTTONS|TITLE|RESIZE|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW"
	"INTEGRATED_BUTTONS|TITLE|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW"
	"INTEGRATED_BUTTONS|TITLE|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW"
	"INTEGRATED_BUTTONS|TITLE|MACOS_FORCE_ENABLE_SHADOW|RESIZE|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"INTEGRATED_BUTTONS|TITLE|MACOS_FORCE_ENABLE_SHADOW|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW"
	"INTEGRATED_BUTTONS|TITLE|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"INTEGRATED_BUTTONS|TITLE|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE"
	"INTEGRATED_BUTTONS|TITLE|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|RESIZE"
	"INTEGRATED_BUTTONS|TITLE|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|MACOS_FORCE_DISABLE_SHADOW"
	"INTEGRATED_BUTTONS|TITLE|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"INTEGRATED_BUTTONS|TITLE|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE"
	"INTEGRATED_BUTTONS|TITLE|MACOS_FORCE_DISABLE_SHADOW|RESIZE|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"INTEGRATED_BUTTONS|TITLE|MACOS_FORCE_DISABLE_SHADOW|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW"
	"INTEGRATED_BUTTONS|TITLE|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|MACOS_FORCE_ENABLE_SHADOW"
	"INTEGRATED_BUTTONS|TITLE|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|RESIZE"
	"INTEGRATED_BUTTONS|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|RESIZE"
	"INTEGRATED_BUTTONS|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|RESIZE|MACOS_FORCE_DISABLE_SHADOW"
	"INTEGRATED_BUTTONS|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|RESIZE"
	"INTEGRATED_BUTTONS|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|RESIZE|MACOS_FORCE_ENABLE_SHADOW"
	"INTEGRATED_BUTTONS|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW"
	"INTEGRATED_BUTTONS|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW"
	"INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|TITLE|RESIZE|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|TITLE|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW"
	"INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|TITLE|MACOS_FORCE_DISABLE_SHADOW|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|TITLE|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE"
	"INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|RESIZE"
	"INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|MACOS_FORCE_DISABLE_SHADOW"
	"INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|RESIZE|TITLE|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|RESIZE|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW"
	"INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|RESIZE|MACOS_FORCE_DISABLE_SHADOW|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|RESIZE|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE"
	"INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|TITLE"
	"INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|MACOS_FORCE_DISABLE_SHADOW"
	"INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|RESIZE|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE"
	"INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|TITLE|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE"
	"INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|RESIZE"
	"INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|TITLE"
	"INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|MACOS_FORCE_DISABLE_SHADOW|TITLE"
	"INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|TITLE|MACOS_FORCE_DISABLE_SHADOW"
	"INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|RESIZE|TITLE"
	"INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|TITLE|RESIZE"
	"INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|MACOS_FORCE_DISABLE_SHADOW|RESIZE"
	"INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|RESIZE|MACOS_FORCE_DISABLE_SHADOW"
	"INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|TITLE|MACOS_FORCE_ENABLE_SHADOW|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|TITLE|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE"
	"INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|TITLE|RESIZE|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|TITLE|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW"
	"INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|MACOS_FORCE_ENABLE_SHADOW"
	"INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|RESIZE"
	"INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|TITLE|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE"
	"INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|RESIZE|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE"
	"INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|TITLE"
	"INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|RESIZE"
	"INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|RESIZE|MACOS_FORCE_ENABLE_SHADOW|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|RESIZE|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE"
	"INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|RESIZE|TITLE|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|RESIZE|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW"
	"INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|MACOS_FORCE_ENABLE_SHADOW"
	"INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|TITLE"
	"INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|RESIZE|TITLE"
	"INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|TITLE|RESIZE"
	"INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|MACOS_FORCE_ENABLE_SHADOW|TITLE"
	"INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|TITLE|MACOS_FORCE_ENABLE_SHADOW"
	"INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|RESIZE|MACOS_FORCE_ENABLE_SHADOW"
	"INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|MACOS_FORCE_ENABLE_SHADOW|RESIZE"
	"INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|RESIZE"
	"INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|MACOS_FORCE_ENABLE_SHADOW|RESIZE|MACOS_FORCE_DISABLE_SHADOW"
	"INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|RESIZE"
	"INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|MACOS_FORCE_DISABLE_SHADOW|RESIZE|MACOS_FORCE_ENABLE_SHADOW"
	"INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|RESIZE|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW"
	"INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|RESIZE|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW"
	"INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|TITLE|MACOS_FORCE_DISABLE_SHADOW|RESIZE"
	"INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|TITLE|RESIZE|MACOS_FORCE_DISABLE_SHADOW"
	"INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|TITLE|RESIZE"
	"INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|RESIZE|TITLE"
	"INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|RESIZE|MACOS_FORCE_DISABLE_SHADOW|TITLE"
	"INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|RESIZE|TITLE|MACOS_FORCE_DISABLE_SHADOW"
	"INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|TITLE|RESIZE"
	"INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|RESIZE|TITLE"
	"INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|TITLE|MACOS_FORCE_ENABLE_SHADOW|RESIZE"
	"INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|TITLE|RESIZE|MACOS_FORCE_ENABLE_SHADOW"
	"INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|RESIZE|TITLE|MACOS_FORCE_ENABLE_SHADOW"
	"INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|RESIZE|MACOS_FORCE_ENABLE_SHADOW|TITLE"
	"INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|TITLE"
	"INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|MACOS_FORCE_ENABLE_SHADOW|TITLE|MACOS_FORCE_DISABLE_SHADOW"
	"INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|TITLE"
	"INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|MACOS_FORCE_DISABLE_SHADOW|TITLE|MACOS_FORCE_ENABLE_SHADOW"
	"INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|TITLE|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW"
	"INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|TITLE|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW"
	"MACOS_FORCE_ENABLE_SHADOW|RESIZE|INTEGRATED_BUTTONS|TITLE|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"MACOS_FORCE_ENABLE_SHADOW|RESIZE|INTEGRATED_BUTTONS|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW"
	"MACOS_FORCE_ENABLE_SHADOW|RESIZE|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"MACOS_FORCE_ENABLE_SHADOW|RESIZE|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE"
	"MACOS_FORCE_ENABLE_SHADOW|RESIZE|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|TITLE"
	"MACOS_FORCE_ENABLE_SHADOW|RESIZE|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|MACOS_FORCE_DISABLE_SHADOW"
	"MACOS_FORCE_ENABLE_SHADOW|RESIZE|TITLE|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"MACOS_FORCE_ENABLE_SHADOW|RESIZE|TITLE|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW"
	"MACOS_FORCE_ENABLE_SHADOW|RESIZE|TITLE|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"MACOS_FORCE_ENABLE_SHADOW|RESIZE|TITLE|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS"
	"MACOS_FORCE_ENABLE_SHADOW|RESIZE|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS"
	"MACOS_FORCE_ENABLE_SHADOW|RESIZE|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW"
	"MACOS_FORCE_ENABLE_SHADOW|RESIZE|MACOS_FORCE_DISABLE_SHADOW|TITLE|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"MACOS_FORCE_ENABLE_SHADOW|RESIZE|MACOS_FORCE_DISABLE_SHADOW|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS"
	"MACOS_FORCE_ENABLE_SHADOW|RESIZE|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"MACOS_FORCE_ENABLE_SHADOW|RESIZE|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE"
	"MACOS_FORCE_ENABLE_SHADOW|RESIZE|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|TITLE"
	"MACOS_FORCE_ENABLE_SHADOW|RESIZE|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|INTEGRATED_BUTTONS"
	"MACOS_FORCE_ENABLE_SHADOW|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS"
	"MACOS_FORCE_ENABLE_SHADOW|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW"
	"MACOS_FORCE_ENABLE_SHADOW|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|TITLE|INTEGRATED_BUTTONS"
	"MACOS_FORCE_ENABLE_SHADOW|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|TITLE"
	"MACOS_FORCE_ENABLE_SHADOW|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|TITLE"
	"MACOS_FORCE_ENABLE_SHADOW|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|TITLE|MACOS_FORCE_DISABLE_SHADOW"
	"MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|RESIZE|TITLE|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|RESIZE|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW"
	"MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|RESIZE|MACOS_FORCE_DISABLE_SHADOW|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|RESIZE|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE"
	"MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|TITLE"
	"MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|MACOS_FORCE_DISABLE_SHADOW"
	"MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|TITLE|RESIZE|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|TITLE|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW"
	"MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|TITLE|MACOS_FORCE_DISABLE_SHADOW|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|TITLE|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE"
	"MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|RESIZE"
	"MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|MACOS_FORCE_DISABLE_SHADOW"
	"MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|TITLE|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE"
	"MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|RESIZE|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE"
	"MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|TITLE"
	"MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|RESIZE"
	"MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|MACOS_FORCE_DISABLE_SHADOW|RESIZE"
	"MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|RESIZE|MACOS_FORCE_DISABLE_SHADOW"
	"MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|TITLE|RESIZE"
	"MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|RESIZE|TITLE"
	"MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|MACOS_FORCE_DISABLE_SHADOW|TITLE"
	"MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|TITLE|MACOS_FORCE_DISABLE_SHADOW"
	"MACOS_FORCE_ENABLE_SHADOW|TITLE|INTEGRATED_BUTTONS|RESIZE|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"MACOS_FORCE_ENABLE_SHADOW|TITLE|INTEGRATED_BUTTONS|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW"
	"MACOS_FORCE_ENABLE_SHADOW|TITLE|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"MACOS_FORCE_ENABLE_SHADOW|TITLE|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE"
	"MACOS_FORCE_ENABLE_SHADOW|TITLE|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|RESIZE"
	"MACOS_FORCE_ENABLE_SHADOW|TITLE|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|MACOS_FORCE_DISABLE_SHADOW"
	"MACOS_FORCE_ENABLE_SHADOW|TITLE|RESIZE|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"MACOS_FORCE_ENABLE_SHADOW|TITLE|RESIZE|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW"
	"MACOS_FORCE_ENABLE_SHADOW|TITLE|RESIZE|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"MACOS_FORCE_ENABLE_SHADOW|TITLE|RESIZE|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS"
	"MACOS_FORCE_ENABLE_SHADOW|TITLE|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS"
	"MACOS_FORCE_ENABLE_SHADOW|TITLE|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW"
	"MACOS_FORCE_ENABLE_SHADOW|TITLE|MACOS_FORCE_DISABLE_SHADOW|RESIZE|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"MACOS_FORCE_ENABLE_SHADOW|TITLE|MACOS_FORCE_DISABLE_SHADOW|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS"
	"MACOS_FORCE_ENABLE_SHADOW|TITLE|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"MACOS_FORCE_ENABLE_SHADOW|TITLE|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE"
	"MACOS_FORCE_ENABLE_SHADOW|TITLE|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|RESIZE"
	"MACOS_FORCE_ENABLE_SHADOW|TITLE|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|INTEGRATED_BUTTONS"
	"MACOS_FORCE_ENABLE_SHADOW|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS"
	"MACOS_FORCE_ENABLE_SHADOW|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW"
	"MACOS_FORCE_ENABLE_SHADOW|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|RESIZE|INTEGRATED_BUTTONS"
	"MACOS_FORCE_ENABLE_SHADOW|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|RESIZE"
	"MACOS_FORCE_ENABLE_SHADOW|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|RESIZE"
	"MACOS_FORCE_ENABLE_SHADOW|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|RESIZE|MACOS_FORCE_DISABLE_SHADOW"
	"MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|TITLE|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE"
	"MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|RESIZE|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE"
	"MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|TITLE"
	"MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|RESIZE"
	"MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|TITLE|INTEGRATED_BUTTONS|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|TITLE|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE"
	"MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|TITLE|RESIZE|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|TITLE|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS"
	"MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|INTEGRATED_BUTTONS"
	"MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|RESIZE"
	"MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|RESIZE|TITLE|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|RESIZE|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS"
	"MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|RESIZE|INTEGRATED_BUTTONS|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|RESIZE|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE"
	"MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|TITLE"
	"MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|INTEGRATED_BUTTONS"
	"MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|RESIZE|INTEGRATED_BUTTONS"
	"MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|INTEGRATED_BUTTONS|RESIZE"
	"MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|TITLE|INTEGRATED_BUTTONS"
	"MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|INTEGRATED_BUTTONS|TITLE"
	"MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|RESIZE|TITLE"
	"MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|TITLE|RESIZE"
	"MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|TITLE|MACOS_FORCE_DISABLE_SHADOW|RESIZE"
	"MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|TITLE|RESIZE|MACOS_FORCE_DISABLE_SHADOW"
	"MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|TITLE|RESIZE"
	"MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|RESIZE|TITLE"
	"MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|RESIZE|MACOS_FORCE_DISABLE_SHADOW|TITLE"
	"MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|RESIZE|TITLE|MACOS_FORCE_DISABLE_SHADOW"
	"MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|RESIZE"
	"MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|INTEGRATED_BUTTONS|RESIZE|MACOS_FORCE_DISABLE_SHADOW"
	"MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|RESIZE"
	"MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|MACOS_FORCE_DISABLE_SHADOW|RESIZE|INTEGRATED_BUTTONS"
	"MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|RESIZE|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS"
	"MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|RESIZE|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW"
	"MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|TITLE|INTEGRATED_BUTTONS|RESIZE"
	"MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|TITLE|RESIZE|INTEGRATED_BUTTONS"
	"MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|TITLE|RESIZE"
	"MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|RESIZE|TITLE"
	"MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|RESIZE|INTEGRATED_BUTTONS|TITLE"
	"MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|RESIZE|TITLE|INTEGRATED_BUTTONS"
	"MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|TITLE|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS"
	"MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|TITLE|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW"
	"MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|MACOS_FORCE_DISABLE_SHADOW|TITLE|INTEGRATED_BUTTONS"
	"MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|TITLE"
	"MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|TITLE"
	"MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|INTEGRATED_BUTTONS|TITLE|MACOS_FORCE_DISABLE_SHADOW"
	"MACOS_FORCE_DISABLE_SHADOW|RESIZE|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"MACOS_FORCE_DISABLE_SHADOW|RESIZE|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE"
	"MACOS_FORCE_DISABLE_SHADOW|RESIZE|INTEGRATED_BUTTONS|TITLE|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"MACOS_FORCE_DISABLE_SHADOW|RESIZE|INTEGRATED_BUTTONS|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW"
	"MACOS_FORCE_DISABLE_SHADOW|RESIZE|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|MACOS_FORCE_ENABLE_SHADOW"
	"MACOS_FORCE_DISABLE_SHADOW|RESIZE|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|TITLE"
	"MACOS_FORCE_DISABLE_SHADOW|RESIZE|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"MACOS_FORCE_DISABLE_SHADOW|RESIZE|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE"
	"MACOS_FORCE_DISABLE_SHADOW|RESIZE|MACOS_FORCE_ENABLE_SHADOW|TITLE|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"MACOS_FORCE_DISABLE_SHADOW|RESIZE|MACOS_FORCE_ENABLE_SHADOW|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS"
	"MACOS_FORCE_DISABLE_SHADOW|RESIZE|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|INTEGRATED_BUTTONS"
	"MACOS_FORCE_DISABLE_SHADOW|RESIZE|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|TITLE"
	"MACOS_FORCE_DISABLE_SHADOW|RESIZE|TITLE|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"MACOS_FORCE_DISABLE_SHADOW|RESIZE|TITLE|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS"
	"MACOS_FORCE_DISABLE_SHADOW|RESIZE|TITLE|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"MACOS_FORCE_DISABLE_SHADOW|RESIZE|TITLE|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW"
	"MACOS_FORCE_DISABLE_SHADOW|RESIZE|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW"
	"MACOS_FORCE_DISABLE_SHADOW|RESIZE|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS"
	"MACOS_FORCE_DISABLE_SHADOW|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|TITLE|INTEGRATED_BUTTONS"
	"MACOS_FORCE_DISABLE_SHADOW|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|TITLE"
	"MACOS_FORCE_DISABLE_SHADOW|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS"
	"MACOS_FORCE_DISABLE_SHADOW|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW"
	"MACOS_FORCE_DISABLE_SHADOW|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|TITLE|MACOS_FORCE_ENABLE_SHADOW"
	"MACOS_FORCE_DISABLE_SHADOW|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|TITLE"
	"MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|RESIZE|MACOS_FORCE_ENABLE_SHADOW|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|RESIZE|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE"
	"MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|RESIZE|TITLE|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|RESIZE|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW"
	"MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|MACOS_FORCE_ENABLE_SHADOW"
	"MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|TITLE"
	"MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|RESIZE|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE"
	"MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|TITLE|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE"
	"MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|RESIZE"
	"MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|TITLE"
	"MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|TITLE|MACOS_FORCE_ENABLE_SHADOW|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|TITLE|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE"
	"MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|TITLE|RESIZE|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|TITLE|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW"
	"MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|MACOS_FORCE_ENABLE_SHADOW"
	"MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|RESIZE"
	"MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|TITLE|RESIZE"
	"MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|RESIZE|TITLE"
	"MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|MACOS_FORCE_ENABLE_SHADOW|RESIZE"
	"MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|RESIZE|MACOS_FORCE_ENABLE_SHADOW"
	"MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|TITLE|MACOS_FORCE_ENABLE_SHADOW"
	"MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|MACOS_FORCE_ENABLE_SHADOW|TITLE"
	"MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|RESIZE|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE"
	"MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|TITLE|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE"
	"MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|RESIZE"
	"MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|TITLE"
	"MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|RESIZE|INTEGRATED_BUTTONS|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|RESIZE|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE"
	"MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|RESIZE|TITLE|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|RESIZE|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS"
	"MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|INTEGRATED_BUTTONS"
	"MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|TITLE"
	"MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|TITLE|RESIZE|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|TITLE|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS"
	"MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|TITLE|INTEGRATED_BUTTONS|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|TITLE|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE"
	"MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|RESIZE"
	"MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|INTEGRATED_BUTTONS"
	"MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|TITLE|INTEGRATED_BUTTONS"
	"MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|INTEGRATED_BUTTONS|TITLE"
	"MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|RESIZE|INTEGRATED_BUTTONS"
	"MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|INTEGRATED_BUTTONS|RESIZE"
	"MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|TITLE|RESIZE"
	"MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|RESIZE|TITLE"
	"MACOS_FORCE_DISABLE_SHADOW|TITLE|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"MACOS_FORCE_DISABLE_SHADOW|TITLE|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE"
	"MACOS_FORCE_DISABLE_SHADOW|TITLE|INTEGRATED_BUTTONS|RESIZE|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"MACOS_FORCE_DISABLE_SHADOW|TITLE|INTEGRATED_BUTTONS|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW"
	"MACOS_FORCE_DISABLE_SHADOW|TITLE|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|MACOS_FORCE_ENABLE_SHADOW"
	"MACOS_FORCE_DISABLE_SHADOW|TITLE|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|RESIZE"
	"MACOS_FORCE_DISABLE_SHADOW|TITLE|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"MACOS_FORCE_DISABLE_SHADOW|TITLE|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE"
	"MACOS_FORCE_DISABLE_SHADOW|TITLE|MACOS_FORCE_ENABLE_SHADOW|RESIZE|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"MACOS_FORCE_DISABLE_SHADOW|TITLE|MACOS_FORCE_ENABLE_SHADOW|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS"
	"MACOS_FORCE_DISABLE_SHADOW|TITLE|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|INTEGRATED_BUTTONS"
	"MACOS_FORCE_DISABLE_SHADOW|TITLE|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|RESIZE"
	"MACOS_FORCE_DISABLE_SHADOW|TITLE|RESIZE|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"MACOS_FORCE_DISABLE_SHADOW|TITLE|RESIZE|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS"
	"MACOS_FORCE_DISABLE_SHADOW|TITLE|RESIZE|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	"MACOS_FORCE_DISABLE_SHADOW|TITLE|RESIZE|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW"
	"MACOS_FORCE_DISABLE_SHADOW|TITLE|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW"
	"MACOS_FORCE_DISABLE_SHADOW|TITLE|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS"
	"MACOS_FORCE_DISABLE_SHADOW|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|RESIZE|INTEGRATED_BUTTONS"
	"MACOS_FORCE_DISABLE_SHADOW|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|RESIZE"
	"MACOS_FORCE_DISABLE_SHADOW|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS"
	"MACOS_FORCE_DISABLE_SHADOW|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW"
	"MACOS_FORCE_DISABLE_SHADOW|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|RESIZE|MACOS_FORCE_ENABLE_SHADOW"
	"MACOS_FORCE_DISABLE_SHADOW|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|RESIZE"
	"MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|TITLE|RESIZE"
	"MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|RESIZE|TITLE"
	"MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|TITLE|MACOS_FORCE_ENABLE_SHADOW|RESIZE"
	"MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|TITLE|RESIZE|MACOS_FORCE_ENABLE_SHADOW"
	"MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|RESIZE|TITLE|MACOS_FORCE_ENABLE_SHADOW"
	"MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|RESIZE|MACOS_FORCE_ENABLE_SHADOW|TITLE"
	"MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|TITLE|RESIZE"
	"MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|RESIZE|TITLE"
	"MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|TITLE|INTEGRATED_BUTTONS|RESIZE"
	"MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|TITLE|RESIZE|INTEGRATED_BUTTONS"
	"MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|RESIZE|TITLE|INTEGRATED_BUTTONS"
	"MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|RESIZE|INTEGRATED_BUTTONS|TITLE"
	"MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|RESIZE"
	"MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|MACOS_FORCE_ENABLE_SHADOW|RESIZE|INTEGRATED_BUTTONS"
	"MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|RESIZE"
	"MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|INTEGRATED_BUTTONS|RESIZE|MACOS_FORCE_ENABLE_SHADOW"
	"MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|RESIZE|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW"
	"MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|RESIZE|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS"
	"MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|MACOS_FORCE_ENABLE_SHADOW|TITLE|INTEGRATED_BUTTONS"
	"MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|TITLE"
	"MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|TITLE|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS"
	"MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|TITLE|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW"
	"MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|INTEGRATED_BUTTONS|TITLE|MACOS_FORCE_ENABLE_SHADOW"
	"MACOS_FORCE_DISABLE_SHADOW|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|TITLE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|TITLE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|TITLE|MACOS_FORCE_DISABLE_SHADOW"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|TITLE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|TITLE|MACOS_FORCE_ENABLE_SHADOW"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|INTEGRATED_BUTTONS|TITLE|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|INTEGRATED_BUTTONS|TITLE|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|TITLE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|TITLE|MACOS_FORCE_DISABLE_SHADOW"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|TITLE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|TITLE|INTEGRATED_BUTTONS"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|MACOS_FORCE_ENABLE_SHADOW|TITLE|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|MACOS_FORCE_ENABLE_SHADOW|TITLE|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|TITLE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|TITLE|INTEGRATED_BUTTONS"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|TITLE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|TITLE|MACOS_FORCE_ENABLE_SHADOW"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|MACOS_FORCE_DISABLE_SHADOW|TITLE|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|MACOS_FORCE_DISABLE_SHADOW|TITLE|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|TITLE|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|TITLE|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|TITLE|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|TITLE|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|TITLE|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|TITLE|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|RESIZE|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|TITLE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|RESIZE|MACOS_FORCE_ENABLE_SHADOW|TITLE|MACOS_FORCE_DISABLE_SHADOW"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|RESIZE|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|TITLE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|RESIZE|MACOS_FORCE_DISABLE_SHADOW|TITLE|MACOS_FORCE_ENABLE_SHADOW"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|RESIZE|TITLE|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|RESIZE|TITLE|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|RESIZE|MACOS_FORCE_DISABLE_SHADOW|TITLE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|RESIZE|TITLE|MACOS_FORCE_DISABLE_SHADOW"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|RESIZE|TITLE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|TITLE|RESIZE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|TITLE|MACOS_FORCE_DISABLE_SHADOW|RESIZE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|TITLE|RESIZE|MACOS_FORCE_DISABLE_SHADOW"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|RESIZE|TITLE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|TITLE|RESIZE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|RESIZE|MACOS_FORCE_ENABLE_SHADOW|TITLE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|RESIZE|TITLE|MACOS_FORCE_ENABLE_SHADOW"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|TITLE|RESIZE|MACOS_FORCE_ENABLE_SHADOW"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|TITLE|MACOS_FORCE_ENABLE_SHADOW|RESIZE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|TITLE|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|RESIZE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|TITLE|MACOS_FORCE_ENABLE_SHADOW|RESIZE|MACOS_FORCE_DISABLE_SHADOW"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|TITLE|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|RESIZE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|TITLE|MACOS_FORCE_DISABLE_SHADOW|RESIZE|MACOS_FORCE_ENABLE_SHADOW"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|TITLE|RESIZE|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|INTEGRATED_BUTTONS|TITLE|RESIZE|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|RESIZE|MACOS_FORCE_DISABLE_SHADOW|TITLE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|RESIZE|TITLE|MACOS_FORCE_DISABLE_SHADOW"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|RESIZE|TITLE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|TITLE|RESIZE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|TITLE|MACOS_FORCE_DISABLE_SHADOW|RESIZE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|TITLE|RESIZE|MACOS_FORCE_DISABLE_SHADOW"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|RESIZE|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|TITLE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|RESIZE|INTEGRATED_BUTTONS|TITLE|MACOS_FORCE_DISABLE_SHADOW"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|RESIZE|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|TITLE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|RESIZE|MACOS_FORCE_DISABLE_SHADOW|TITLE|INTEGRATED_BUTTONS"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|RESIZE|TITLE|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|RESIZE|TITLE|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|RESIZE|INTEGRATED_BUTTONS|TITLE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|RESIZE|TITLE|INTEGRATED_BUTTONS"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|RESIZE|TITLE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|TITLE|RESIZE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|TITLE|INTEGRATED_BUTTONS|RESIZE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|TITLE|RESIZE|INTEGRATED_BUTTONS"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|TITLE|RESIZE|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|TITLE|RESIZE|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|TITLE|MACOS_FORCE_DISABLE_SHADOW|RESIZE|INTEGRATED_BUTTONS"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|TITLE|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|RESIZE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|TITLE|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|RESIZE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_ENABLE_SHADOW|TITLE|INTEGRATED_BUTTONS|RESIZE|MACOS_FORCE_DISABLE_SHADOW"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|RESIZE|TITLE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|TITLE|RESIZE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|RESIZE|MACOS_FORCE_ENABLE_SHADOW|TITLE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|RESIZE|TITLE|MACOS_FORCE_ENABLE_SHADOW"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|TITLE|RESIZE|MACOS_FORCE_ENABLE_SHADOW"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|TITLE|MACOS_FORCE_ENABLE_SHADOW|RESIZE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|RESIZE|TITLE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|TITLE|RESIZE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|RESIZE|INTEGRATED_BUTTONS|TITLE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|RESIZE|TITLE|INTEGRATED_BUTTONS"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|TITLE|RESIZE|INTEGRATED_BUTTONS"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|TITLE|INTEGRATED_BUTTONS|RESIZE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|RESIZE|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|TITLE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|RESIZE|MACOS_FORCE_ENABLE_SHADOW|TITLE|INTEGRATED_BUTTONS"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|RESIZE|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|TITLE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|RESIZE|INTEGRATED_BUTTONS|TITLE|MACOS_FORCE_ENABLE_SHADOW"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|RESIZE|TITLE|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|RESIZE|TITLE|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|TITLE|MACOS_FORCE_ENABLE_SHADOW|RESIZE|INTEGRATED_BUTTONS"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|TITLE|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|RESIZE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|TITLE|RESIZE|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|TITLE|RESIZE|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|TITLE|INTEGRATED_BUTTONS|RESIZE|MACOS_FORCE_ENABLE_SHADOW"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_DISABLE_SHADOW|TITLE|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|RESIZE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|RESIZE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|RESIZE|MACOS_FORCE_DISABLE_SHADOW"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|RESIZE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|RESIZE|MACOS_FORCE_ENABLE_SHADOW"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|INTEGRATED_BUTTONS|RESIZE|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|INTEGRATED_BUTTONS|RESIZE|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|RESIZE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|RESIZE|MACOS_FORCE_DISABLE_SHADOW"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|RESIZE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|RESIZE|INTEGRATED_BUTTONS"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|MACOS_FORCE_ENABLE_SHADOW|RESIZE|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|MACOS_FORCE_ENABLE_SHADOW|RESIZE|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|RESIZE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|RESIZE|INTEGRATED_BUTTONS"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|RESIZE"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|RESIZE|MACOS_FORCE_ENABLE_SHADOW"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|MACOS_FORCE_DISABLE_SHADOW|RESIZE|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|MACOS_FORCE_DISABLE_SHADOW|RESIZE|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|RESIZE|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|RESIZE|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|RESIZE|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|RESIZE|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|RESIZE|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|MACOS_FORCE_ENABLE_SHADOW"
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|RESIZE|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|MACOS_FORCE_DISABLE_SHADOW"
end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
