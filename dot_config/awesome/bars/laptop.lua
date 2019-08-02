local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")

local keys = require("keys")

local launcher = require("menu").menu_launcher
local volume = require("bars/buttons/volume")
local layout = require("bars/buttons/layout")
local taglist = require("bars/widgets/taglist")

local attach_bar = function(s)
  s.taglist = taglist(s)
  s.layout_button = taglist(s)

  s.wibox = awful.wibar(
    { visible = true
    , ontop = true
    , type = "dock"
    , position = "top"
    , height = beautiful.bar and beautiful.bar.height or dpi(26) } )

  s.wibox:setup
    { layout = wibox.layout.align.horizontal
    , { layout = wibox.layout.align.horizontal
      , launcher
      --[[ TODO Music ]] }
    , s.taglist
    , { layout = wibox.layout.align.horizontal
        -- VPN,
        -- WIFI,
      , volume
        -- BATTERY,
        -- BINARY CLOCK
      , s.layout_button } }

  awful.placement.maximize_horizontally(s.wibox) end

return attach_bar
