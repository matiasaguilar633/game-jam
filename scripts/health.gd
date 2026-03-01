extends Node
# Este script se puede añadir como un nodo hijo a cualquier personaje

signal health_depleted # Se emite cuando la vida llega a 0
signal health_changed(current_health) # Para actualizar barras de vida (UI)

@export var max_health: int = 100
var current_health: int

func _ready():
	current_health = max_health

func take_damage(amount: int):
	current_health -= amount
	health_changed.emit(current_health) # Avisar que la vida cambió
	
	if current_health <= 0:
		current_health = 0
		health_depleted.emit() # Avisar que murió


func _on_detection_area_body_entered(body: Node2D) -> void:
	pass # Replace with function body.


func _on_detection_area_body_exited(body: Node2D) -> void:
	pass # Replace with function body.
