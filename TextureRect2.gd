extends TextureRect

var MouseOver = false

func _input(event):
	if event is InputEventMouseButton:
		if MouseOver == true:
			get_tree().change_scene("res://Level1.tscn")
		if MouseOver == false:
			print("Didnot click")


func _on_TextureRect2_mouse_entered():
	 MouseOver = true

func _on_TextureRect2_mouse_exited():
	MouseOver = false
