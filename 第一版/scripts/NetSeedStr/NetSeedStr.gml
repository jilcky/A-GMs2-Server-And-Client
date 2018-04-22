var Str = argument0
var Sock = argument1


var  var_buffer = buffer_create(string_length(str), buffer_grow, 1);
buffer_seek( var_buffer, buffer_seek_start, 0);
buffer_write( var_buffer, buffer_string,str);
var Seed =  network_send_packet(Sock,  var_buffer, buffer_tell( var_buffer))
buffer_delete( var_buffer)
return Seed