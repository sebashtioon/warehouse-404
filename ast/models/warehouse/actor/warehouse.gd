extends Node3D


func _on_beeninmainterm_body_entered(body: Node3D) -> void:
	pass # Replace with function body.


func _on_beeninmainterm_body_exited(body: Node3D) -> void:
	if body.is_in_group(&"player_body"):
		pass
