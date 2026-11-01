local _tmp = require("_tmp")

local enum AgentDeckStatus
	"idle"
	"inactive"
	"waiting"
	"working"
end

local enum Type
	"badge"
	"icon"
	"separator"
end

local enum Style
	"emoji"
	"nerd"
	"unicode"
end

local enum Backend
	"terminal-notifier"
	"native"
end

local record StatusPatterns
	idle:     {string} | nil
	inactive: {string} | nil
	waiting:  {string} | nil
	working:  {string} | nil
end

local record AgentsSpec
	argv_patterns:       {string}       | nil
	executable_patterns: {string}       | nil
	patterns:            {string}       | nil
	status_patterns:     StatusPatterns | nil
	title_patterns:      {string}       | nil
end

local type AgentDeckOpenCodeOpts = AgentsSpec --: AgentDeck.AgentsSpec

local type AgentDeckClaudeOpts = AgentsSpec --: AgentDeck.AgentsSpec

local type AgentDeckGeminiOpts = AgentsSpec --: AgentDeck.AgentsSpec

local type AgentDeckCodexOpts = AgentsSpec --: AgentDeck.AgentsSpec

local type AgentDeckAiderOpts = AgentsSpec --: AgentDeck.AgentsSpec

local record Agents
	aider:    AgentDeckAiderOpts    | nil
	claude:   AgentDeckClaudeOpts   | nil
	codex:    AgentDeckCodexOpts    | nil
	gemini:   AgentDeckGeminiOpts   | nil
	opencode: AgentDeckOpenCodeOpts | nil
end

local record ComponentSpec --AgentDeck.ComponentSpec
	filter:  AgentDeckStatus | nil
	label:   string          | nil
	text:    string          | nil
	type:    Type            | nil
end

local record RightStatus
	components: AgentDeck | {ComponentSpec} | nil
	enabled:    boolean   | nil
end

local record TabTitle
	components: AgentDeck | {ComponentSpec} | nil
	enabled:    boolean   | nil
    position:   string    | nil
end

local record Colors
	idle:     string | nil
	inactive: string | nil
	waiting:  string | nil
	working:  string | nil
end

local type IconStyleSpec = Colors --AgentDeck.IconStyleSpec: AgentDeckOpts.Colors

local record Icons
	emoji:   AgentDeck   | IconStyleSpec | nil
	nerd:    AgentDeck   | IconStyleSpec | nil
	style:   Style       | nil
	unicode: AgentDeck   | IconStyleSpec | nil
end

local record TerminalNotifier
	activate: boolean | nil
	group:    string  | nil
	path:     string  | nil
	sound:    string  | nil
	title:    string  | nil
end

local record Notifications
	backend:                    Backend          | nil
	enabled:                    boolean          | nil
	on_waiting:                 boolean          | nil
	suppress_osc_notifications: boolean          | nil
	terminal_notifier:          TerminalNotifier | nil
	timeout_ms:                 integer          | nil
end

local record AgentDeckOpts
	agents:          {string: any} -- should be: Agents | {string: AgentsSpec} | nil
	colors:          Colors        | nil
	cooldown_ms:     integer       | nil
	enabled_agents:  {string}      | nil
	icons:           Icons         | nil
	max_lines:       integer       | nil
	right_status:    RightStatus   | nil
	update_interval: integer       | nil
	notifications:   Notifications | nil
end

local record AgentDeckState
	agent_type:     string
	cooldown_start: integer | nil
	last_update:    integer
	status:         AgentDeckStatus
end

local record AgentDeckStatusCounts
	idle: integer
	inactive: integer
	waiting: integer
	working: integer
end

local record AgentDeck

	apply_to_config: function(config: _tmp.Config, opts: AgentDeckOpts | nil): nil

	count_agents_by_status: function(): AgentDeckStatusCounts

	get_agent_state: function(pane_id: integer): AgentDeckState

	get_all_agent_states: function(): {integer}

	get_config: function(): AgentDeckOpts

	get_status_color: function(status_name: AgentDeckStatus): string

	get_status_icon: function(status_name: AgentDeckStatus): string

	set_config: function(opts: AgentDeckOpts): nil

	setup: function(opts: AgentDeckOpts | nil): nil

	update_pane: function(pane: _tmp.Pane): AgentDeckState|nil
end
-- vim: set ts=2 sts=2 sw=2 et ai si sta:
