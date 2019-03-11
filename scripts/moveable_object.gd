extends KinematicBody2D

onready var highlight_node = $highlight
onready var color = $ColorRect
export(Color) var controlColor
export(Color) var normalColor

var controlled  = false

func _process(delta):
    # this won't be needed when i start using sprites
    if controlled and color.color != controlColor:
        color.color = controlColor
    elif not controlled and color.color != normalColor:
        color.color = normalColor

func toggle_control():
    controlled = not controlled

func highlight():
    highlight_node.show()

func unhighlight():
    highlight_node.hide()