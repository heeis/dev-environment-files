local wezterm = require("wezterm")
local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config = {
  default_cursor_style = "SteadyBar",
  automatically_reload_config = true,
  window_close_confirmation = "NeverPrompt",
  adjust_window_size_when_changing_font_size = false,
  window_decorations = "RESIZE",
  check_for_updates = false,
  enable_tab_bar = true,
  hide_tab_bar_if_only_one_tab = false,
  use_fancy_tab_bar = false,
  tab_bar_at_bottom = true,
  tab_and_split_indices_are_zero_based = true,
  font_size = 12.5,
  -- font = wezterm.font("JetBrains Mono", { weight = "Bold" }),
  font = wezterm.font_with_fallback({
    { family = "JetBrains Mono", weight = "Bold" },
    { family = "D2Coding", weight = "Bold" },
  }),
  window_padding = {
    left = 3,
    right = 3,
    top = 0,
    bottom = 0,
  },
  background = {
    {
      source = {
        File = "/Users/" .. os.getenv("USER") .. "/.config/wezterm/dark-desert.jpg",
      },
      hsb = {
        hue = 1.0,
        saturation = 1.02,
        brightness = 0.25,
      },
      -- attachment = { Parallax = 0.3 },
      -- width = "100%",
      -- height = "100%",
    },
    {
      source = {
        Color = "#282c35",
      },
      width = "100%",
      height = "100%",
      opacity = 0.55,
    },
  },
  -- from: https://akos.ma/blog/adopting-wezterm/
  hyperlink_rules = {
    -- Matches: a URL in parens: (URL)
    {
      regex = "\\((\\w+://\\S+)\\)",
      format = "$1",
      highlight = 1,
    },
    -- Matches: a URL in brackets: [URL]
    {
      regex = "\\[(\\w+://\\S+)\\]",
      format = "$1",
      highlight = 1,
    },
    -- Matches: a URL in curly braces: {URL}
    {
      regex = "\\{(\\w+://\\S+)\\}",
      format = "$1",
      highlight = 1,
    },
    -- Matches: a URL in angle brackets: <URL>
    {
      regex = "<(\\w+://\\S+)>",
      format = "$1",
      highlight = 1,
    },
    -- Then handle URLs not wrapped in brackets
    {
      -- Before
      --regex = '\\b\\w+://\\S+[)/a-zA-Z0-9-]+',
      --format = '$0',
      -- After
      regex = "[^(]\\b(\\w+://\\S+[)/a-zA-Z0-9-]+)",
      format = "$1",
      highlight = 1,
    },
    -- implicit mailto link
    {
      regex = "\\b\\w+@[\\w-]+(\\.[\\w-]+)+\\b",
      format = "mailto:$0",
    },
  },
  unix_domains = {
    {
      name = "hy0007",
    },
  },
  default_gui_startup_args = { "connect", "hy0007" },
  scrollback_lines = 3000,
}

--local gpus = wezterm.gui.enumerate_gpus()
--config.webgpu_preferred_adapter = gpus[0]
--config.front_end = "WebGpu"
--config.animation_fps = 60

-- tmux
config.leader = { key = "b", mods = "CTRL", timeout_milliseconds = 2000 }
config.keys = {
  {
    mods = "LEADER",
    key = "c",
    action = wezterm.action.SpawnTab("CurrentPaneDomain"),
  },
  {
    mods = "LEADER",
    key = "x",
    action = wezterm.action.CloseCurrentPane({ confirm = true }),
  },
  {
    mods = "LEADER",
    key = "b",
    action = wezterm.action.ActivateTabRelative(-1),
  },
  {
    mods = "LEADER",
    key = "n",
    action = wezterm.action.ActivateTabRelative(1),
  },
  {
    mods = "LEADER",
    key = "|",
    action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
  },
  {
    mods = "LEADER",
    key = "-",
    action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
  },
  {
    mods = "LEADER",
    key = "h",
    action = wezterm.action.ActivatePaneDirection("Left"),
  },
  {
    mods = "LEADER",
    key = "j",
    action = wezterm.action.ActivatePaneDirection("Down"),
  },
  {
    mods = "LEADER",
    key = "k",
    action = wezterm.action.ActivatePaneDirection("Up"),
  },
  {
    mods = "LEADER",
    key = "l",
    action = wezterm.action.ActivatePaneDirection("Right"),
  },
  {
    mods = "LEADER",
    key = "LeftArrow",
    action = wezterm.action.AdjustPaneSize({ "Left", 5 }),
  },
  {
    mods = "LEADER",
    key = "RightArrow",
    action = wezterm.action.AdjustPaneSize({ "Right", 5 }),
  },
  {
    mods = "LEADER",
    key = "DownArrow",
    action = wezterm.action.AdjustPaneSize({ "Down", 5 }),
  },
  {
    mods = "LEADER",
    key = "UpArrow",
    action = wezterm.action.AdjustPaneSize({ "Up", 5 }),
  },
}

