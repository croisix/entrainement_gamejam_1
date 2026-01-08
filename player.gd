extends CharacterBody2D

const SPEED = 300.0        # Vitesse de marche
const JUMP_VELOCITY = -400.0 # Force du saut (négatif car en 2D, haut = moins)

# Récupère la gravité depuis les paramètres du projet
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	# 1. Appliquer la gravité si on n'est pas au sol
	if not is_on_floor():
		velocity.y += gravity * delta

	# 2. Gérer le saut (Bouton "ui_accept" = Espace par défaut)
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# 3. Gérer la direction (Gauche/Droite)
	# "ui_left" et "ui_right" sont les flèches du clavier par défaut
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		# Si on ne touche rien, on s'arrête progressivement
		velocity.x = move_toward(velocity.x, 0, SPEED)

	# 4. Appliquer le mouvement
	move_and_slide()
