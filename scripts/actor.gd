extends Area2D

onready var color = $ColorRect
export(Color) var controlColor

var controlled = false

func _ready():
    pass

func _process(delta):
    if controlled and color.color != controlColor:
        color.color = controlColor
    elif not controlled:
        color.color = Color(1,1,1)

func toggle_control():
    controlled = not controlled