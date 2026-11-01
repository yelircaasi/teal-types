local _tmp = require("_tmp")

local enum Attention
	"notify"
	"review"
	"stop"
	"thinking"
end

local enum Renderer
	"manual"
	"tab"
end

local type TitleFormatter = function(tab: _tmp.TabInformation, ctx: WrapTitleFormatterCtx): string --WeztermAttention.TitleFormatter

local record WrapTitleFormatterCtx --WeztermAttention.WrapTitleFormatterCtx
	attention:     {string}|string
	config:        _tmp.Config
	default_title: string
	hover:         boolean
	max_width:     integer
	panes:         {_tmp.PaneInformation}
	tabs:          {_tmp.TabInformation}
end

local record ReviewKey --WeztermAttentionOpts.ReviewKey: SendKeyParams
	key: string | nil
end

local record Colors --WeztermAttentionOpts.Colors
	notify: string | nil
	review: string | nil
	stop: string | nil
	thinking: string | nil
end

local record Indicators --WeztermAttentionOpts.Indicators
	notify: string | nil
	review: string | nil
	stop: string | nil
	thinking_frames: {string} | nil
end

local record WeztermAttentionOpts where self._tl_type == "WeztermAttentionOpts"
	_tl_type: string

	enum _NotifyOrStop
		"notify"
		"stop"
	end

	record _Thinking
		thinking: integer
	end
	
	acknowledge_types: {_NotifyOrStop} | nil
	auto_clear:        {Attention} | nil
	colors:            Colors      | nil
	dir:               string      | nil
	indicators:        Indicators  | nil
	priority:          {Attention} | nil
	renderer:          Renderer    | nil
	review_key:        ReviewKey   | nil
	stale_after_ms:    _Thinking   | boolean | nil
	title_formatter:   TitleFormatter | nil
end

local record Internal --WeztermAttention.Internal

	enum _Response
		"absent"
		"acknowledged"
		"failed"
		"kept"
	end

	record _NowMs where self._tl_type == "_NowMs"
		_tl_type: string
		now_ms: integer
	end

	record _WriteAcknowledgement where self._tl_type == "_WriteAcknowledgement"
	 _tl_type: string
		write_acknowledgement: function(dir: string, pane_id: string, identity: string): boolean
	end

	type _Opts = WeztermAttentionOpts|_NowMs|_WriteAcknowledgement

	acknowledge_focused_pane: function(pane_id: integer, opts: _Opts): _Response

	record _VisibleAttention 
		color: string|nil
		indicator: string
		type: string|nil
	end

	resolve_visible_attention: function(pane_ids: {string}, opts: WeztermAttentionOpts|nil): _VisibleAttention
end

local record WeztermAttention
	_active_acknowledge_set: {string: boolean}
	_active_colors: Colors
	_active_dir: string
	_internal: Internal

	apply_to_config: function(config: _tmp.Config, opts: WeztermAttentionOpts|nil): nil

	---Read the cached attention state for a pane.
	---Returns a `type`, `frame` tuple, or `nil`.
	get_attention: function(pane_id: integer, opts: WeztermAttentionOpts|nil): {string|nil, integer|nil}

	---Remove the attention marker for a pane.
	remove_marker: function(pane_id: integer, opts: WeztermAttentionOpts|nil): nil

	---Poll marker files and update cache.
	---Call from your own `update-status` handler if you set `auto_poll` to `false`,
	---or if WezTerm only fires one handler.
	---Only refreshes entries for panes in the current window. Cross-window cache entries
	---are left alone — pruning them here would cause cache thrash when multiple windows fire
	---`update-status` (each window would wipe the other's entries every tick, producing visible
	---tab-indicator blinking). Stale entries are cleaned up by the pane-destroyed handler.
	poll: function(window: _tmp.Window, opts: WeztermAttentionOpts|nil): nil

	type _TitleFormatter = function(
		tab: _tmp.TabInformation,
		tabs: {_tmp.TabInformation},
		panes: {_tmp.PaneInformation},
		config: _tmp.Config,
		hover: boolean,
		max_width: integer
	): string|_tmp.FormatItem
	wrap_title_formatter: function(base_fn: TitleFormatter): _TitleFormatter
end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
