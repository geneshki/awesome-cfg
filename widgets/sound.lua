local wibox = require "wibox"
local beautiful = require "beautiful"
local awful = require "awful"
local Layout = require("layout")

local soundcfg = {}
soundcfg.cmd = "amixer -c 1 set Master"
soundcfg.widget = wibox.widget.textbox()
