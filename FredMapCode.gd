extends CharacterBody2D

const speed = 300
var current_dir = "none"

func _ready():
	$AnimatedSprite2D.play("side")

func _physics_process(delta):
	fred_movement(delta)

func fred_movement(delta):
	
	if Input.is_action_pressed("ui_right"):
		current_dir = "right"
		play_anim(1)
		velocity.x = speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_left"):
		current_dir = "left"
		play_anim(1)
		velocity.x = -speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_down"):
		current_dir = "down"
		play_anim(1)
		velocity.y = speed
		velocity.x = 0
	elif Input.is_action_pressed("ui_up"):
		current_dir = "up"
		play_anim(1)
		velocity.y = -speed
		velocity.x = 0
	else: 
		play_anim(0)
		velocity.x = 0
		velocity.y = 0
		
	move_and_slide()
	
func play_anim(movement):
	var dir = current_dir
	var anim = $AnimatedSprite2D
	
	if dir == "right":
		anim.flip_h = false
		if movement == 1:
			anim.play("side_walk")
		elif movement == 0: 
			anim.play("side")
	
	if dir == "left":
		anim.flip_h = true
		if movement == 1:
			anim.play("side_walk")
		elif movement == 0:
			anim.flip_h = true
			anim.play("side")
	
	if dir == "down":
		anim.flip_v = true
		if movement == 1:
			anim.play("back_walk")
		elif movement == 0: 
			anim.flip_v = false
			anim.play("front")
	
	if dir == "up":
		anim.flip_v = false
		#anim.flip_h = true
		if movement == 1:
			anim.play("back_walk")
		elif movement == 0: 
			anim.play("back")
			
