extends Area2D

onready var color = $ColorRect
export(Color) var controlColor

var controlled = false

func _ready():
    pass

func _process(delta):
    if controlled and color.color != controlColor:
        