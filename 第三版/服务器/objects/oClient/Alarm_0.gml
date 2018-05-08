/*
var _Name = irandom(LI*1000)
var _Date = irandom(LI*1000)
var _Username = irandom(LI)
if ConnectServer and loginGame and !ShowAsyncDialog{
var SeedMap = ds_map_create()
ds_map_add(SeedMap,"账号",_Username)
ds_map_add(SeedMap,"指令","保存")
var Smap = ds_map_create()
ds_map_add(Smap,_Name,_Date)

ds_map_add(SeedMap,"携带信息",ds_map_write(Smap))
NetSeedStr(ds_map_write(SeedMap),Client)
ds_map_destroy(SeedMap)




var SeedMap = ds_map_create()
ds_map_add(SeedMap,"账号",_Username)
ds_map_add(SeedMap,"指令","读取")

var GetList = ds_list_create()
//show_debug_message("保存neritic"+string(ds_map_find_value(async_load, "result")))
ds_list_add(GetList,_Name)

ds_map_add(SeedMap,"携带信息",ds_list_write(GetList))
NetSeedStr(ds_map_write(SeedMap),Client)
ds_map_destroy(SeedMap)



}

alarm[0] = room_speed