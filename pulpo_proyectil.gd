extends Area2D

const VELOCIDAD = 0
var direccion := 0

func _ready():
	body_entered.connect(_on_body_entered)
	# Voltea el sprite si va a la izquierda
	$Sprite2D.flip_h = direccion < 0
	# Se destruye solo a los 2 segundos
	await get_tree().create_timer(2.0).timeout
	queue_free()

func _physics_process(delta):
	position.x += direccion * VELOCIDAD * delta
	# Opcional: hace girar el cuchillo mientras vuela
	rotation += direccion * 15.0 * delta

func _on_body_entered(body):
	if body is CharacterBody2D:
		return # ignora al jugador
	queue_free() # desaparece al chocar
