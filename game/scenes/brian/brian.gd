extends KinematicBody2D

var state_machine
export (int) var move_speed = 120
var velocity = Vector2.ZERO
signal love_found


func _ready():
    state_machine = $AnimationTree.get("parameters/playback")
	
# warning-ignore:unused_argument
func _physics_process(delta):
    velocity = move_and_slide(velocity)
	
# warning-ignore:unused_argument
func _process(delta):
    get_input()
	
func get_input():
# warning-ignore:unused_variable
    var current = state_machine.get_current_node()
    velocity = Vector2.ZERO
    if Input.is_action_pressed("ui_down"):
        velocity.y += 1
        state_machine.travel("front")
    if Input.is_action_pressed("ui_right"):
        velocity.x += 1
        state_machine.travel("right")
    if Input.is_action_pressed("ui_up"):
        velocity.y -= 1
        state_machine.travel("back")
    if Input.is_action_pressed("ui_left"):
        velocity.x -= 1
        state_machine.travel("left")

    velocity = velocity.normalized() * move_speed
    if velocity.length() == 0:
       state_machine.travel("idle_front")

# warning-ignore:unused_argument
func _on_Area2D_body_entered(body: PhysicsBody2D) -> void:
    hide()
    emit_signal("love_found")
    queue_free()
    print("My mom always said life was like a box of chocolates. You never know what you're gonna get.")
    transitionMgr.transitionTo("res://scenes/end/end.tscn")
		