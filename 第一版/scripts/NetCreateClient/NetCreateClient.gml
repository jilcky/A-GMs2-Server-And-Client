var Port = 12450
var Type = network_socket_tcp
var Url = "127.0.0.1"


ClientInfo = ds_map_create()
var map = ClientInfo
ds_map_add(map,"端口",Port)
ds_map_add(map,"类型",Type)
ds_map_add(map,"接收buffer列表",ds_list_create())
ds_map_add(map,"发送buffer列表",ds_list_create())


Client = network_create_socket(Type)
return network_connect(Client,Url,Port)
