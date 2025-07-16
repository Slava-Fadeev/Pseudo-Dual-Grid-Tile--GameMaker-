if (TileBase){
	var _mx = (mouse_x - TILE_SIZE / 2) div TILE_SIZE;
	var _my = (mouse_y - TILE_SIZE / 2) div TILE_SIZE;
}else{
	var _mx = mouse_x div TILE_SIZE;
	var _my = mouse_y div TILE_SIZE;
}

tilemap_set(TileLayer, Tile, _mx, _my);
TSUpdate = true;