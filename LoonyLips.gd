extends Node2D

var player_words = [] #player inputs
var current_story = {
		"prompt" : ["a name", "a thing", "a feeling", "another feeling", "some things"],
		"story" : "Once upon a time %s took his %s and accidently smooshed it. They felt %s.  This made him feel very %s but there was still a %s."
		}

func _ready():

	$Blackboard/TextBox.text = ""
	$Blackboard/StoryText.text = ("Welcome to Loony Lips! \n\nLet's have fun creating stories together.\n\nCan I have " + current_story.prompt[player_words.size()] + ", please?")

		
func _on_TextureButton_pressed():
	if is_story_done():
		get_tree().reload_current_scene()
	else:
		var new_text = $Blackboard/TextBox.get_text()
		_on_TextBox_text_entered(new_text)

func _on_TextBox_text_entered(new_text):
	player_words.append(new_text)
	$Blackboard/TextBox.clear()
	check_player_word_length()
	
func is_story_done():
	return player_words.size() == current_story.prompt.size()
	
func prompt_player():
	$Blackboard/StoryText.text = ("Can I have " + current_story.prompt[player_words.size()] + ", please?")

func check_player_word_length():
	if is_story_done():
		tell_story()
	else:
		prompt_player()

func tell_story():
	$Blackboard/StoryText.text = current_story.story % player_words
	$Blackboard/TextureButton/ButtonLabel.text = "Again?"
	end_game()
	
func end_game():
	$Blackboard/TextBox.queue_free()
	


	#get_node("Blackboard/StoryText")