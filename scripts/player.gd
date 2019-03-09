extends KinematicBody2D


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