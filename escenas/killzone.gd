extends Area2D

@onready var timer = $Timer

func _on_body_entered(body):
	# Verificamos si el objeto que entró es el Jugador
	# (Asegúrate de que tu nodo de jugador se llame "Player")
	if body.name == "Player":
		print("¡Has muerto!")
		Engine.time_scale = 0.5
		
		# Opcional: Desactivar el movimiento del jugador para que no siga caminando
		if body.has_method("die"): 
			body.die() 
			
		timer.start()

func _on_timer_timeout():
	Engine.time_scale = 1.0
	get_tree().reload_current_scene()
