# awesome-cfg
My config of the Awesome WM

# Good to note:
The `rc.lua` is enhanced to minimize its editing. Therefore you generally do not need to edit rc.lua.
##Widgets
If you want to add a widget

You need to add the widget to a table in `custom_widgets` like so:
```
  custom_widgets["left"]["mywibox"]:add(mywidget)
```
in a separate lua file.
Then add it to the `widget_includes.lua` file like so:
```
  dofile("path/to/widget/file.lua")
```
Now it will show up on the left of `mywibox`

##Timers
Adding timers is easy. Just add the timer to the global `timers` table

##Widget setup
if your widget needs a setup of sort. Add a function which would carry out the
setup in the `custom_widgets_setup` global table

## To Do:
get rid of the use of global variables as a session. (Globals are evil! But they work for now...)
