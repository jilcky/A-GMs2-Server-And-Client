/// @description Insert description here
// You can write your code in this editor
run = true;
if  ds_list_size(ServerBufferList)
for (var i = 0; i < ds_list_size(ServerBufferList); ++i) {
	
	#region //解析拆开包
	var BufferStr = ds_list_find_value(ServerBufferList,i)
	var BufferMap = ds_map_create()
	ds_map_read(BufferMap,BufferStr)
	#endregion
	
	
	
	#region //处理指令 
		var key = ds_map_find_first(BufferMap)
	for (var i = 0; i < ds_map_size(BufferMap); ++i) {
		show_debug_message("解包内容"+string(key)+"_"+string(BufferMap[?key]))
	    key = ds_map_find_next(BufferMap,key)
	}
	#region 读取信息
		//玩家id
	var client  = ds_list_find_value(ServerBufferIDList,0)
	//玩家名 
	var clientName = BufferMap[?"账号"]
	//携带的信息
	var BufferInfo = BufferMap[?"携带信息"]
	// 指令类型
	var Type =  BufferMap[?"指令"]
	// 指令ID
	var ID = BufferMap[?"指令ID"]
	#endregion

	#region 执行指令
	var ReturnInfo = 0
	
	switch (Type) {
		#region 处理 登陆
		case "登陆":
	       ini_open("用户账号密码.ini")
		  if ini_key_exists("账号密码",clientName)//有账号
		  {
			  //密码正确
			if BufferInfo == ini_read_string("账号密码",clientName,-4)
			{
				ReturnInfo = true;
			}			
				var _Key = ds_map_find_first(ServerPlayerMap)
				for (var i = 0; i < ds_map_size(ServerPlayerMap); ++i) {
				 
				 //验证是否有已经登陆的
				 if ds_map_find_value(ServerPlayerMap,_Key) = clientName
				 {
					network_destroy(_Key)
				 }
				 
				 var _Key = ds_map_find_next(ServerPlayerMap,_Key)
				 
				 
				}
			   ds_map_add(ServerPlayerMap,client,clientName)
		  }
		   ini_close()
	        break;
		#endregion
	    #region 处理 注册
		case "注册":
	        ini_open("用户账号密码.ini")
		  if !ini_key_exists("账号密码",clientName)//有账号
		  {
			ini_write_string("账号密码",clientName,BufferInfo)
			ReturnInfo = true;
		  }
		   ini_close()
	        break;
		#endregion
		#region 处理 保存
		case "保存":
		
				var ReadMap = ds_map_create()
				var RStr =  string(ds_map_find_value(BufferMap,"携带信息"))
				ds_map_read(ReadMap,RStr)
				//Gay = ds_map_create()
				
				
			ini_open("玩家信息/"+string(clientName)+".ini")
				show_debug_message(clientName)
			
				if ReadMap != -1
				{	var Key = ds_map_find_first(ReadMap)
					for (var i = 0; i < ds_map_size(ReadMap); ++i) {
					    // code here
						var Var = ds_map_find_value(ReadMap,Key);
						
						show_debug_message(string(Key)+"_"+string(Var))
						is_real(Var)
						{
							ini_write_real("存档信息",Key,Var)
							ini_write_string("type",Key,"real")
						}
						is_string(Var)
						{
							ini_write_string("存档信息",Key,Var)
							ini_write_string("type",Key,"string")
						}
						
						
						key = ds_map_find_next(ReadMap,Key)
					}
					
					ReturnInfo = true
				}
				
			ini_close()
	        break;
		#endregion
		#region 处理 读取
		case "读取":
	        	ini_open("玩家信息/"+string(clientName)+".ini")
				//读取请求的list写入
				var List = ds_list_create()
				ds_list_read(List,BufferInfo)
				
				 RetrunMap = ds_map_create()
				
				if List  != -1 //这玩意创建成立
				{
					for (var i = 0; i < ds_list_size(List); ++i) {
					    var Var = ds_list_find_value(List,i)
						
						//type
						if ini_key_exists("type",Var)
						{
							//先检测是否有无 没有本身也不写入任何东西
							 var type = ini_read_string("type",Var,undefined)
							 
							if type = "real"
							{
								var RetrunVar = ini_read_real("存档信息",Var,undefined)
							}
							if type = "string"
							{
								var RetrunVar = ini_read_string("存档信息",Var,undefined)
							}
							
							ds_map_add(RetrunMap,Var,RetrunVar)
							
						}
						
						
					}
				}
				//打包导出一个map
				ReturnInfo = ds_map_write(RetrunMap)
				
				ds_map_destroy(RetrunMap)
				ds_list_destroy(List)
				
			ini_close()   
	        break;
		#endregion
		#region 处理 聊天
		case "聊天":
			//现在偷懒全部都发送
	        for (var i = 0; i < ds_list_size(ServerConnectSockList); ++i) {
			    var SeedMap = ds_map_create()
				ds_map_add(SeedMap,"账号",clientName)
				ds_map_add(SeedMap,"指令",Type)
				ds_map_add(SeedMap,"指令ID",ID)
				ds_map_add(SeedMap,"携带信息",BufferInfo)
	
				//进行发送
				NetSeedStr(ds_map_write(SeedMap),ServerConnectSockList[|i])
	
				ds_map_destroy(SeedMap)
				ReturnInfo = true
			}
	        break;
		#endregion
	    default:
	        // code here
	        break;
	}
	
	#endregion
	
	
                	#region 处理后将结果扔回去
	var SeedMap = ds_map_create()
	ds_map_add(SeedMap,"账号",clientName)
	ds_map_add(SeedMap,"指令",Type)
	ds_map_add(SeedMap,"指令ID",ID)
	ds_map_add(SeedMap,"携带信息",ReturnInfo)
	
	show_debug_message(ReturnInfo)
	
	//进行发送
	NetSeedStr(ds_map_write(SeedMap),client)
	
	ds_map_destroy(SeedMap)
	
	
	#endregion
	#endregion


	
	#region //销毁收尾
	ds_map_destroy(BufferMap)
	ds_list_delete(ServerBufferIDList,0)
	ds_list_delete(ServerBufferList,0)
	#endregion	
}