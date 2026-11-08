extends RefCounted
## Extract approved concept sprites at load-time; preserve enclosed white shoes.
## Flood-fill only the neutral background connected to the crop border.
var cache: Dictionary = {}

func load_rosters() -> void:
	for team in range(2):
		var source: Image = load("res://assets/home.png" if team == 0 else "res://assets/away.png").get_image()
		source.convert(Image.FORMAT_RGBA8)
		for index in [0,1,2,3,4,6]:
			var crop := source.get_region(Rect2i(158+185*index,510 if team == 0 else 125,185,365))
			_clear_background(crop)
			var bounds := crop.get_used_rect()
			cache[Vector2i(team,index)] = ImageTexture.create_from_image(crop.get_region(bounds))

func _clear_background(img: Image) -> void:
	var w := img.get_width()
	var h := img.get_height()
	var seen := PackedByteArray()
	seen.resize(w*h)
	var queue := PackedInt32Array()
	for x in range(w):
		queue.append(x)
		queue.append((h-1)*w+x)
	for y in range(h):
		queue.append(y*w)
		queue.append(y*w+w-1)
	var head := 0
	while head < queue.size():
		var cell := queue[head]
		head += 1
		if seen[cell] != 0:
			continue
		seen[cell] = 1
		var x := cell%w
		var y := cell/w
		var color := img.get_pixel(x,y)
		if color.r < 0.59 or color.g < 0.56 or color.b < 0.52 or maxf(color.r,maxf(color.g,color.b))-minf(color.r,minf(color.g,color.b)) > 0.19:
			continue
		img.set_pixel(x,y,Color(0,0,0,0))
		if x > 0: queue.append(cell-1)
		if x < w-1: queue.append(cell+1)
		if y > 0: queue.append(cell-w)
		if y < h-1: queue.append(cell+w)
