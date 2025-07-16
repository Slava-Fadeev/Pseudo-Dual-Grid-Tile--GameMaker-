if (TileBase){
	var _mx = (mouse_x - TILE_SIZE / 2) div TILE_SIZE;
	var _my = (mouse_y - TILE_SIZE / 2) div TILE_SIZE;
}else{
	var _mx = mouse_x div TILE_SIZE;
	var _my = mouse_y div TILE_SIZE;
}

if (tilemap_get(TileLayer, _mx, _my) != Tile){
	tilemap_set(TileLayer, tile.water, _mx, _my);
	TSUpdate = true;

	array_push(TSUpdateX, _mx);
	array_push(TSUpdateY, _my);
}