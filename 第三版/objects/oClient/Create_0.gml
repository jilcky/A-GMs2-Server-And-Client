

network_set_config(network_config_connect_timeout, 6000);
network_set_config(network_config_use_non_blocking_socket, 1);

//等待服务器回应
NetLoding = false;
//接入了服务器
ConnectServer = false;
//登陆了游戏
loginGame = false;


//弹出窗口
ShowAsyncDialog = false;
//下分类
AsyncSign= -4;
AsyncLogin = -4;
AsyncSeedMassage = -4;
AsyncSave = -4;
AsyncLoad = -4
AsyncGetIP = noone
AsyncGetPort = noone

//玩家账号信息
Username = ""
Password = ""


enum GameInfo
{
W = 1920,
H = 1080
}

window_set_size(GameInfo.W/4,GameInfo.H/4)

display_set_gui_size(GameInfo.W,GameInfo.H)

//var L ;//= 0
L[0] = "接入服务器"
L[1] = "进行注册"
L[2] = "进行登陆"
L[3] = "保存信息"
L[4] = "读取信息"
L[5] = "发送聊天信息"

draw_set_font(font0)

var W = string_width(L[0])
var Size = array_length_1d(L)
for (var i = 0; i < Size; ++i) {
    Button[i] = ds_map_create()
var map = Button[i]
var w = string_width(L[i])
var W = max(W,w)

ds_map_add(map,"X",GameInfo.W - W)
ds_map_add(map,"W",W)

var H = string_height(L[i])
ds_map_add(map,"Y",GameInfo.H-(Size - i)*H)
ds_map_add(map,"H",H)
}


MassageList = ds_list_create()
MassageSurface = -1

LI = 0

global.SeedID = 0

alarm[0] = room_speed

NetCount = true