extends Node2D

func _ready():
    check_path()
    print($map.get_goal_pos())
    $player.connect("check_path", self, "check_path")

func check_path():
    var actor = $actor
    var path = $map.get_nav_path(actor.get_position())
    
    if path:
        path.remove(0)
        actor.path = path