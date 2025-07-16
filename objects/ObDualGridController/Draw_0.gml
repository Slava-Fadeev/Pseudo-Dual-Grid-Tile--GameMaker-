if (TileBase){
	if (!surface_exists(TileSurf)){
		TileSurf = surface_create(TSWidth, TSHeight);
		TSUpdate = true;
	}
	
	if (TSUpdate){
		var _change_len = array_length(TSUpdateX);
		
		surface_set_target(TileSurf);
		
		var _off = 12;
		var _tile, _x, _y, _l, _r, _bl, _br, _cb, _spr;
	
		var _it = TSWidth		div TILE_SIZE - 1;
		var _jt = TSHeight	div TILE_SIZE - 1;
	
		var i = 1;
		var j = 1;
		var k = 0;
		
		if (_change_len == 0){
			draw_clear_alpha(c_white, 0);
			
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
		}
		
		var m = 0;
		if (_change_len > 0){
			var _x_rep;
			var _y_rep;
			
			for(i = 0; i < _change_len; i++){
				_x_rep = TSUpdateX[i];
				_y_rep = TSUpdateY[i];
				
				for(j = _x_rep - 1; j < _x_rep + 2; j++){
					for(k = _y_rep - 1; k < _y_rep + 2; k++){
						_tile	= tilemap_get(TileLayer, j, k);
						if (_tile == tile.void) continue;
						
						_x = (j * TILE_SIZE);
						_y = (k * TILE_SIZE);
						
						_l		= tilemap_get_at_pixel(TileLayer, _x - _off, _y - _off);
						_r		= tilemap_get_at_pixel(TileLayer, _x + _off, _y - _off);
						_bl	= tilemap_get_at_pixel(TileLayer, _x - _off, _y + _off);
						_br	= tilemap_get_at_pixel(TileLayer, _x + _off, _y + _off);
						m		= 0;
						
						repeat(TBLen){
							_cb = TileBlends[m];
							if (_cb[0] == _l || _cb[0] == _r || _cb[0] == _bl || _cb[0] == _br){
								_spr = neighbor_index(_l, _r, _bl, _br, _cb[1]);
							
								draw_sprite(_cb[2], _spr, _x, _y);
							}
							m++;
						}
					}
				}
			}
			
			TSUpdateX = [];
			TSUpdateY = [];
		}
		
		surface_reset_target();
		TSUpdate = false;
	}
	
	var _cx = camera_get_view_x(Camera);
	var _cy = camera_get_view_y(Camera);
	
	draw_surface(TileSurf, _cx, _cy);
}
	
draw_text(10, 10, $"Tile: {Tile}");