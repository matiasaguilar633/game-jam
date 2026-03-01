extends CanvasLayer

# Variables para el tiempo
var tiempo_transcurrido = 0.0
var cronometro_activo = true

# Referencia al nodo Label (Asegúrate de que se llame 'TiempoLabel' en el árbol de nodos)
var stamina_max = 100.0
var stamina_actual = 100.0
var stamina_recuperacion = 20.0 # Cuánto recupera por segundo
var costo_salto = 15.0         # Cuánto quita saltar
var costo_correr = 30.0

func _process(delta):
	
	if cronometro_activo:
		# delta es el tiempo que pasó desde el último fotograma (aprox 1/60 seg)
		tiempo_transcurrido += delta
		actualizar_interfaz()

func actualizar_interfaz():
	# Calculamos los componentes del tiempo
	var minutos = int(tiempo_transcurrido / 60)
	var segundos = int(tiempo_transcurrido) % 60
	# Obtenemos los decimales y los convertimos en números de 2 dígitos
	var milisegundos = int((tiempo_transcurrido - int(tiempo_transcurrido)) * 100)
	
func reiniciar_timer():
	tiempo_transcurrido = 0.0


func _on_meta_object_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
