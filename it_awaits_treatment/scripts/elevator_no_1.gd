extends AnimatableBody2D

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var interaction_area: InteractionArea = $InteractionArea
@onready var animation_player: AnimationPlayer = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	interaction_area.interact = Callable(self, "_call_elevator")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _call_elevator():
	
	if sprite_2d.frame == 0:
		sprite_2d.frame = 1 
		animation_player.play("move_up")
	else:
		sprite_2d.frame = 0 
		animation_player.play("move_down")
