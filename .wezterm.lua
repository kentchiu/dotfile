-- The only required line is this one.
local wezterm = require("wezterm")
local mux = wezterm.mux
local act = wezterm.action
-- Some empty tables for later use
local config = {}
local keys = {}
local mouse_bindings = {}
local launch_menu = {}

-- 使用 config_builder 提供更清晰的錯誤信息
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- 字體設置，使用 JetBrains Mono 和 Symbols Nerd Font Mono 作為備選字體
config.font = wezterm.font_with_fallback({
	"JetBrains Mono",
	{ family = "Symbols Nerd Font Mono", scale = 0.75 },
})

-- 設置字體大小
config.font_size = 12.0

-- 禁用更新檢查
config.check_for_updates = false
-- 啟用滾動條
config.enable_scroll_bar = true
-- 禁用音響提示
config.audible_bell = "Disabled"
-- 關閉窗口時不提示確認
config.window_close_confirmation = "NeverPrompt"

-- config.window_background_opacity = 0.6

-- tab_bar  配置
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.show_new_tab_button_in_tab_bar = true
config.show_tab_index_in_tab_bar = false
config.show_tabs_in_tab_bar = true
config.switch_to_last_active_tab_when_closing_tab = true
config.tab_and_split_indices_are_zero_based = false
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false

config.window_padding = {
	left = 5,
	right = 5,
	top = 5,
	bottom = 5,
}

-- This function returns the suggested title for a tab.
-- It prefers the title that was set via `tab:set_title()`
-- or `wezterm cli set-tab-title`, but falls back to the
-- title of the active pane in that tab.
function tab_title(tab_info)
	local title = tab_info.tab_title
	-- if the tab title is explicitly set, take that
	if title and #title > 0 then
		return title
	end
	-- Otherwise, use the title from the active pane
	-- in that tab
	return tab_info.active_pane.title
end

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local nf = wezterm.nerdfonts

	local GLYPH_SEMI_CIRCLE_LEFT = nf.ple_left_half_circle_thick --[[ '' ]]
	local GLYPH_SEMI_CIRCLE_RIGHT = nf.ple_right_half_circle_thick --[[ '' ]]
	local GLYPH_CIRCLE = nf.fa_circle --[[ '' ]]
	local GLYPH_ADMIN = nf.md_shield_half_full --[[ '󰞀' ]]

	local M = {}

	local __cells__ = {} -- wezterm FormatItems (ref: https://wezfurlong.org/wezterm/config/lua/wezterm/format.html)

-- stylua: ignore
local colors = {
   default   = { bg = '#45475a', fg = '#1c1b19' },
   is_active = { bg = '#7FB4CA', fg = '#11111b' },
   hover     = { bg = '#587d8c', fg = '#1c1b19' },
}

	local _set_process_name = function(s)
		local a = string.gsub(s, "(.*[/\\])(.*)", "%2")
		return a:gsub("%.exe$", "")
	end

	local _set_title = function(process_name, base_title, max_width, inset)
		local title
		inset = inset or 6

		if process_name:len() > 0 then
			title = process_name .. " ~ " .. base_title
		else
			title = base_title
		end

		if title:len() > max_width - inset then
			local diff = title:len() - max_width + inset
			title = wezterm.truncate_right(title, title:len() - diff)
		end

		return title
	end

	local _check_if_admin = function(p)
		if p:match("^Administrator: ") then
			return true
		end
		return false
	end

	---@param fg string
	---@param bg string
	---@param attribute table
	---@param text string
	local _push = function(bg, fg, attribute, text)
		table.insert(__cells__, { Background = { Color = bg } })
		table.insert(__cells__, { Foreground = { Color = fg } })
		table.insert(__cells__, { Attribute = attribute })
		table.insert(__cells__, { Text = text })
	end

	__cells__ = {}

	local bg
	local fg
	local process_name = _set_process_name(tab.active_pane.foreground_process_name)
	local is_admin = _check_if_admin(tab.active_pane.title)
	local title = _set_title(process_name, tab.active_pane.title, max_width, (is_admin and 8))

	if tab.is_active then
		bg = colors.is_active.bg
		fg = colors.is_active.fg
	elseif hover then
		bg = colors.hover.bg
		fg = colors.hover.fg
	else
		bg = colors.default.bg
		fg = colors.default.fg
	end

	local has_unseen_output = false
	for _, pane in ipairs(tab.panes) do
		if pane.has_unseen_output then
			has_unseen_output = true
			break
		end
	end

	-- Left semi-circle
	_push("rgba(0, 0, 0, 0.4)", bg, { Intensity = "Bold" }, GLYPH_SEMI_CIRCLE_LEFT)

	-- Admin Icon
	if is_admin then
		_push(bg, fg, { Intensity = "Bold" }, " " .. GLYPH_ADMIN)
	end

	-- Title
	_push(bg, fg, { Intensity = "Bold" }, " " .. title)

	-- Unseen output alert
	if has_unseen_output then
		_push(bg, "#FFA066", { Intensity = "Bold" }, " " .. GLYPH_CIRCLE)
	end

	-- Right padding
	_push(bg, fg, { Intensity = "Bold" }, " ")

	-- Right semi-circle
	_push("rgba(0, 0, 0, 0.4)", bg, { Intensity = "Bold" }, GLYPH_SEMI_CIRCLE_RIGHT)

	return __cells__
end)

-- 平台特定配置
if wezterm.target_triple == "x86_64-pc-windows-msvc" then
	-- Windows 平台特定配置
	config.default_domain = "WSL:Arch"
elseif wezterm.target_triple == "x86_64-apple-darwin" then
	-- macOS 平台特定配置
	-- 此處可添加 macOS 平台的特定設置
end

return config
