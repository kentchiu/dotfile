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

config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = false
config.use_fancy_tab_bar = false
config.show_tab_index_in_tab_bar = false

-- 配色方案
-- config.color_scheme = "One Dark (Gogh)"

-- 平台特定配置
if wezterm.target_triple == "x86_64-pc-windows-msvc" then
	-- Windows 平台特定配置
	config.default_domain = "WSL:Arch"
elseif wezterm.target_triple == "x86_64-apple-darwin" then
	-- macOS 平台特定配置
	-- 此處可添加 macOS 平台的特定設置
end

return config
