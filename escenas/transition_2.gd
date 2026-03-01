extends Area2D

const NEXT_SCENE := "res://escenas/level3.tscn"


func _on_area_entered(area: Area2D) -> void:
	if area.name == "Hurtbox":
		print("ENTRÓ EN TRANSICIÓN")
		get_tree().change_scene_to_file(NEXT_SCENE)
		print("Hurtbox", area)
