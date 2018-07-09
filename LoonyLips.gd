extends Node2D

var player_words = [] #player inputs
var prompt = ["a name", "a thing", "a feeling", "another feeling", "some things"]
var story = "Once upon a time %s took his %s and accidently smooshed it. They felt %s.  This made him feel very %s but there was still a %s."

func _ready():
	print (story % prompt)
	$Blackboard/StoryText.text = story % prompt
	#get_node("Blackboard/StoryText")
	$Blackboard/TextBox.text = ""
		
func _on_TextureButton_pressed():
	var new_text = $Blackboard/TextBox.get_text()
	_on_TextBox_text_entered(new_text)

func _on_TextBox_text_entered(new_text):
	player_words.append(new_text)
	$Blackboard/TextBox.clear()
	print(player_words)

