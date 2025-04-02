-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

config.automatically_reload_config = false
config.check_for_updates = false

config.front_end = "WebGpu"

config.initial_cols = 120
config.initial_rows = 42

config.animation_fps = 120
config.max_fps = 120

config.scrollback_lines = 4200

config.font_size = 14.0
config.font = wezterm.font("IosevkaTerm Nerd Font", { weight = "Light" })

-- Nightly build only
-- config.show_close_tab_button_in_tabs = false
config.tab_max_width = 42

config.keys = {
    {
        key = 'w',
        mods = 'CMD',
        action = wezterm.action.CloseCurrentPane { confirm = true },
    }
}

config.window_padding = {
    left = '0.25cell',
    right = '0.25cell',
    top = '0.25cell',
    bottom = '0.25cell',
}

-- Root Loops color scheme
-- via https://rootloops.sh
-- Configs: Sugar: 7, Artificial Colors: 9, Sogginess: 8, Cereal Flavor: Classic, Fruit: Blueberry, Milk: Just a Splash

config.colors = {
    foreground = "#c9f4fc",
    background = "#05272d",
    cursor_bg = "#c9f4fc",
    cursor_border = "#e9fafe",
    cursor_fg = "#05272d",
    selection_bg = "#c9f4fc",
    selection_fg = "#05272d",
    ansi = {
        "#0d4149",
        "#f75b72",
        "#67af34",
        "#c98b1a",
        "#509af6",
        "#ca64f3",
        "#1faeae",
        "#62daee"
    },
    brights = {
        "#1f7784",
        "#fb8590",
        "#75c73b",
        "#e49f27",
        "#77b1fb",
        "#d68af7",
        "#24c6c6",
        "#e9fafe"
    },
}

-- and finally, return the configuration to wezterm
return config
