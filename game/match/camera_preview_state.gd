extends RefCounted
## Camera test data only. This is not the match AI/rules port.
var players: Array[Dictionary] = []
var clock := 0.0
var paused := false
var ball := Vector3(4.5, 13.0, 2.0)
var landing := Vector3(4.5, 13.0, 0.0)
var selected := 4
const GRAVITY := 9.8
const NET_HEIGHT := 2.43

func _init() -> void:
	var slots := [Vector2(1.6,10.8),Vector2(4.4,10.8),Vector2(7.4,10.8),Vector2(1.6,15.1),Vector2(4.5,15.7),Vector2(7.5,15.2)]
	var art := [0,3,4,2,1,6]
	for team in range(2):
		for i in range(6):
			var ground: Vector2 = slots[i]
			if team == 1:
				ground = Vector2(9.0-ground.x,18.0-ground.y)
			players.append({"world":Vector3(ground.x,ground.y,0),"team":team,"art":art[i],"vz":0.0,"moving":false})

func jump() -> void:
	if float(players[selected]["world"].z) <= 0.001:
		players[selected]["vz"] = 4.9

func tick(delta: float, movement: Vector2) -> void:
	if paused:
		return
	clock += delta
	for i in range(players.size()):
		var p: Dictionary = players[i]
		var w: Vector3 = p["world"]
		p["moving"] = i == selected and movement.length() > 0.01
		if i == selected:
			w.x = clampf(w.x+movement.x*4.3*delta,-1.2,10.2)
			w.y = clampf(w.y+movement.y*4.3*delta,9.25,19.0)
		if w.z > 0.0 or float(p["vz"]) > 0.0:
			w.z = maxf(0.0,w.z+float(p["vz"])*delta-0.5*GRAVITY*delta*delta)
			p["vz"] = float(p["vz"])-GRAVITY*delta if w.z > 0 else 0.0
		p["world"] = w
	# Repeatable ball trajectory to compare the two cameras on identical state.
	var points := [Vector3(4.5,14.0,0.8),Vector3(4.3,10.5,1.8),Vector3(1.5,10.7,2.9),Vector3(5.0,3.5,0.8),Vector3(4.6,7.4,1.8),Vector3(7.3,7.3,2.9)]
	var durations := [1.3,0.85,1.4,1.3,0.85,1.7]
	var local := fmod(clock,7.4)
	var segment := 0
	while segment < 5 and local >= float(durations[segment]):
		local -= float(durations[segment])
		segment += 1
	var duration: float = durations[segment]
	var start: Vector3 = points[segment]
	var target: Vector3 = points[(segment+1)%points.size()]
	var velocity := (target-start)/duration
	velocity.z += GRAVITY*duration/2.0
	ball = start+velocity*local-Vector3(0,0,0.5*GRAVITY*local*local)
	var vz := velocity.z-GRAVITY*local
	var remaining := (vz+sqrt(vz*vz+2.0*GRAVITY*ball.z))/GRAVITY
	landing = Vector3(ball.x+velocity.x*remaining,ball.y+velocity.y*remaining,0.0)
