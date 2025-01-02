extends Area2D

func _ready() -> void:
	$AnimationPlayer.play("idle_checkpoint")
	

func _on_Checkpoint_body_entered(body: Node2D) -> void:
	Checkpoint.last_position = global_position
	$AnimationPlayer.play("activate_checkpoint") # Replace with function body.
