extends Area2D

@onready var sprite_2d = $Sprite2D
var points = 10

var fruit_sprites = [
	preload("res://assets/sprites/collectibles/apple.png"),
	preload("res://assets/sprites/collectibles/orange.png"),
	preload("res://assets/sprites/collectibles/watermelon.png")
]

func _ready():
	sprite_2d.texture = fruit_sprites.pick_random()


func _on_area_entered(area):
	GameManager.add_score(points)
	queue_free()
