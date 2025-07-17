if (TileBase){
	var _cx = camera_get_view_x(Camera);
	var _cy = camera_get_view_y(Camera);
	
	draw_surface(TileSurf, _cx, _cy);
}
	
draw_text(10, 10, $"Tile: {Tile}");