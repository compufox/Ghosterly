extends Area2D

var entered_body = null

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
    
    position += vel
    
    if Input.is_action_just_pressed("action") and entered_body != null:
        entered_body.get_ref().toggle_control()

func _on_player_area_entered(obj):
    if obj.is_in_group("movable"):
        entered_body = weakref(obj)


func _on_player_area_exited(obj):
    if entered_body != null and entered_body.get_ref() == obj:
        entered_body.get_ref().controlled = false
        entered_body = null
