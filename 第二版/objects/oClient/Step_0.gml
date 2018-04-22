//AddMassage("申请注册账号")

var Size = array_length_1d(Button);
var  Select = -1;
for (var i = 0; i < Size; ++i) {
var Map = Button[i]
var X = Map[?"X"]
var Y = Map[?"Y"]
var W = Map[?"W"]
var H = Map[?"H"]

if MouseGet(0,X,Y,W,H)
{
	Select = i;
}
}
if device_mouse_check_button_pressed(0,mb_left)
switch (Select) {
    case 0:
//        #region 接入服务器
if !ConnectServer //没有接入服务器
{
 AsyncGetIP  =  get_string_async("选择服务器IP","192.168.1.101") //get_string("选择服务器IP","119.28.142.17")
// AsyncGetPort = get_integer_async("选择端口",12450)
    
    //if GetIP  = "" or !GetPort 
    //exit;
    ////创建Socket
    //Client = network_create_socket(network_socket_tcp)
    //network_connect(Client,    
    //GetIP,
    //GetPort)
    
    //network_set_timeout(Client, 6000, 6000);
    
    //NetLoding = true
	//AddMassage("开始接入服务器")
	//AddMassage("开始接入服务器")
}
//#endregion
        break;

case 1:
//#region 进行注册
if ConnectServer and !loginGame and !ShowAsyncDialog
{
AsyncSign = get_login_async("","")
ShowAsyncDialog = true;
NetLoding = true;
	AddMassage("申请注册账号")

}
//#endregion
break;

case 2:
//#region 进行登陆
if ConnectServer and !loginGame and !ShowAsyncDialog
{
AsyncLogin = get_login_async("","")
ShowAsyncDialog = true;
NetLoding = true;
	AddMassage("申请登陆")
}
//#endregion
break;
case 3:
//#region 保存
if ConnectServer and loginGame and !ShowAsyncDialog
{
AsyncSave = get_login_async("","")
ShowAsyncDialog = true;
NetLoding = true;
	AddMassage("保存信息")
}
//#endregion
break;
case 4:
//#region 读取
if ConnectServer and loginGame and !ShowAsyncDialog
{
AsyncLoad = get_string_async("申请读取内容","")
ShowAsyncDialog = true;
NetLoding = true;
	AddMassage("读取信息")
}
//#endregion
break;
case 5:
//#region 聊天
if ConnectServer and loginGame and !ShowAsyncDialog
{
AsyncSeedMassage = get_string_async("发送聊天信息","")
ShowAsyncDialog = true;
NetLoding = true;
	
}
//#endregion
break;

    default:
        // code here
        break;
}


if !surface_exists(MassageSurface)
{
MassageSurface = surface_create(GameInfo.W,GameInfo.H)
}	
	draw_set_font(font0)
	draw_set_halign(0)
	draw_set_valign(2)
surface_set_target(MassageSurface)
	draw_clear_alpha(c_white,0)
var Size = ds_list_size(MassageList)
for (var i = Size; i > -1 ; i--) {
	var str = MassageList[|i]
	h = 32
	
	if !is_undefined(str){
	var h = string_height(str)
	draw_set_color(c_black)
   draw_text(0,GameInfo.H-(Size - i)*h,string(i)+":"+str)
  // draw_text(0,i*h,i)
	}
  // show_debug_message(string(i))
   
}

surface_reset_target()



LI = 1000




LI++