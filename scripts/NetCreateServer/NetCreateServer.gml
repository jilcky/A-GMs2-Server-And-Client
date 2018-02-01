var Port = 12450
var Type = network_socket_tcp
var MaxClients = 999

ServerInfo = ds_map_create()
var map = ServerInfo
ds_map_add(map,"端口",Port)
ds_map_add(map,"类型",Type)
ds_map_add(map,"最大人数",MaxClients)
ds_map_add(map,"接收buffer列表",ds_list_create())
ds_map_add(map,"发送buffer列表",ds_list_create())
ds_map_add(map,"Socket列表",ds_list_create())
ds_map_add(map,"在线用户",ds_map_create())
ds_map_add(map,"服务器时间",date_current_datetime())
ds_map_add(map,"Socket最大人数",MaxClients)
ds_map_add(map,"在线人数最大人数",666)

Server =  network_create_server(Type,Port,MaxClients)