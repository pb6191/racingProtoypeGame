extends "res://cars/car_base.gd"

func get_input():
	var turn = Input.get_action_strength("move_l")
	turn -= Input.get_action_strength("move_r")
	steer_angle = turn * deg2rad(steering_limit)
	$tmpParent/sedanSports/wheel_frontRight.rotation.y = steer_angle*5
	$tmpParent/sedanSports/wheel_frontLeft.rotation.y = steer_angle*5
	acceleration = Vector3.ZERO
	if Input.is_action_pressed("move_fw"):
		acceleration = -transform.basis.z * engine_power
	if Input.is_action_pressed("move_bw"):
		acceleration = -transform.basis.z * braking
