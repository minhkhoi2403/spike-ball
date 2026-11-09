extends Node2D

const CourtProjection = preload("res://presentation/projection.gd")
const PreviewState = preload("res://match/camera_preview_state.gd")
const RosterTextures = preload("res://presentation/roster_textures.gd")
var camera = CourtProjection.new()
var state = PreviewState.new()
var sprites = RosterTextures.new()
var stick := Vector2.ZERO
var stick_finger := -1
var mouse_stick := false
var camera_button: Button
var pause_button: Button
var capture_frames := 0
const STICK_CENTER := Vector2(95,615)
const STICK_RADIUS := 54.0

func _ready() -> void:
	texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
	sprites.load_rosters()
	_make_ui()
	if "--capture" in OS.get_cmdline_user_args():
		capture_frames = 6

func _make_ui() -> void:
	var layer := CanvasLayer.new()
	add_child(layer)
	var title := Label.new()
	title.text = "SPIKE BALL   /   KHÁNH HẢI  —  THANH CẢNG"
	title.position = Vector2(28,14)
	title.add_theme_color_override("font_color",Color("112f39"))
	title.add_theme_font_size_override("font_size",20)
	layer.add_child(title)
	var help := Label.new()
	help.text = "Mũi tên / kéo vòng trái: di chuyển    Space / Nhảy: bật nhảy    C: đổi góc    P: dừng bóng"
	help.position = Vector2(250,681)
	help.add_theme_font_size_override("font_size",16)
	help.add_theme_color_override("font_color",Color("103d44"))
	layer.add_child(help)
	var note := Label.new()
	note.text = "THỬ GÓC NHÌN  ·  Bóng chạy minh họa, chưa tính điểm"
	note.position = Vector2(28,43)
	note.add_theme_font_size_override("font_size",14)
	note.add_theme_color_override("font_color",Color("1c5057"))
	layer.add_child(note)
	camera_button = _button(layer,"Góc chéo",Vector2(1000,15),Vector2(135,40))
	camera_button.pressed.connect(_toggle_camera)
	pause_button = _button(layer,"Tạm dừng",Vector2(1144,15),Vector2(115,40))
	pause_button.pressed.connect(_toggle_pause)
	var jump_button := _button(layer,"NHẢY",Vector2(1140,595),Vector2(110,65))
	jump_button.pressed.connect(state.jump)

func _button(parent: Node,text: String,where: Vector2,dimensions: Vector2) -> Button:
	var button := Button.new()
	button.text = text
	button.position = where
	button.size = dimensions
	button.focus_mode = Control.FOCUS_NONE
	parent.add_child(button)
	return button

func _toggle_camera() -> void:
	camera.oblique = not camera.oblique
	camera_button.text = "Góc chéo" if camera.oblique else "Góc thẳng"

func _toggle_pause() -> void:
	state.paused = not state.paused
	pause_button.text = "Tiếp tục" if state.paused else "Tạm dừng"

func _notification(what: int) -> void:
	if what == NOTIFICATION_APPLICATION_FOCUS_OUT:
		stick = Vector2.ZERO
		stick_finger = -1
		mouse_stick = false
		if is_instance_valid(pause_button):
			state.paused = true
			pause_button.text = "Tiếp tục"

func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed and not event.echo:
		if event.keycode == KEY_SPACE: state.jump()
		if event.keycode == KEY_C: _toggle_camera()
		if event.keycode == KEY_P: _toggle_pause()
	if event is InputEventScreenTouch:
		if event.pressed and event.position.distance_to(STICK_CENTER)<90:
			stick_finger = event.index
			stick = (event.position-STICK_CENTER).limit_length(STICK_RADIUS)/STICK_RADIUS
		elif not event.pressed and event.index == stick_finger:
			stick_finger = -1
			stick = Vector2.ZERO
	if event is InputEventScreenDrag and event.index == stick_finger:
		stick = (event.position-STICK_CENTER).limit_length(STICK_RADIUS)/STICK_RADIUS
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed and event.position.distance_to(STICK_CENTER)<90:
			mouse_stick = true
			stick = (event.position-STICK_CENTER).limit_length(STICK_RADIUS)/STICK_RADIUS
		elif not event.pressed and mouse_stick:
			mouse_stick = false
			stick = Vector2.ZERO
	if event is InputEventMouseMotion and mouse_stick:
		stick = (event.position-STICK_CENTER).limit_length(STICK_RADIUS)/STICK_RADIUS

func _physics_process(delta: float) -> void:
	var movement := Vector2(float(Input.is_physical_key_pressed(KEY_RIGHT))-float(Input.is_physical_key_pressed(KEY_LEFT)),float(Input.is_physical_key_pressed(KEY_DOWN))-float(Input.is_physical_key_pressed(KEY_UP)))
	if movement.length()<0.01: movement = stick
	var world_movement: Vector2 = camera.screen_direction_to_world(movement)*minf(1.0,movement.length()) if movement.length()>0.1 else Vector2.ZERO
	state.tick(delta,world_movement)
	queue_redraw()
	if capture_frames > 0:
		capture_frames -= 1
		if capture_frames == 0:
			_capture.call_deferred()

func _capture() -> void:
	await RenderingServer.frame_post_draw
	get_viewport().get_texture().get_image().save_png(ProjectSettings.globalize_path("res://camera-preview.png"))
	get_tree().quit()

func point(x: float,y: float,z: float=0) -> Vector2:
	return camera.project(Vector3(x,y,z))

func _line(a: Vector3,b: Vector3,color: Color,width: float=3.0) -> void:
	draw_line(camera.project(a),camera.project(b),color,width,false)

