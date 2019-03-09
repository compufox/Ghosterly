extends KinematicBody2D

onready var color = $ColorRect
export(Color) var controlColor

var highlighted = false
var controlled  = false

func _process(delta):
    if controlled and color.color != controlColor:
        color.color = controlColor
    elif not controlled and not highlighted:
        color.color = Color.white

func toggle_control():
    controlled = not controlled

func highlight():
    color.color = Color.yellow
    highlighted = true

func unhighlight():
    color.color = Color.white
    highlighted = false