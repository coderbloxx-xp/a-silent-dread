extends KinematicBody

export var speed = 8.0
var player

func _ready():
	player = get_node("../Player") # adjust path

func _physics_process(delta):
	if player:
		var is_moving = player.vel.length() > 0.1
		var is_sneaking = Input.is_action_pressed("sneak")

		if is_moving and not is_sneaking:
			chase_player(delta)
func chase_player(delta):
	var direction = (player.global_transform.origin - global_transform.origin).normalized()
	var velocity = direction * speed
	move_and_slide(velocity)
