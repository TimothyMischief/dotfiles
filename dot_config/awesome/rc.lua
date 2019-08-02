--[[
Awesome 4.3 RC
  @TimothyDespair

This is the procedural bit. Most configuration should go in `settings.lua`
]]

-- LUAROCKS --------------------------------------------------------------------

pcall(require, "luarocks.loader")

-------------------------------------------------------------------- LUAROCKS --
-- THEME -----------------------------------------------------------------------

local beautiful = require("beautiful")
local theme_dir = os.getenv("HOME") .. ".config/awesome/themes/"

dpi = xresources.apply_dpi

beautiful.init( theme_dir .. theme_name .. "/theme.lua" )
local xresources = require("beautiful.xresources")

----------------------------------------------------------------------- THEME --
-- AWESOME ---------------------------------------------------------------------

local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
require("awful.autofocus")

local naughty = require("naughty")

local menubar = require("menubar")
require("awful.hotkeys_popup.keys")

--------------------------------------------------------------------- AWESOME --
-- ERRORS ----------------------------------------------------------------------
-- Startup Errors
if awesome.startup_errors then
  naughty.notify
    ( { preset = naughty.config.presets.critical
      , title  = "There were errors during startup. What did you break?"
      , text   = awesome.startup_errors } )
end

-- Runtime Errors
do
  local in_error = false
  awesome.connect_signal
    ( 'debug::error'
    , function (err)
        if in_eror then return end
        in_error = true

        naughty.notify
          ( { preset = naughty.config.presets.critical
            , title  = "There was a runtime error. What did you break?"
            , text   = toString(err) } )
        in_error = false end ) end
---------------------------------------------------------------------- ERRORS --
-- QUICK SETTINGS --------------------------------------------------------------
local settings = require(settings)
--------------------------------------------------------------------------------

awful.layout.layouts = settings.layouts
menubar.utils.terminal = terminal

-- WALLPAPER -------------------------------------------------------------------

local function set_wallpaper(s)
  if beautiful.wallpaper then
    local wallpaper = beautiful.wallpaper
    -- If wallpaper is a function, call it with the screen
    if type(wallpaper) == "function" then wallpaper = wallpaper(s) end
    gears.wallpaper.maximized(wallpaper, s, true) end end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

------------------------------------------------------------------- WALLPAPER --
-- SCREENS ---------------------------------------------------------------------
local attach_bar = require("bars/"..settings.active_bar_theme)

awful.screen.connect_for_each_screen(function(s)
  set_wallpaper(s)

  awful.tag({ "1", "2", "3", "4", "5", "6" }, s, awful.layout.layouts[1])

  attach_bar(s)
end)
--------------------------------------------------------------------- SCREENS --
-- MOUSE -----------------------------------------------------------------------
root.buttons
  ( gears.table.join
      ( awful.button ( { }, 3, function () mymainmenu:toggle() end)
      , awful.button ( { }, 4, awful.tag.viewnext )
      , awful.button ( { }, 5, awful.tag.viewprev ) ) )

----------------------------------------------------------------------- MOUSE --
-- KEYS ------------------------------------------------------------------------

local keys = require("keys")
root.keys(keys)

require("rules")

require("clients")
