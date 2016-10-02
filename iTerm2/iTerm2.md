# iTerm2 settings

## Appearance

### Tabs

- Tab bar location: `Top`
- Theme: `Dark`
- [x] Show tab bar even when there is only one tab
- [ ] Show tab numbers
- [ ] Show tab close buttons
- [x] Show activity indicator
- [x] Show new-output indicator
- [x] Show tab bar in fullscreen

### Panes

- [ ] Show per-pane title bar with split panes

### Screen

- [x] Auto-hide menu bar in non-native fullscreen

### Window & Tab Titles

- [ ] Show window number
- [x] Show current job name
- [ ] Show profile name

### Dimming

- [ ] Dimming affects only text, not background
- Dimming amount: `~20%`
- [x] Dim inactive split panes
- [ ] Dim background windows

### Window

- [ ] Show border around window
- [x] Hide scrollbars
- [ ] Disable transparency for fullscreen windows by default

## Profiles

### Colors

The color scheme I use is derived from the solarized project located at http://ethanschoonover.com/solarized

The GitHub repository of this project is located at https://github.com/altercation/solarized

This color scheme is part of my personal dotfile repo located at https://github.com/AnimiVulpis/dotfiles

The color scheme defined here is saved as `./AnimiVulpis.itermcolors`

Colors in brackets (`color-name`) are the solarized color names (and modifications to those based on the `CIELAB` color space)

#### Install Instructions

To install simply follow the installation Guide found under https://github.com/mbadolato/iTerm2-Color-Schemes#installation-instructions

>- Launch iTerm 2
>- Get the latest version at iterm2.com
>- Type CMD+i (⌘+i)
>- Navigate to Colors tab
>- Click on Load Presets
>- Click on Import
>- Select the .itermcolors file(s) of the scheme(s) you'd like to use
>- Click on Load Presets and choose a color scheme

#### Basic Colors

Color | RGB(A) Value
------|-------------
Foreground | `#aab9b9` (Lightness value increased from `base1` by `9`)
Background | `#002b36` (same as Black) (`base03`)
Bold | `#93a1a1` (same as Selected Text) (`base1`)
Links | `#0070b4` (Lightness value decreased from `blue` by `10`)
Selection | `#586e75` (`base01`)
Selected Text | `#93a1a1` (same as Bold) (`base1`)
Badge | `#dc322f[80] (Alpha is 128)` (`red`)
Tab Color | Not used

Minimum contrast: `0`

#### ANSI Colors

Color | Normal | Bright
------|--------|-------
Black | `#002b36` (same as Background) (`base03`) | `#586e75` (`base01`)
Red | `#dc322f` (`red`) | `#cb4b16` (`orange`)
Green | `#859900` (`green`) | `#6a8000` (Lightness value decreased from `green` by `10`)
Yellow | `#b58900` (`yellow`) | `#d4a42b` (Lightness value increased from `yellow` by `10`)
Blue | `#268bd2` (`blue`) | `#0070b4` (Lightness value decreased from `blue` by `10`)
Magenta | `#6c71c4` (`violet`) | `#8689de` (Lightness value increased from `violet` by `10`)
Cyan | `#2aa198` (`cyan`) | `#d33682` (`magenta`)
White | `#c3d2d2` (Lightness value increased from `Foreground` by `9`) | `#eee8d5` (`base2`)

#### Cursor Colors

Color | RGB(A) Value
------|-------------
Cursor | N/A
Cursor Text | N/A
Cursor Guide | `#268bd2[40] (`blue`) (Alpha is 64)` (not used)
Smart Cursor Color | in use

Cursor Boost: `0`

### Keys

#### Key Mappings

Key Mappings as I currently use them in iTerm2

Shortcut | Action
---------|-------
<kbd>⌘</kbd><kbd>z</kbd> | Send Hex Codes: `0x1f`
<kbd>⌘</kbd><kbd>←Del</kbd> | Send Hex Codes: `0x15`
<kbd>⎇</kbd><kbd>←Del</kbd> | Send Hex Codes: `0x1b` `0x08`
<kbd>⎇</kbd><kbd>←</kbd> | Send Hex Codes: `0x1b` `0x62`
<kbd>⌘</kbd><kbd>←</kbd> | Send Hex Codes: `0x01`
<kbd>⎇</kbd><kbd>→</kbd> | Send Hex Codes: `0x1b` `0x66`
<kbd>⌘</kbd><kbd>→</kbd> | Send Hex Codes: `0x05`
<kbd>Del→</kbd> | Send Hex Codes: `0x4`
<kbd>⌘</kbd><kbd>Del→</kbd> | Send Hex Codes: `0x0b`
<kbd>⎇</kbd><kbd>Del→</kbd> | Send Hex Codes: `0x01b` `0x64`
