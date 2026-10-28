---@diagnostic disable:unused-local

local record Widgets.WidgetOpts
	color: string | nil
	icon: string | nil|false
	throttle: integer | nil
end

local record WidgetsOpts
	left: Widgets | nil.Widget[]
	right: Widgets | nil.Widget[]
---@field separator? { color?: string, text?: string }

local record Widgets.Battery
	charge: Widgets.Battery.Charge

local record Widgets.CPU
	utilization: Widgets.CPU.Utilization

local record Widgets.Disk
	read: Widgets.Disk.Read
	space: Widgets.Disk.Space
	write: Widgets.Disk.Write

local record Widgets.Network
	download: Widgets.Network.Download
	upload: Widgets.Network.Upload

local record Widgets.RAM
	utilization: Widgets.RAM.Utilization

local record Widgets.CPU.Utilization
local U = {}

---@param opts? WidgetsOpts
function U.widget(opts): Widgets.Widget

local record Widgets.Battery.Charge
local C = {}

---@param opts? WidgetsOpts
function C.widget(opts): Widgets.Widget

local record Widgets.Disk.Read
local R = {}

---@param opts? WidgetsOpts
function R.widget(opts): Widgets.Widget

local record Widgets.Disk.Space
local S = {}

---@param opts? WidgetsOpts
function S.widget(opts): Widgets.Widget

local record Widgets.Disk.Write
local Write = {}

---@param opts? WidgetsOpts
function Write.widget(opts): Widgets.Widget

local record Widgets.Network.Download
local D = {}

---@param opts? WidgetsOpts
function D.widget(opts): Widgets.Widget

local record Widgets.RAM.Utilization
local RU = {}

---@param opts? WidgetsOpts
function RU.widget(opts): Widgets.Widget

local record Widgets.Network.Upload
local Upload = {}

---@param opts? WidgetsOpts
function Upload.widget(opts): Widgets.Widget

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

---@param config Config
---@param opts? WidgetsOpts
function M.apply_to_config(config, opts) end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
