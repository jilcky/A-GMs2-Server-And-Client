
var Size = array_length_1d(Button);
//var  Select = -1;
for (var i = 0; i < Size; ++i) {
	var Map = Button[i]
	var X = Map[?"X"]
	var Y = Map[?"Y"]
	var W = Map[?"W"]
	var H = Map[?"H"]
	
	if MouseGet(0,X,Y,W,H)
	{
		draw_set_color(c_red)
	}
	else
		draw_set_color(c_black)
	draw_set_alpha(1)
	draw_rectangle(X,Y,X+W,Y+H,false)
	draw_set_color(c_white)
	draw_set_halign(2)
	draw_set_valign(1)
	draw_set_font(font0)
//	show_debug_message("fuck")
	draw_text(GameInfo.W,Y+H/2,L[i])
//		draw_text(1920,i*128,"fuck")
}


//if surface_exists(MassageSurface)
draw_surface(MassageSurface,0,0)

//draw_text(1920,1080/2,"fuck")