func _ellipse(center: Vector2,radius: Vector2,color: Color,filled: bool=true) -> void:
	var shape := PackedVector2Array()
	for i in range(33):
		var angle := TAU*i/32.0
		shape.append((center+Vector2(cos(angle)*radius.x,sin(angle)*radius.y)).round())
	if filled: draw_colored_polygon(shape,color)
	else: draw_polyline(shape,color,3.0,false)

func _draw() -> void:
	draw_rect(Rect2(0,0,1280,720),Color("40bfae"))
	var corners := PackedVector2Array([point(0,0),point(9,0),point(9,18),point(0,18)])
	draw_colored_polygon(corners,Color("ecaa83"))
	var border := corners.duplicate()
	border.append(corners[0])
	draw_polyline(border,Color("fff5e5"),5.0,false)
	for y in [6.0,9.0,12.0]:
		_line(Vector3(0,y,0),Vector3(9,y,0),Color("fff5e5"),4.0)
	for p in state.players:
		var w: Vector3 = p["world"]
		_ellipse(point(w.x,w.y),Vector2(17,5),Color(0.23,0.16,0.12,0.25))
	var selected: Vector3 = state.players[state.selected]["world"]
	_ellipse(point(selected.x,selected.y),Vector2(25,9),Color("beff6c"),false)
	# Landing prediction is independent from the current ground shadow.
	var ring: Vector2 = camera.project(state.landing)
	for i in range(12):
		var a := TAU*i/12.0
		var b := a+0.30
		draw_line(ring+Vector2(cos(a)*21,sin(a)*7),ring+Vector2(cos(b)*21,sin(b)*7),Color("fff388"),3.0)
	_ellipse(point(state.ball.x,state.ball.y),Vector2(8,3),Color(0.2,0.13,0.1,0.35))
	var layers: Array[Dictionary] = []
	for i in range(state.players.size()):
		var w: Vector3 = state.players[i]["world"]
		layers.append({"depth":point(w.x,w.y).y,"kind":0,"index":i})
	# Split the diagonal net into depth-sorted strips rather than one flat overlay.
	for i in range(30):
		layers.append({"depth":point((i+0.5)*0.3,9).y,"kind":1,"index":i})
	for x in [-0.25,9.25]:
		layers.append({"depth":point(x,9).y,"kind":2,"x":x})
	layers.sort_custom(func(a,b):return float(a["depth"])<float(b["depth"]))
	for item in layers:
		match item["kind"]:
			0: _draw_player(state.players[item["index"]])
			1: _draw_net_strip(item["index"])
			2: _draw_post(item["x"])
	_draw_ball()
	_ellipse(STICK_CENTER,Vector2(54,54),Color(0.05,0.18,0.22,0.22))
	_ellipse(STICK_CENTER,Vector2(54,54),Color(0.9,1.0,0.95,0.5),false)
	_ellipse(STICK_CENTER+stick*STICK_RADIUS,Vector2(20,20),Color(0.92,1.0,0.97,0.75))

func _draw_player(p: Dictionary) -> void:
	var tex: Texture2D = sprites.cache[Vector2i(p["team"],p["art"])]
	var w: Vector3 = p["world"]
	var feet: Vector2 = camera.project(w)
	var height := 69.0 if int(p["art"]) != 6 else 64.0
	var dimensions := Vector2(tex.get_width()*height/tex.get_height(),height).round()
	if p["moving"] and w.z<0.01:
		feet.y -= round(abs(sin(state.clock*12.0))*2.0)
	var rect := Rect2((feet-Vector2(dimensions.x/2,dimensions.y)).round(),dimensions)
	# Highlight a far-side sprite intersecting the net band without hiding its identity.
	var net_base := point(w.x,9).y
	if w.y<9 and feet.y>net_base-75:
		for offset in [Vector2(-1,0),Vector2(1,0),Vector2(0,-1)]:
			draw_texture_rect(tex,Rect2(rect.position+offset,rect.size),false,Color(1.5,1.5,1.1,0.65))
	draw_texture_rect(tex,rect,false)

func _draw_net_strip(index: int) -> void:
	var x := float(index)*0.3
	var end := x+0.3
	var height := PreviewState.NET_HEIGHT
	var area := PackedVector2Array([point(x,9,0.35),point(end,9,0.35),point(end,9,height),point(x,9,height)])
	draw_colored_polygon(area,Color(0.1,0.21,0.32,0.08))
	for row in range(8):
		var z := 0.35+row*(height-0.35)/7.0
		_line(Vector3(x,9,z),Vector3(end,9,z),Color("24465c"),1.0)
	_line(Vector3(x,9,0.35),Vector3(x,9,height),Color("24465c"),1.0)
	_line(Vector3(x,9,height),Vector3(end,9,height),Color("fff7df"),4.0)

func _draw_post(x: float) -> void:
	var base := point(x,9)
	var top := point(x,9,2.7)
	draw_line(base,top,Color("15243b"),15)
	draw_line(base+Vector2(2,-3),top+Vector2(2,3),Color("40577f"),8)
	var antenna_x := clampf(x,0,9)
	for i in range(8):
		_line(Vector3(antenna_x,9,2.43+i*0.1),Vector3(antenna_x,9,2.53+i*0.1),Color("ef5050") if i%2==0 else Color.WHITE,3)

func _draw_ball() -> void:
	var pos: Vector2 = camera.project(state.ball)
	draw_circle(pos,9,Color("152740"))
	draw_circle(pos,7,Color("f8d83f"))
	draw_arc(pos,5,state.clock*3.0,state.clock*3.0+PI,8,Color("245ac0"),4,false)
	draw_line(pos+Vector2(-5,3),pos+Vector2(5,-3),Color("245ac0"),3,false)
