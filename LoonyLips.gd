extends Node2D

func _ready():
	var prompt = ["James", "car", "hat", "sad"]
	var story = "Once upon a time %s took his %s and accidently smooshed a %s.  This made him feel very %s."
	print (story % prompt)
