local awful = require "awful"
local cfg = awful.util.getdir("config")
--              folder        widget
dofile(cfg .. "/widgets" .. "/kbd.lua")
dofile(cfg .. "/widgets" .. "/battery.lua")
dofile(cfg .. "/widgets" .. "/kbd_backlight.lua")
dofile(cfg .. "/widgets" .. "/sound.lua")

