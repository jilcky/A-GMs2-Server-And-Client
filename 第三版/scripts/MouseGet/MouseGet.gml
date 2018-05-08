
var Device = argument0
var X = argument1
var Y = argument2
var W = argument3
var H = argument4

if device_mouse_x(Device) - X >= 0
and device_mouse_x(Device) - X <= W
and device_mouse_y(Device) - Y >= 0
and device_mouse_y(Device) - Y <= H
{
    return true
}
else
{
    return false
}
