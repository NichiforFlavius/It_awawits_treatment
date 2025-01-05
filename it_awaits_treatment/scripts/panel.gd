extends StaticBody2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var sprite_2d: Sprite2D = $Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	interaction_area.interact = Callable(self, "_toggle_panel")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _toggle_panel():
	sprite_2d.frame = 1 if sprite_2d.frame == 0 else 0
