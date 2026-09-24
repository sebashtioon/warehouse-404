extends Node3D

var current_code : String = ""

@export var code: Label3D

var exit_main_term_area_debounce : bool = false
var in_terminal : bool = false
var can_interact_in_terminal : bool = true

func _ready() -> void:
	$fade/fade.modulate.a = 1.0
	var tween = get_tree().create_tween()
	tween.tween_interval(1.0)
	tween.tween_property($fade/fade, "modulate:a", 0.0, 2.0).from(1.0)

func _process(_delta: float) -> void:
	code.text = current_code

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
	if in_terminal and can_interact_in_terminal and Input.is_action_just_pressed("Interact"):
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
		$buttonclick.play()
		var first_code = current_code
		if first_code.length() == 4:
			return
		
		current_code = current_code + "0"

func _on_button_1_pressed() -> void:
	if in_terminal:
		$buttonclick.play()
		var first_code = current_code
		if first_code.length() == 4:
			return
		
		current_code = current_code + "1"

func _on_button_2_pressed() -> void:
	if in_terminal:
		$buttonclick.play()
		var first_code = current_code
		if first_code.length() == 4:
			return
		
		current_code = current_code + "2"

func _on_button_3_pressed() -> void:
	if in_terminal:
		$buttonclick.play()
		var first_code = current_code
		if first_code.length() == 4:
			return
		
		current_code = current_code + "3"

func _on_button_4_pressed() -> void:
	if in_terminal:
		$buttonclick.play()
		var first_code = current_code
		if first_code.length() == 4:
			return
		
		current_code = current_code + "4"

func _on_button_5_pressed() -> void:
	if in_terminal:
		$buttonclick.play()
		var first_code = current_code
		if first_code.length() == 4:
			return
		
		current_code = current_code + "5"

func _on_button_6_pressed() -> void:
	if in_terminal:
		$buttonclick.play()
		var first_code = current_code
		if first_code.length() == 4:
			return
		
		current_code = current_code + "6"

func _on_button_7_pressed() -> void:
	if in_terminal:
		$buttonclick.play()
		var first_code = current_code
		if first_code.length() == 4:
			return
		
		current_code = current_code + "7"

func _on_button_8_pressed() -> void:
	if in_terminal:
		$buttonclick.play()
		var first_code = current_code
		if first_code.length() == 4:
			return
		
		current_code = current_code + "8"

func _on_button_9_pressed() -> void:
	if in_terminal:
		$buttonclick.play()
		var first_code = current_code
		if first_code.length() == 4:
			return
		
		current_code = current_code + "9"

func _on_button_del_pressed() -> void:
	$buttonclick.play()
	current_code = current_code.left(-1)

func _on_button_ent_pressed() -> void:
	if current_code == "7089":
		$correct.play()
		var tween = get_tree().create_tween()
		tween.tween_property($terminal/thumbup, "modulate:a", 0.0, 1.5).from(1.0)
		tween.tween_interval(0.5)
		tween.tween_property($fade/fade, "modulate:a", 1.0, 2.0)
		tween.tween_interval(0.5)
		tween.tween_callback(end)
		
		can_interact_in_terminal = false
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	else:
		$incorrect.play()

func end() -> void:
	get_tree().change_scene_to_file("res://src/endscreen/endscreen.tscn")


func _on_maintermenable_timeout() -> void:
	$terminal.switch_to_interactive()
