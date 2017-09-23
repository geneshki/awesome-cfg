local wibox = require "wibox"
local beautiful = require "beautiful"
local awful = require "awful"
local ngLayout = require("ngLayout")

-- local apw = require(soundcfg
local apw_dir = awful.util.getdir("config") .. "/widgets/apw"
--[[
naughty.notify({ preset = naughty.config.presets.critical,
                 title = "Oops, there were errors during startup!",
                 text = awesome.startup_errors })
--]]
local apw = dofile(apw_dir .."/widget.lua")
-- add the widget to the right wibox panel
if custom_widgets["right"]["mywibox"] == nil then
  custom_widgets["right"]["mywibox"] = ngLayout:new()
end
custom_widgets["right"]["mywibox"]:add(apw)


if custom_globalkeys == nil then
  custom_globalkeys = {}
end
custom_globalkeys = awful.util.table.join(custom_globalkeys,
  awful.key({ }, "XF86AudioRaiseVolume",  apw.Up),
  awful.key({ }, "XF86AudioLowerVolume",  apw.Down),
  awful.key({ }, "XF86AudioMute",         apw.ToggleMute),
  awful.key({"Mod4"}, "F6",                 apw.Up),
  awful.key({"Mod4"}, "F5",                 apw.Down),
  awful.key({"Mod4"}, "F7",                 apw.ToggleMute)
)
