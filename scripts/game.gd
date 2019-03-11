extends Node2D

onready var character = $actor

func _ready():
    character.set_nav($map)