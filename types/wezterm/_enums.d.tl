local _tmp = require("_tmp")


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

local enum _EasingFunction
	"Constant"
	"Ease"
	"EaseIn"
	"EaseInOut"
	"EaseOut"
	"Linear"
end
local record _CubicBezier
	CubicBezier: {number}
end
local type EasingFunction = _EasingFunction|_CubicBezier

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

local enum Shape --StableCursorPosition.Shape
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
end

---This is a virtual modifier used by wezterm
local enum Modifiers
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
end

---Action callback type for `InputSelectorParams.action`
---See:
--- - [`Window`](lua://Window)
--- - [`Pane`](lua://Pane)
--- - [`InputSelectorParams`](lua://InputSelectorParams)
local type CallbackInputSelector = function(window: _tmp.Window, pane: _tmp.Pane, id: string|nil, label: string|nil): nil --?

---Action callback type for `PromptInputLineParams.action`
---See:
--- - [`Window`](lua://Window)
--- - [`Pane`](lua://Pane)
--- - [`PromptInputLineParams`](lua://PromptInputLineParams)
local type CallbackPromptInputLine = function(window: _tmp.Window, pane: _tmp.Pane, line?: string): nil --?

--- - The first event parameter is a `Window`
---   object that represents the GUI window
--- - The second event parameter is a `Pane`
---   object that represents the pane in which
---   the event was triggered.
---See:
--- - [`Pane`](lua://Pane)
--- - [`Window`](lua://Window)
local type CallbackWindowPane = function(window: _tmp.Window, pane: _tmp.Pane): nil --?

local enum State --BatteryInfo.State
	"Charging"
	"Discharging"
	"Empty"
	"Full"
	"Unknown"
end

local record _AnsiColor where self.Color == nil
	AnsiColor: AnsiColor
	Color: nil
end
local record _Color where self.Color ~= nil
	Color: string
end
local type ColorSpec = _AnsiColor|_Color

local enum FontStyle
	"Italic"
	"Normal"
	"Oblique"
end

local enum _FormatItem
	"ResetAttributes"
end
local type FormatItem = _FormatItem|_tmp.FormatItemSpec

local enum Intensity --FormatItemAttribute.Intensity
	"Bold"
	"Half"
	"Normal"
end

local enum Underline --FormatItemAttribute.Underline
	"Curly"
	"Dashed"
	"Dotted"
	"Double"
	"None"
	"Single"
end

local enum FreeTypeTarget
	"HorizontalLcd"
	"Light"
	"Mono"
	"Normal"
	"VerticalLcd"
end

local enum Backend --GpuInfo.Backend
	"Dx12"
	"Gl"
	"Metal"
	"Vulkan"
end

local enum DeviceType --GpuInfo.DeviceType
	"Cpu"
	"DiscreteGpu"
	"IntegratedGpu"
	"Other"
end

local enum Blend --Gradient.Blend
	"Hsv"
	"LinearRgb"
	"Oklab"
	"Rgb"
end

local enum Interpolation --Gradient.Interpolation
	"Basis"
	"CatmullRom"
	"Linear"
end


local record _Linear where self.Linear ~= nil
	Linear: _tmp.LinearGradientOrientation
end
local record _Radial where self.Linear == nil
	Radial: _tmp.RadialGradientOrientation
	Linear: nil
end
local enum _GradientOrientation
	"Horizontal"
	"Vertical"
end
local type GradientOrientation = _GradientOrientation|_Linear|_Radial

local enum _MouseEventName
	"Down"
	"Drag"
	"Up"
end
local type MouseEvent = {_MouseEventName: _tmp.MouseEventInfo}

local enum Underline --TabBarColor.Underline
	"Double"
	"None"
	"Single"
end



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


local enum _MovementZoneType
	"Input"
	"Output"
	"Prompt"
end

local record _PrevChar
	prev_char: boolean
end
local enum _JumpDirection
	"JumpBackward"
	"JumpForward"
end


local record _PrevChar
	prev_char: boolean
end

local enum _JumpDirection
	"JumpBackward"
	"JumpForward"
end

local enum _MoveZoneDirection
	"MoveBackwardZoneOfType"
	"MoveForwardZoneOfType"
end

local record _JumpAssignment where self._tl_type == "JumpAssignment"
	JumpAssignment: {_JumpDirection: _PrevChar}
	_tl_type: string
end

local record _MoveZoneAssignment where self._tl_type == "MoveZoneAssignment"
	MoveZoneAssignment: {_MoveZoneDirection: _MovementZoneType}
	_tl_type: string
end

local record _SetSelectionMode where self._tl_type == "SetSelectionMode"
	SetSelectionMode: SelectionMode
	_tl_type: string
end

local record _MoveByPage where self._tl_type == "MoveByPage"
	MoveByPage: integer
	_tl_type: string
end

local type _CopyModeAssignmentComplex = _JumpAssignment|_MoveZoneAssignment|_SetSelectionMode|_MoveByPage

---Represents a pre-defined function that can be applied to control `CopyMode` and [Search Mode](https://wezterm.org/scrollback.html#enabledisable-scrollbar)
local enum _CopyModeAssignment
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

	-- accounted for in complex types:
	-- { "JumpBackward": { prev_char: boolean } }
	-- { "JumpForward": { prev_char: boolean } }
	-- { "MoveBackwardZoneOfType": _MovementZoneType }
	-- { "MoveByPage": integer }
	-- { "MoveForwardZoneOfType": _MovementZoneType }
	-- { "SetSelectionMode": SelectionMode }
end
local type CopyModeAssignment = _CopyModeAssignment|_CopyModeAssignmentComplex


-- KEY ASSIGNMENT ====================================================================================================================================

---@diagnostic disable:unused-local

---Mirrors `KeyAssignment`-related types in wezterm upstream:
---https://github.com/wezterm/wezterm/blob/main/config/src/keyassignment.rs


local enum _SearchParamsKey
	"Regex"
	"CaseSensitiveString: string"
	"CaseInSensitiveString: string"
end
local type SearchParams = {_SearchParamsKey: string}

local enum ScrollbackEraseMode
	"ScrollbackAndViewport"
	"ScrollbackOnly"
end

local enum SetWindowLevelParams
	"AlwaysOnBottom"
	"AlwaysOnTop"
	"Normal"
end

local record _DomainId where self._tl_type == "DomainId"
	DomainId: integer
	_tl_type: string
end
local record _DomainName where self._tl_type == "DomainName"
	DomainName: integer
	_tl_type: string
end
local enum _SpawnTabDomain
	"CurrentPaneDomain"
	"DefaultDomain"
end
local type SpawnTabDomain = _SpawnTabDomain|_DomainId|_DomainName


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
end

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
local record PrevChar where self._tl_type == "PrevChar"
	prev_char: boolean
	_tl_type: string
end

local record BackwardJump where self._tl_type == "BackwardJump"
	JumpBackward: PrevChar
	_tl_type: string
end

local record ForwardJump where self._tl_type == "ForwardJump"
	JumpForward: PrevChar
	_tl_type: string
end

local record BackwardJumpZone where self._tl_type == "BackwardJumpZone" -- TODO: revisit name
	MoveBackwardZoneOfType: MovementType
	_tl_type: string
end

local record ForwardJumpZone where self._tl_type == "ForwardJumpZone" -- TODO: revisit name
	MoveForwardZoneOfType: MovementType
	_tl_type: string
end

local record PageMovement where self._tl_type == "PageMovement"
	MoveByPage: number
	_tl_type: string
end

local record SelectionModeSetter where self._tl_type == "SelectionModeSetter"
	SetSelectionMode: SelectionMode
	_tl_type: string
end

local type CopyModeParams = CopyModeStr|BackwardJump|ForwardJump|BackwardJumpZone|ForwardJumpZone|PageMovement|SelectionModeSetter

local record _EmitEvent
	EmitEvent: string
end

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
	action: _EmitEvent --TODO: check
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
	cancel: _EmitEvent | nil
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


local record PaneSelectParams
	alphabet: _tmp.QuickSelectAlphabet | nil|string
	mode: _tmp.PaneSelectMode | nil
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
	action: _EmitEvent
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
	patterns: {string} | nil
	---If present, this alphabet is used instead of `config.quick_select_alphabet`.
	---See:
	--- - [`config.quick_select_alphabet`](lua://Config.quick_select_alphabet)
	alphabet: _tmp.QuickSelectAlphabet | nil|string
	---If present, this key assignment action is performed as if by `Window:perform_action`
	---when an item is selected.
	---The normal clipboard action is NOT performed in this case.
	action: _tmp.Action | nil
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
end

local record ShowLauncherArgsParams
	---The set of flags that specifies what to show in the launcher.
	---The flags can be joined together using a `|` character,
	---so `"TABS|DOMAINS"` is an example of a set of flags that will
	---include both tabs and domains in the list.
	flags: string --LauncherArgsFlags|string
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
	alphabet: _tmp.QuickSelectAlphabet | nil|string
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
	enum _SizeType
		"Cells"
		"Percent"
	end
	size: { _SizeType: integer } | nil
	---The `SpawnCommand` specifying what program to launch into the new pane.
	---If omitted, `config.default_prog` will be used.
	---For more information, see:
	--- - [`SpawnCommand`](lua://SpawnCommand)
	--- - [`config.default_prog`](lua://Config.default_prog)
	command: _tmp.SpawnCommand | nil
	---If set to true, rather than splitting the active pane, the split will be made
	---at the root of the tab and effectively split the entire tab
	---across the fullest possible extent.
	---The default is `false`.
	top_level: boolean | nil
end














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
