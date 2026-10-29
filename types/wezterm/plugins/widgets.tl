local record Widgets.WidgetOpts
	color: string | nil
	icon: string | nil|false
	throttle: integer | nil
end

local record WidgetsOpts
	left: Widgets |{Widget} | nil
	right: Widgets |{Widget} | nil
	separator: { color: string|nil, text: string|nil }|nil
end

local record Widgets.Battery
	charge: Widgets.Battery.Charge
end

local record Widgets.CPU
	utilization: Widgets.CPU.Utilization
end

local record Widgets.Disk
	read: Widgets.Disk.Read
	space: Widgets.Disk.Space
	write: Widgets.Disk.Write
end

local record Widgets.Network
	download: Widgets.Network.Download
	upload: Widgets.Network.Upload
end

local record Widgets.RAM
	utilization: Widgets.RAM.Utilization
end

local record Widgets.CPU.Utilization
local U = {}

function U.widget(opts: WidgetsOpts|nil): Widgets.Widget

local record Widgets.Battery.Charge
local C = {}

function C.widget(opts: WidgetsOpts|nil): Widgets.Widget

local record Widgets.Disk.Read
local R = {}

function R.widget(opts: WidgetsOpts|nil): Widgets.Widget

local record Widgets.Disk.Space
local S = {}

function S.widget(opts: WidgetsOpts|nil): Widgets.Widget

local record Widgets.Disk.Write
local Write = {}

function Write.widget(opts: WidgetsOpts|nil): Widgets.Widget

local record Widgets.Network.Download
local D = {}

function D.widget(opts: WidgetsOpts|nil): Widgets.Widget

local record Widgets.RAM.Utilization
local RU = {}

function RU.widget(opts: WidgetsOpts|nil): Widgets.Widget

local record Widgets.Network.Upload
local Upload = {}

function Upload.widget(opts: WidgetsOpts|nil): Widgets.Widget

local record Widgets.Widget
	opts: Widgets.WidgetOpts
local W = {}


function W.get_text(): string


function W.get_formatted(): {

local record Widgets
	battery: Widgets.Battery
	cpu: Widgets.CPU
	disk: Widgets.Disk
	network: Widgets.Network
	ram: Widgets.RAM
local M = {}

apply_to_config: function(config: Config, opts: WidgetsOpts|nil) end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
