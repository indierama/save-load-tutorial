extends Node

signal score_changed

var score = 0

func add_score(points):
	score += points
	score_changed.emit()
