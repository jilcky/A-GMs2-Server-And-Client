var Str = argument0
var Sock = argument1


var  var_buffer = buffer_create(string_length(Str), buffer_grow, 1);
buffer_seek( var_buffer, buffer_seek_start, 0);
buffer_write( var_buffer, buffer_string,Str);
var Seed =  network_send_packet(Sock,  var_buffer, buffer_tell( var_buffer))
buffer_delete( var_buffer)
//ShowDebug(Seed)

//if instance_exists(oClient)
//oClient.SeedID ++

if !Seed {AddMassage("掉线了 自己重开游戏")}
return Seed