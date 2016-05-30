local awful = require "awful"
if custom_globalkeys == nil then
  custom_globalkeys = {}
end
custom_globalkeys = awful.util.table.join(custom_globalkeys,
  awful.key({ }, "XF86KbdBrightnessDown", function () awful.util.spawn("kb-light.py -") end),
  awful.key({ }, "XF86KbdBrightnessUp", function () awful.util.spawn("kb-light.py +") end)
)
