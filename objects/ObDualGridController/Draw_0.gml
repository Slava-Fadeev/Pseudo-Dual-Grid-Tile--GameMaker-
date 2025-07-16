if (TileBase){
	if (!surface_exists(TileSurf)){
		TileSurf = surface_create(TSWidth, TSHeight);
		TSUpdate = true;
	}
	
	if (TSUpdate){
		surface_set_target(TileSurf);
		
		draw_clear_alpha(c_white, 0);
		
		var _off = 12;
		var _tile, _x, _y, _l, _r, _bl, _br, _cb, _spr;
	
		var _it = TSWidth		div TILE_SIZE - 1;
		var _jt = TSHeight	div TILE_SIZE - 1;
	
		var i = 1;
		var j = 1;
		var k = 0;
		
		for(i = 1; i < _it; i++){
			for(j = 1; j < _jt; j++){
				_tile	= tilemap_get(TileLayer, i, j);
				if (_tile == tile.void) continue;
		
				_x = (i * TILE_SIZE);
				_y = (j * TILE_SIZE);
			
				_l		= tilemap_get_at_pixel(TileLayer, _x - _off, _y - _off);
				_r		= tilemap_get_at_pixel(TileLayer, _x + _off, _y - _off);
				_bl	= tilemap_get_at_pixel(TileLayer, _x - _off, _y + _off);
				_br	= tilemap_get_at_pixel(TileLayer, _x + _off, _y + _off);
				k		= 0;
				
				repeat(TBLen){
					_cb = TileBlends[k];
					if (_cb[0] == _l || _cb[0] == _r || _cb[0] == _bl || _cb[0] == _br){
						_spr = neighbor_index(_l, _r, _bl, _br, _cb[1]);
					
						draw_sprite(_cb[2], _spr, _x, _y);
					}
					k++;
				}
			}
		}
	
		surface_reset_target();
		TSUpdate = false;
	}
	
	var _cx = camera_get_view_x(Camera);
	var _cy = camera_get_view_y(Camera);
	
	draw_surface(TileSurf, _cx, _cy);
}
	
draw_text(10, 10, $"Tile: {Tile}");