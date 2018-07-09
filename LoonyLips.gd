extends Node2D

func _ready():
	var prompt = ["James", "car", "hat", "sad"]
	var story = "Once upon a time %s took his %s and accidently smooshed a %s.  This made him feel very %s."
	print (story % prompt)
	$Blackboard/StoryText.text = story % prompt
	#get_node("Blackboard/StoryText")
		
func _on_TextureButton_pressed():
	var new_text = $Blackboard/TextBox.get_text()
	_on_TextBox_text_entered(new_text)

func _on_TextBox_text_entered(new_text):
	$Blackboard/StoryText.text = new_text
	$Blackboard/TextBox.clear()


