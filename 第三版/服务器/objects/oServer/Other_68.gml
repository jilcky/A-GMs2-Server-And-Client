
show_debug_message( async_load[?"type"])


var type = async_load[?"type"]




switch (type) {
	 #region 处理接入
	  case network_type_connect:
	  //处理接入Socket
        ds_list_add(ServerConnectSockList,async_load[?"socket"])
        break;
	#endregion  
	 #region 处理断开的玩家
	 case network_type_disconnect:
	#region 处理断开的 Socket
	var Pos = ds_list_find_index(ServerConnectSockList,async_load[?"socket"])
	ds_list_delete(ServerConnectSockList,Pos)
	#endregion
	#region 处理断开的 玩家
	ds_map_delete(ServerPlayerMap,async_load[?"socket"])
	#endregion
        break;
		#endregion
	 #region 事件接入包
	  case network_type_data:
	  //拖入buffer后面处理
	 var buffer = async_load[?"buffer"]
       ds_list_add(ServerBufferList,buffer_read(buffer,buffer_string))
	   ds_list_add(ServerBufferIDList,async_load[?"id"])
        break;
		#endregion
	
    default:
        // code here
        break;
}