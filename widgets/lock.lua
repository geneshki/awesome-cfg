local awful = require "awful"
if custom_globalkeys == nil then
  custom_globalkeys = {}
end
-- table.insert(custom_widgets_setup, function ()
  -- idle timer
local lockTimer = timer({timeout = 30})
lockTimer:connect_signal("timeout", function()
  local fd = io.popen("xscreensaver-command -time")
  local output = fd:read()
  if output ~= nil then
    if output:find(" blanked") or output:find(" locked") then
      awesome.emit_signal('screen_lock')
    elseif output:find(" unlocked") or output:find(" unblanked") then
      awesome.emit_signal('screen_unlock')
    end
  end
end)
lockTimer:start()
table.insert(timers, lockTimer)
-- end)
