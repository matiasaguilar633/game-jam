extends CharacterBody2D

const SPEED := 160.0
const JUMP_VELOCITY := -300.0
const GRAVITY := 1000.0

const ATTACK_TIME := 0.25

var is_attacking := false
var attack_timer := 0.0
var attack_timeout := 0.15

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# Gravedad
	if not is_on_floor():
		velocity.y += GRAVITY * delta

	# Movimiento horizontal (A / D -> move_left / move_right)
	var direction := Input.get_action_strength("right") - Input.get_action_strength("left")
	velocity.x = direction * SPEED

	# Flip del sprite según la dirección
	if direction < 0:
		animated_sprite.flip_h = false
	elif direction > 0:
		animated_sprite.flip_h = true

	# Saltar con W / Space (ambas mapeadas a la acción "jump")
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y = JUMP_VELOCITY

	# Ataque con C (acción "attack")
	if not is_attacking and Input.is_action_just_pressed("attack"):
		_start_attack()

	# Actualizar ataque si está en curso
	if is_attacking:
		attack_timer -= delta
		if attack_timer <= 0.0:
			is_attacking = false

	# Animaciones
	_update_animation()

	# Aplicar movimiento
	move_and_slide()


func _start_attack() -> void:
	is_attacking = true
	attack_timer = ATTACK_TIME
	animated_sprite.play("attack")
	await get_tree().create_timer(attack_timeout).timeout


func _update_animation() -> void:
	if is_attacking:
		# Deja que la animación de ataque corra completa
		return

	if not is_on_floor():
		animated_sprite.play("jump")
	elif abs(velocity.x) > 10.0:
		animated_sprite.play("run")
	else:
		animated_sprite.play("idle")
