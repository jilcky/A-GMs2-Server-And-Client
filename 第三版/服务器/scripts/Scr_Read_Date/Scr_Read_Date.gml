with(oGetDate){
	
	if Lock_Read_Date = false
	Lock_Read_Date = true
	else
	exit;
	
if network_type_data{
var _Key = ds_map_find_first(async_load)
for (var i = 0; i < ds_map_size(async_load); ++i) {
   show_debug_message(string(_Key)+":"+string(ds_map_find_value(async_load,_Key)))
   var _Key = ds_map_find_next(async_load,_Key)
}
}

ds_map_clear(Net_Date);

var _key = ds_map_find_first(async_load)
for (var i = 0; i < ds_map_size(async_load); ++i) {
	if _key = "buffer" 
	{
		var _Str = buffer_read(async_load[?"buffer"],buffer_string)
		Net_Date[?"buffer"] = _Str
	}
	else
	 Net_Date[?_key] = async_load[?_key]
	 
	 
	 _key = ds_map_find_next(async_load,_key)
}

if async_load[?"type"] = network_type_data{
ds_map_clear(Read_Date)
		ds_map_read(Read_Date,Net_Date[?"buffer"])
}

}