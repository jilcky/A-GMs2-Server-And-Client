Scr_Read_Date()

switch (oGetDate.Net_Date[?"type"]) {
    case network_type_non_blocking_connect:
       if  oGetDate.Net_Date[?"succeeded"] = true
	   {
		ConnectServer = true
		AddMassage("接入服务器成功")
	   }
	   else
	   {
		network_destroy( Client)
		AddMassage("接入服务器失败")
	   }
        break;
	case network_type_data:

var ID =oGetDate.Read_Date[?"指令ID"]
		switch (oGetDate.Read_Date[?"指令"]) {
		    case "登陆":
		        if oGetDate.Read_Date[?"携带信息"] = true
				{
					loginGame = true
					AddMassage("登陆 成功"+"_"+string(ID))
				}
			else
				{
					AddMassage("登陆 失败"+"_"+string(ID))
				}
		        break;
				
			 case "注册":
		        if oGetDate.Read_Date[?"携带信息"] = true
				{
					//loginGame = true
					AddMassage("注册 成功"+"_"+string(ID))
				}
			else
				{
					AddMassage("注册 失败"+"_"+string(ID))
				}
		        break;
				
				
				case "读取":
				var ReadMap = ds_map_create()
				ds_map_read(ReadMap,oGetDate.Read_Date[?"携带信息"])
				
				var key = ds_map_find_first(ReadMap)
				for (var i = 0; i < ds_map_size(ReadMap); ++i) {
				   AddMassage("获取到信息"+string(key)+":"+string(ReadMap[?key]))
				   key = ds_map_find_next(ReadMap,key)
				}
				break;
				 case "保存":
		        if oGetDate.Read_Date[?"携带信息"] = true
				{
					//loginGame = true
					AddMassage("保存 成功"+"_"+string(ID))
				}
			else
				{
					AddMassage("保存 失败"+"_"+string(ID))
				}
		        break;
				 case "聊天":
		        if is_string( oGetDate.Read_Date[?"携带信息"])
				{
					AddMassage(oGetDate.Read_Date[?"账号"]+":"+oGetDate.Read_Date[?"携带信息"]+"_"+string(ID))
				}
		    default:
		        // code here
		        break;
		}
		
		break;
    default:
        // code here
        break;
}
