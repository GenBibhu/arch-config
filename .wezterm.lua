local wezterm = require 'wezterm'

local mux = wezterm.mux

wezterm.on("gui-startup", function()
  local tab, pane, window = mux.spawn_window{}
  window:gui_window():maximize()
end)

return {

    -- Color Scheme and Visual Styling
    color_scheme = 'Catppuccin Mocha',
    window_background_opacity = 0.95,
    window_decorations = 'NONE',
    
    -- Font Configuration
    font = wezterm.font('JetBrains Mono'),
    font_size = 10.0,
    
    -- Disable tab bar for a cleaner look
    -- enable_tab_bar = true,
    hide_tab_bar_if_only_one_tab = true,
    
    -- Window and Pane Border Configuration
    window_frame = {
        -- Blue Neon Border Configuration
        border_left_width = 1,         -- Corrected width to numeric value (px is optional)
        border_right_width = 1,        -- Corrected width to numeric value (px is optional)
        border_top_height = 1,         -- Use height for top and bottom borders
        border_bottom_height = 1,      -- Use height for top and bottom borders
        border_left_color = '#00E5FF', -- Bright cyan-blue neon color
        border_right_color = '#00E5FF', -- Consistent neon blue
        border_top_color = '#00E5FF',  -- Bright, electric blue
        border_bottom_color = '#00E5FF', -- Maintaining neon aesthetic
    },
    
    -- Pane Border Styling
    colors = {
        split = '#00E5FF',  -- Matching neon blue for split borders
        tab_bar = {
            background = '#1e1e2e',  -- Maintaining Catppuccin Mocha background
        },
    },
    
    -- Existing Keybindings (from previous configuration)
    keys = {
        -- Fullscreen and Clear Scroll Existing Bindings
        {
            key = 'f',
            mods = 'CTRL',
            action = wezterm.action.ToggleFullScreen,
        },
        {
            key = '\'',
            mods = 'CTRL',
            action = wezterm.action.ClearScrollback 'ScrollbackAndViewport',
        },
        
        -- Horizontal Split (Alt + /)
        {
            key = 'v',
            mods = 'ALT',
            action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
        },
        
        -- Vertical Split (Alt + -)
        {
            key = 'p',
            mods = 'ALT',
            action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
        },
        
        -- Pane Navigation (Alt + wasd)
        {
            key = 'a',
            mods = 'ALT',
            action = wezterm.action.ActivatePaneDirection 'Left',
        },
        {
            key = 'd',
            mods = 'ALT',
            action = wezterm.action.ActivatePaneDirection 'Right',
        },
        {
            key = 'w',
            mods = 'ALT',
            action = wezterm.action.ActivatePaneDirection 'Up',
        },
        {
            key = 's',
            mods = 'ALT',
            action = wezterm.action.ActivatePaneDirection 'Down',
        },
        
        -- Close Current Pane
        {
            key = 'q',
            mods = 'ALT',
            action = wezterm.action.CloseCurrentPane { confirm = true },
        },
    },
    
    -- Mouse Bindings
    mouse_bindings = {
        {
            event = { Up = { streak = 1, button = 'Left' } },
            mods = 'CTRL',
            action = wezterm.action.OpenLinkAtMouseCursor,
        },
    },
}

