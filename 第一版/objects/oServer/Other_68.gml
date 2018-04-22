/// @description 
var eventid =   async_load[?"id"];
var type = async_load[?"type"]
#region//服务端接入事件
if eventid == Server{
if type == network_type_connect
{
	//添加到Socket列表
	ds_list_add(ServerInfo[?"Socket列表"],async_load[?"socket"])	
}
//服务器断开事件
if type == network_type_disconnect
{
	//清理Socket列表内的内容
	var Pos = ds_list_find_index(ServerInfo[?"Socket列表"],async_load[?"socket"])
	ds_list_delete(ServerInfo[?"Socket列表"],Pos)
	
	//清理在线用户(要是进行了登陆)
	if ds_map_exists(ServerInfo[?"在线用户"],async_load[?"socket"])
		ds_map_delete(ServerInfo[?"在线用户"],async_load[?"socket"])
}
	}
	
#endregion

#region //服务端 接收到了包 一般我都是将包 弄成一个map转为string发送 直接 string 塞入即可
if type == network_type_data
{
	ds_list_add(ServerInfo[?"接收Buffer列表"],buffer_read(async_load[?"buffer"],buffer_string))
}
#endregion	

