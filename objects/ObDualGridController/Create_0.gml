#macro TILE_SIZE	14
enum tile{
	void,
	water,
	grass,
	dirt,
	stone
}

var _width	= room_width div TILE_SIZE + 1;
var _height = room_height div TILE_SIZE + 1;

Layer			= layer_create(1);
TileLayer	= layer_tilemap_create(Layer, 0, 0, TiBase, _width, _height);

tilemap_clear(TileLayer, tile.water);
layer_set_visible(Layer, false);

Tile		= tile.grass;
TileBase = true;
Debug		= false;

TileBlends = [
	[tile.grass,	tile.grass,		SpGrass],
	[tile.dirt,		tile.dirt,		SpDirt],
	[tile.stone,	tile.stone,		SpStone],
	[tile.water,	tile.water,		SpWater],
	
	[tile.grass,	tile.dirt,		SpDirtOnGrass],
	[tile.grass,	tile.stone,		SpStoneOnGrass],
	[tile.dirt,		tile.stone,		SpStoneOnDirt],
	
	[tile.water,	tile.dirt,		SpDirt],
	[tile.water,	tile.grass,		SpGrass],
	[tile.water,	tile.stone,		SpStone],
];
TBLen = array_length(TileBlends);


TileSurf = -1;

Camera	= view_camera[0];
TSWidth	= camera_get_view_width(Camera);
TSHeight = camera_get_view_height(Camera);
TSUpdate = false;