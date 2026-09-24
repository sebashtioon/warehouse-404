extends Node3D

var exit_main_term_area_debounce : bool = false

func _on_beeninmainterm_body_exited(body: Node3D) -> void:
	if body.is_in_group(&"player_body"):
		if !exit_main_term_area_debounce:
			exit_main_term_area_debounce = true
			
			$terminal.switch_to_interactive()
			
		


func _on_interactablecomponent_action_triggered() -> void:
	$terminal/Camera3D.make_current()
	$terminal/Camera3D/CanvasLayer.show()
	$terminal/interactablecomponent.hide()
	$terminal/interactablecomponent.process_mode = Node.PROCESS_MODE_DISABLED
	
