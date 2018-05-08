//创建服务器
Server = network_create_server(network_socket_tcp,12450,999)

//服务器buffer堆叠
ServerBufferList = ds_list_create();
ServerBufferIDList = ds_list_create();

//接入的sock都在这里
ServerConnectSockList = ds_list_create();
//登录用户清单
ServerPlayerMap = ds_map_create();

 B = ds_map_create()
ds_map_read(B,"920100000100000001000000050000006A696C636B01000000080000006A616C6B73646A66")
