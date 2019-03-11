extends Area2D

export(float) var possession_speed = 3.0

var entered_body = null
var hidden = false

func _ready():
    pass

func _process(delta):
    var vel = Vector2()
    
    if Input.is_action_pressed("player_up"):
        vel.y = -1
    if Input.is_action_pressed("player_down"):
        vel.y = 1
    if Input.is_action_pressed("player_left"):
        vel.x = -1
    if Input.is_action_pressed("player_right"):
        vel.x = 1
    
    if entered_body != null and entered_body.get_ref().controlled:
        entered_body.get_ref().move_and_slide(vel * possession_speed)
        set_global_position(entered_body.get_ref().get_global_position())
    else:
        position += vel
    
    if Input.is_action_just_pressed("action") and entered_body != null:
        toggle_hidden()
        entered_body.get_ref().toggle_control()

func toggle_hidden():
    hidden = not hidden
    if hidden:
        hide()
    else:
        show()

func _on_player_body_entered(obj):
    if obj.is_in_group("movable"):
        entered_body = weakref(obj)
        obj.highlight()


func _on_player_body_exited(obj):
    if entered_body != null and entered_body.get_ref() == obj:
        obj.controlled = false
        obj.unhighlight()
        entered_body = null
