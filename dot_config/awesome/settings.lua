

local settings =
  { terminal = "urxvt"
  , editor = os.getenv("EDITOR") or "vim"
  , editor_cmd = terminal .. " -e " .. editor
  , modkey = "Mod4"
  , themes =
      { "gruvy" }
  , active_theme = "gruvy"
  , bar_themes =
      { "laptop" }
  , active_bar_theme = "laptop"
  , layouts =
      { awful.layout.suit.floating
      , awful.layout.suit.tile
      -- , awful.layout.suit.tile.left
      , awful.layout.suit.tile.bottom
      -- , awful.layout.suit.tile.top
      , awful.layout.suit.fair
      , awful.layout.suit.fair.horizontal
      -- , awful.layout.suit.spiral
      -- , awful.layout.suit.spiral.dwindle
      , awful.layout.suit.max
      -- , awful.layout.suit.max.fullscreen
      -- , awful.layout.suit.magnifier
      -- , awful.layout.suit.corner.nw
      -- , awful.layout.suit.corner.ne
      -- , awful.layout.suit.corner.sw
      --[[, awful.layout.suit.corner.se]] } }

return settings
