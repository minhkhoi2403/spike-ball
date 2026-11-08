extends RefCounted
## World metres -> screen pixels. No perspective scaling of sprites.
var oblique := true

func project(world: Vector3) -> Vector2:
	var x := world.x - 4.5
	var y := world.y - 9.0
	if oblique:
		return Vector2(640.0 + 60.0*x + 27.0*y, 356.0 - 14.0*x + 24.0*y - 32.0*world.z).round()
	return Vector2(640.0 + 85.0*x, 354.0 + 28.0*y - 32.0*world.z).round()

func screen_direction_to_world(direction: Vector2) -> Vector2:
	if not oblique:
		return Vector2(direction.x/85.0, direction.y/28.0).normalized()
	# Inverse of the ground-plane projection, so joystick follows the screen.
	return Vector2(24.0*direction.x-27.0*direction.y, 14.0*direction.x+60.0*direction.y).normalized()
