local Layout = {}
function Layout:new()
  local layout = {}
  layout.prototype = {count=0}
  setmetatable(layout, self)
  self.__index = self
  layout.widgets = {}
  return layout
end
function Layout:get_count()
  return self.prototype.count
end
function Layout:add(o, ind)
  local result = 0
  if ind == nil then
    table.insert(self.widgets, o)
    result = self.prototype.count + 1
  else
    table.insert(self.widgets, o, ind)
    result = ind
  end
  self.prototype.count = self.prototype.count + 1
  return result
end
function Layout:remove(ind)
  local result
  if self.prototype.count == 0 then
    return nil
  end
  if ind == nil then
    result = table.remove(self.widgets)
  else
    result = table.remove(self.widgets, ind)
  end
  self.prototype.count = self.prototype.count - 1
  return result
end
function Layout:get_widget(ind)
  return self.widgets[ind]
end
return Layout
