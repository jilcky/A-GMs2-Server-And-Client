/// @description 
#region 处理接收到的信息
if ds_list_size(ServerInfo[?"接收buffer列表"])
{
	//拆包
	var map = ds_map_create() 
	ds_map_read(map,ds_list_find_value(id,0))
	
	if map!=-1//读取验证成功
	{	//我还要考虑 
	/*
	1.被多次请求多次执行同一件事情X
	2.用户已经断开 没来得及处理返回O
	3.用户顶线的行为
	*/
	#region 验证这个 指令是否值得执行
	var Run = false;
		if (map[?"处理人"] == "服务端")
		if ds_map_exists(ServerInfo[?"在线用户"],map[?"socket"]) //这个sock是否还链接着
		if ds_map_find_value(ServerInfo[?"在线用户"],map[?"socket"]) == map[?"用户"] //用户是否相同
		Run = true
	#endregion
	#region 处理
	 if  Run 
		switch (map[?"指令"]) {
			#region 用户进行注册
			case "注册":
		       ini_open("账号密码.ini")
			 var Info =   ini_key_exists("用户名单",map[?"账号"])
			 if Info = false
			 {	
				 //用户注册成功
				 }
			 else
			 {
				//注册失败
			 }
			   ini_close()
		    
		        break;
			#endregion
			#region 用户进行登陆
				case "登陆" :
			ini_open("账号密码.ini")
			//验证是否注册了
			 var Info =   ini_key_exists("用户名单",map[?"账号"])
			 if Info = true
			 {
				//检测密码正确与否
				var Info = 	ini_read_string("用户名单",map[?"账号"],0)
				if Info = map[?"密码"]
				{
					//正确进行登陆
					//添加入在线人员
					ds_map_add(ServerInfo[?"在线用户"],map[?"Socket"],map[?"账号"])
				}
				else
				{
				//密码错误返回失败
				}
			 }
			 else
			 {
				 //没有注册返回失败
			 }
			 
				ini_close()
				break;
			#endregion
			#region 用户请求验证存档
			case "验证存档":
			ini_open("用户信息/"+string(map[?"用户"])+".ini")
			var Info = ini_key_exists("存档信息","MD5")
			if Info = true
			{
				if map[?"MD5"] == ini_read_string("存档信息","MD5",0)
				{
					//读取存档
				}
				else
				{
					//异常要覆盖存档 服务器发送存档过去
				}
			}
			else
			{
				//用户没有存档 客户端跳过读取
			}
			ini_close()
			break;
			#endregion
			#region 上传保存
			case "保存":
		ini_open("用户信息/"+string(map[?"用户"])+".ini")
			ini_write_string("账号信息","MD5",map[?"MD5"])
			ini_write_string("存档信息","存档Map整合",map[?"存档"])
				//var Infomap = ds_map_create()
				//ds_map_read(Infomap,map[?"存档信息"])
				//if Infomap{
				//	var key = ds_map_find_first(Infomap)
				//	for (var i = 0; i < ds_map_size(Infomap); ++i) {
				//		ini_write_string("存档信息",key,ds_map_find_value(Infomap,key))
				//	    key = ds_map_find_next(Infomap,key)
				//	}}
					ds_map_destroy(Infomap)
		//返回保存成功
		//保存成功才能保存入本地
		ini_close()
				
			#endregion
			#region 读取信息
			case "读取":
					ini_open("用户信息/"+string(map[?"用户"])+".ini")
				//	服务器发送一个整个全部背包信息的map
				var Info = 	ini_read_string("存档信息","存档map整合",0)
				
					ini_close()
			
			
			break;
			#endregion
		    default:
		        // code here
		        break;
		}
	}
#endregion

	ds_map_destroy(map)
	ds_list_delete(ServerInfo[?"接收buffer列表"],0)
	
}
#endregion

#region 处理等待发送的信息
if ds_list_size(ServerInfo[?"发送buffer列表"])
{
//	NetSeedStr()
ds_list_delete(ServerInfo[?"发送buffer列表"],0)
}
#endregion
