extends Node

@export var duree_max: float = 100.0
@export var duree_actuelle: float = 70.0
var player = null

func _ready() -> void:
	#récupérer le joueur
	pass
func _process(delta: float) -> void:
	consume_torch(delta)

func consume_torch(delta:float) -> void:
	if duree_actuelle > 0:
		duree_actuelle -= delta
	else:
		duree_actuelle = 0
		print("Torche éteinte !")
		toggle_lumiere(false)

func toggle_lumiere(etat: bool) -> void:
	if player and player.has_node("PointLight2D"):
		player.get_node("PointLight2D").enabled = etat

func recharger(quantite: float):
	duree_actuelle += quantite
	if duree_actuelle > duree_max:
		duree_actuelle = duree_max
	print("Torche rechargée ! Nouvelle durée : ", duree_actuelle)
	
