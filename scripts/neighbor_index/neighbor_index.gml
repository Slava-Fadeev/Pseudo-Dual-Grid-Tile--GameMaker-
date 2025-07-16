///@func neighbor_index(left, right, bleft, bright, need)
function neighbor_index(_l, _r, _bl, _br, _n){
	return (_l == _n) + ((_r == _n) * 2) + ((_bl == _n) * 4) + ((_br == _n) * 8);
}