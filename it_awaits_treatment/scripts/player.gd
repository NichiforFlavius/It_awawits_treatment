extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -400.0

enum State {IDLE, WALKING, JUMPING, ATTACKING, DYING}
var current_state = State.IDLE

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D


func _ready() -> void:
	animated_sprite = $AnimatedSprite2D
	animated_sprite.play("idle")

func update_state_machine():
	match current_state:
		State.IDLE:
			if Input.is_action_pressed("move_left") or Input.is_action_pressed("move_right"):
				change_state(State.WALKING)
			if not is_on_floor():
				change_state(State.JUMPING)
		State.WALKING:
			if Input.is_action_just_released("move_left") or Input.is_action_just_released("move_right"):
				change_state(State.IDLE)
			if not is_on_floor():
				change_state(State.JUMPING)
		State.JUMPING:
			if is_on_floor():
				change_state(State.IDLE)


func change_state(new_state):
	current_state = new_state
	match current_state:
		State.IDLE:
			animated_sprite.play("idle")
		State.WALKING:
			animated_sprite.play("walk")
		State.JUMPING:
			animated_sprite.play("jump")


func _process(delta: float) -> void:
	update_state_machine()
	

func _physics_process(delta: float) -> void:
	
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction := Input.get_axis("move_left", "move_right")
	if direction > 0:
		animated_sprite.flip_h = false
		
	elif direction < 0:
		animated_sprite.flip_h = true
		
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)	
		
	move_and_slide()
