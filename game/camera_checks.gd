extends SceneTree

func _initialize() -> void:
	call_deferred("run")

func run() -> void:
	var projection = load("res://presentation/projection.gd").new()
	var state = load("res://match/camera_preview_state.gd").new()
	assert(state.players.size()==12)
	for oblique in [true,false]:
		projection.oblique = oblique
		var world: Vector2 = projection.screen_direction_to_world(Vector2.RIGHT)
		var a: Vector2 = projection.project(Vector3(4.5,9,0))
		var b: Vector2 = projection.project(Vector3(4.5+world.x,9+world.y,0))
		assert(b.x>a.x and abs(b.y-a.y)<=1.0,"Screen-right movement must stay screen-right")
		var corners := [Vector3(0,0,0),Vector3(9,0,0),Vector3(9,18,0),Vector3(0,18,0)]
		for corner in corners:
			var screen: Vector2 = projection.project(corner)
			assert(screen.x>=0 and screen.x<=1280 and screen.y>=65 and screen.y<670)
	state.jump()
	var maximum := 0.0
	for i in range(120):
		state.tick(1.0/60.0,Vector2.ZERO)
		maximum=maxf(maximum,state.players[state.selected]["world"].z)
	assert(maximum>1.0 and maximum<1.5)
	assert(state.players[state.selected]["world"].z==0.0)
	for i in range(3600):
		state.tick(1.0/60.0,Vector2.ZERO)
		assert(state.ball.is_finite() and state.landing.is_finite() and state.ball.z>=0)
	state.paused = true
	var frozen: float = state.clock
	state.tick(1,Vector2.RIGHT)
	assert(state.clock==frozen)
	var scene = load("res://main.tscn").instantiate()
	root.add_child(scene)
	await process_frame
	assert(scene.sprites.cache.size()==12)
	for texture in scene.sprites.cache.values():
		assert(texture.get_width()>50 and texture.get_height()>150)
	var old_world: Vector3 = scene.state.players[4]["world"]
	scene._toggle_camera()
	assert(scene.state.players[4]["world"]==old_world,"Changing camera must not move a player")
	var touch := InputEventScreenTouch.new()
	touch.index = 2
	touch.pressed = true
	touch.position = scene.STICK_CENTER+Vector2(30,0)
	scene._input(touch)
	assert(scene.stick.x>0.4)
	touch.pressed = false
	scene._input(touch)
	assert(scene.stick==Vector2.ZERO)
	print("PASS: 12 players, both camera projections, joystick, jump/landing, pause, 60-second ball simulation and sprite extraction")
	quit()
