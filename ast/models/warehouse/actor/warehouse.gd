extends Node3D

var current_code : string = ""


var exit_main_term_area_debounce : bool = false

var in_terminal : bool = false

func _on_beeninmainterm_body_exited(body: Node3D) -> void:
	if body.is_in_group(&"player_body"):
		if !exit_main_term_area_debounce:
			exit_main_term_area_debounce = true
			
			$terminal.switch_to_interactive()

func _on_interactablecomponent_action_triggered() -> void:
	if !in_terminal:
		print("boom 2")
		$terminal/Screen/code.show()
		$terminal/Camera3D.make_current()
		$terminal/Camera3D/CanvasLayer.show()
		$terminal/interactablecomponent.hide()
		$terminal/interactablecomponent.process_mode = Node.PROCESS_MODE_DISABLED
		PlayerGlobal.player.crosshair.hide()
		PlayerGlobal.player.process_mode = Node.PROCESS_MODE_DISABLED
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		in_terminal = true

func _input(_event: InputEvent) -> void:
	if in_terminal and Input.is_action_just_pressed("Interact"):
		get_viewport().set_input_as_handled()
		print("boom")
		$terminal/Screen/code.hide()
		PlayerGlobal.player.process_mode = Node.PROCESS_MODE_INHERIT
		PlayerGlobal.player.camera.make_current()
		$terminal/Camera3D/CanvasLayer.hide()
		$terminal/interactablecomponent.show()
		$terminal/interactablecomponent.process_mode = Node.PROCESS_MODE_INHERIT
		PlayerGlobal.player.crosshair.show()
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		in_terminal = false


func _on_button_0_pressed() -> void:
	if in_terminal:
		

func _on_button_1_pressed() -> void:
	pass # Replace with function body.

func _on_button_2_pressed() -> void:
	pass # Replace with function body.

func _on_button_3_pressed() -> void:
	pass # Replace with function body.

func _on_button_4_pressed() -> void:
	pass # Replace with function body.

func _on_button_5_pressed() -> void:
	pass # Replace with function body.

func _on_button_6_pressed() -> void:
	pass # Replace with function body.

func _on_button_7_pressed() -> void:
	pass # Replace with function body.

func _on_button_8_pressed() -> void:
	pass # Replace with function body.

func _on_button_9_pressed() -> void:
	pass # Replace with function body.
