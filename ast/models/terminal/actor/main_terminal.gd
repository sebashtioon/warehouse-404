extends Node3D

func switch_to_interactive() -> void:
	print("BOOM")
	$interactablecomponent.process_mode = Node.PROCESS_MODE_INHERIT
	$screen.hide()
	
