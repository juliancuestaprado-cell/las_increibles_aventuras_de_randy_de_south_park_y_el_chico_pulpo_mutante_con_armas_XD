extends Sprite2D

# Variables de caída (de lento a rápido)
@export var velocidad_inicial: float = 20.0      # Empieza muy lento
@export var aceleracion: float = 450.0           # Qué tan rápido gana velocidad al caer
@export var velocidad_maxima: float = 1200.0     # Límite de velocidad

# Rotación opcional en el aire (pon 0.0 si quieres que caiga totalmente recto)
@export var velocidad_giro: float = 1.5          

var velocidad_actual: float = 0.0

func _ready() -> void:
	velocidad_actual = velocidad_inicial

func _process(delta: float) -> void:
	# 1. Aumentar la velocidad progresivamente en cada fotograma
	velocidad_actual = min(velocidad_actual + aceleracion * delta, velocidad_maxima)
	
	# 2. Mover el bolígrafo hacia abajo en línea recta
	position.y += velocidad_actual * delta
	
	# 3. Rotar ligeramente mientras cae
	rotation += velocidad_giro * delta
