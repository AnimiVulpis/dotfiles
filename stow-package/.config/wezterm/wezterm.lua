-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

config.automatically_reload_config = false
config.check_for_updates = false

config.window_decorations = "RESIZE"

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
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.tab_max_width = 42

config.enable_kitty_keyboard = false

config.keys = {
    {
        key = 'w',
        mods = 'CMD',
        action = wezterm.action.CloseCurrentPane { confirm = true },
    },
    {
        key = 'Enter',
        mods = 'ALT',
        action = wezterm.action.DisableDefaultAssignment,
    }
}

config.window_padding = {
    left = '0.25cell',
    right = '0.25cell',
    top = '0.25cell',
    bottom = '0.25cell',
}

-- Copy the configuration below and add it to your
-- ~/.wezterm.lua or ~/.config/wezterm/wezterm.lua file

-- NOTE: make sure to *not* use any config.color_scheme option
--       if you want to define your own root loops color scheme

-- Root Loops color scheme
-- via https://rootloops.sh?sugar=6&colors=9&sogginess=9&flavor=1&fruit=7&milk=1
config.colors = {
    foreground = "#7ce9fb",
    background = "#02272c",
    cursor_bg = "#20b4c9",
    cursor_border = "#51e0f7",
    cursor_fg = "#02272c",
    selection_bg = "#7ce9fb",
    selection_fg = "#02272c",
    ansi = {
        "#053e46",
        "#e73359",
        "#59972d",
        "#ae7714",
        "#2d83e8",
        "#ba3ce8",
        "#1a9696",
        "#20b4c9"
    },
    brights = {
        "#0e6774",
        "#f75b72",
        "#67af34",
        "#c98b1a",
        "#509af6",
        "#ca64f3",
        "#1faeae",
        "#51e0f7"
    },
}

-- and finally, return the configuration to wezterm
return config
