extends Node2D

# warning-ignore:unused_class_variable
export (PackedScene) var brian
# warning-ignore:unused_class_variable
export (PackedScene) var love

signal love_was_found

func on_love_found():
    emit_signal("love_was_found")
		