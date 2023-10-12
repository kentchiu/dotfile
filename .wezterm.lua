local wezterm = require 'wezterm'

local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices
config.default_domain = 'WSL:Ubuntu'

config.font = wezterm.font 'JetBrains Mono'
-- config.font =  wezterm.font('JetBrains Mono', { weight = 'Bold', italic = true })

-- Enable the scrollbar.
-- It will occupy the right window padding space.
-- If right padding is set to 0 then it will be increased
-- to a single cell width
config.check_for_updates = false
config.enable_scroll_bar = true
config.audible_bell = 'Disabled'
config.window_close_confirmation = 'NeverPrompt'

--config.font_size = 10.0

-- theme
--config.color_scheme = 'JetBrains Darcula'
-- config.color_scheme = 'One Dark (Gogh)'
-- config.color_scheme = 'One Half Black (Gogh)'
-- config.color_scheme = 'Orangish (terminal.sexy)'
-- config.color_scheme = 'Darcula (base16)'


-- if wezterm.target_triple == "x86_64-pc-windows-msvc" then
-- else
-- end

return config
