extends Area2D

@onready var checkpoint_sfx: AudioStreamPlayer = $checkpoint_sfx

func _ready() -> void:
	$AnimationPlayer.play("idle_checkpoint")
	

func _on_Checkpoint_body_entered(body: Node2D) -> void:
	if Checkpoint.last_position != global_position:
		checkpoint_sfx.play()
		
	Checkpoint.last_position = global_position
	$AnimationPlayer.play("activate_checkpoint")
	
	
