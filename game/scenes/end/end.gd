extends TextureRect

func _ready():
	globals.set("menusBackgroundColor", self.self_modulate)
	self.self_modulate = globals.get("menusBackgroundColor")

func _on_exitBtn_pressed():
	get_tree().quit()
		