for i = 0, 9 do
  -- leader + number to activate that tab
  table.insert(config.keys, {
    key = tostring(i),
    mods = "LEADER",
    action = wezterm.action.ActivateTab(i),
  })
end

-- change to square if you don't like rounded tab style
local tab_style = "square"
-- leader active indicator prefix
local leader_prefix = utf8.char(0x1f30a) -- ocean wave
-- color scheme colors for easy access
local scheme_colors = {
  catppuccin = {
    macchiato = {
      rosewater = "f4dbd6",
      flamingo = "f0c6c6",
      pink = "f5bde6",
      mauve = "c6a0f6",
      red = "ed8796",
      maroon = "ee99a0",
      peach = "#f5a97f",
      yellow = "#eed49f",
      green = "#a6da95",
      teal = "#8bd5ca",
      sky = "#91d7e3",
      sapphire = "#7dc4e4",
      blue = "#8aadf4",
      lavender = "#b7bdf8",
      text = "#cad3f5",
      crust = "#181926",
    },
  },
}
local colors = {
  border = scheme_colors.catppuccin.macchiato.lavender,
  tab_bar_active_tab_fg = scheme_colors.catppuccin.macchiato.mauve,
  tab_bar_active_tab_bg = scheme_colors.catppuccin.macchiato.crust,
  tab_bar_text = scheme_colors.catppuccin.macchiato.crust,
  arrow_foreground_leader = scheme_colors.catppuccin.macchiato.lavender,
  arrow_background_leader = scheme_colors.catppuccin.macchiato.crust,
}

-- tab bar
local function tab_title(tab_info)
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
  local title = " " .. tab.tab_index .. ": " .. tab_title(tab) .. " "
  local left_edge_text = ""
  local right_edge_text = ""

  if tab_style == "rounded" then
    title = tab.tab_index .. ": " .. tab_title(tab)
    title = wezterm.truncate_right(title, max_width - 2)
    left_edge_text = wezterm.nerdfonts.ple_left_half_circle_thick
    right_edge_text = wezterm.nerdfonts.ple_right_half_circle_thick
  end

  -- ensure that the titles fit in the available space,
  -- and that we have room for the edges.
  -- title = wezterm.truncate_right(title, max_width - 2)

  if tab.is_active then
    return {
      { Background = { Color = colors.tab_bar_active_tab_bg } },
      { Foreground = { Color = colors.tab_bar_active_tab_fg } },
      { Text = left_edge_text },
      { Background = { Color = colors.tab_bar_active_tab_fg } },
      { Foreground = { Color = colors.tab_bar_text } },
      { Text = title },
      { Background = { Color = colors.tab_bar_active_tab_bg } },
      { Foreground = { Color = colors.tab_bar_active_tab_fg } },
      { Text = right_edge_text },
    }
  end
end)

wezterm.on("update-status", function(window, _)
  -- leader inactive
  local solid_left_arrow = ""
  local arrow_foreground = { Foreground = { Color = colors.arrow_foreground_leader } }
  local arrow_background = { Background = { Color = colors.arrow_background_leader } }
  local prefix = ""

  -- leaader is active
  if window:leader_is_active() then
    prefix = " " .. leader_prefix

    if tab_style == "rounded" then
      solid_left_arrow = wezterm.nerdfonts.ple_right_half_circle_thick
    else
      solid_left_arrow = wezterm.nerdfonts.pl_left_hard_divider
    end

    local tabs = window:mux_window():tabs_with_info()

    if tab_style ~= "rounded" then
      for _, tab_info in ipairs(tabs) do
        if tab_info.is_active and tab_info.index == 0 then
          arrow_background = { Foreground = { Color = colors.tab_bar_active_tab_fg } }
          solid_left_arrow = wezterm.nerdfonts.pl_right_hard_divider
          break
        end
      end
    end
  end

  window:set_left_status(wezterm.format({
    { Background = { Color = colors.arrow_foreground_leader } },
    { Text = prefix },
    arrow_foreground,
    arrow_background,
    { Text = solid_left_arrow },
  }))
end)

return config
