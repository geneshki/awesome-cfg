local wibox = require "wibox"
battery = wibox.widget.textbox()
function getBatteryStatus()
  local healthy='#95e454' --'#859900'
  local low='#ff0000' -- '#b58900'
  local discharge='#dc322f'
  local capacityColour
  local statusColor
  local fd = io.popen("cat /sys/class/power_supply/BAT0/capacity")
  local capacity = tonumber(fd:read())
  fd:close()
  --print(capacity)
  ---[[
  if capacity ~= nil and capacity <= 25 then
    capacityColour=low
  else
    capacityColour=healthy
  end
  --]]
  fd = io.popen("cat /sys/class/power_supply/AC0/online")
  local status = fd:read()
  fd:close()
  --print(status)

  ---[[
  if  status == "0" then
    statusColour=discharge
    status="▼"
--    status="v"
  else
    statusColour=healthy
    status="▲"
--    status="^"
  end
  fd = io.popen("cat /sys/class/power_supply/BAT0/energy_full_design")
  local e_design = tonumber(fd:read())
  fd:close()
  fd = io.popen("cat /sys/class/power_supply/BAT0/energy_full")
  local e_now = tonumber(fd:read())
  fd:close()
  local health = e_now / e_design
  health = math.floor(health * 100) / 100
  local markup = "Bat: <span color=\"" .. capacityColour .. "\">" .. capacity .. "%</span> <span color=\"" .. statusColour .. "\">" .. status .. "</span> Bat. Health <span>" .. health .. "</span>"
  return markup 
end

-- battery:set_markup(getBatteryStatus())
if custom_widgets["right"]["mywibox"] == nil then
  custom_widgets["right"]["mywibox"] = Layout:new()
end
custom_widgets["right"]["mywibox"]:add(battery)


table.insert(custom_widgets_setup, function ()
  -- Battery status timer
  local batteryTimer = timer({timeout = 10})
  batteryTimer:connect_signal("timeout", function()
    battery:set_markup(getBatteryStatus())
  end)
  batteryTimer:start()
  battery:set_markup(getBatteryStatus())
  table.insert(timers, batteryTimer)
end)

   --]]
