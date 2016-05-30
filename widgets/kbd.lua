local wibox = require "wibox"
local beautiful = require "beautiful"
local awful = require "awful"
local Layout = require("layout")
local kbdcfg = {}
kbdcfg.cmd = "setxkbmap"
kbdcfg.layout = { { "us", "dvorak" , "US_DV" }, {"bg", "", "BG"}, {"de", "", "DE"}, { "us", "" , "US" } } 
kbdcfg.current = 1  -- us is our default layout
kbdcfg.widget = wibox.widget.textbox()
kbdcfg.widget:set_text(" " .. kbdcfg.layout[kbdcfg.current][3] .. " ")
kbdcfg.switch = function ()
  kbdcfg.current = kbdcfg.current % #(kbdcfg.layout) + 1
  local t = kbdcfg.layout[kbdcfg.current]
  kbdcfg.widget:set_text(" " .. t[3] .. " ")
  os.execute( kbdcfg.cmd .. " " .. t[1] .. " " .. t[2] ) -- "us_dv" )-- t[2] )
end

-- Mouse bindings
kbdcfg.widget:buttons(
 awful.util.table.join(awful.button({ }, 1, function () kbdcfg.switch() end))
)

--[[
local kbdwidget = wibox.widget.textbox(" Eng ")
kbdwidget.border_width = 1
kbdwidget.border_color = beautiful.fg_normal
kbdwidget:set_text(" Eng ")

local kbdstrings = {[0] = " Eng ", 
              [1] = " Rus "}

dbus.request_name("session", "ru.gentoo.kbdd")
dbus.add_match("session", "interface='ru.gentoo.kbdd',member='layoutChanged'")
dbus.connect_signal("ru.gentoo.kbdd", function(...)
    local data = {...}
    local layout = data[2]
    kbdwidget:set_markup("<b>" + kbdstrings[layout]+"</b>")
    end
)
--]]

if custom_widgets["right"]["mywibox"] == nil then
  custom_widgets["right"]["mywibox"] = Layout:new()
end
custom_widgets["right"]["mywibox"]:add(kbdcfg.widget)
  -- mywibox[1].widget.right:add(kbdwidget)

-- Alt + Right Shift switches the current keyboard layout
if custom_globalkeys == nil then
  custom_globalkeys = {}
end
custom_globalkeys = awful.util.table.join(custom_globalkeys,
  awful.key({ "Mod1",            }, "Shift_L", function () kbdcfg.switch() end),
  awful.key({ "Mod1",            }, "Shift_R", function () kbdcfg.switch() end)
)
