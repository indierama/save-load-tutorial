extends Area2D

@export var texture: Texture2D
@export var points: int
@onready var sprite_2d = $Sprite2D


func _ready():
	sprite_2d.texture = texture


func _on_area_entered(area):
	GameManager.add_score(points)
	queue_free()
