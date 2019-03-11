extends Node2D

var speed = 150
var nav setget set_nav
var nav_path = []
export(NodePath) var goal_node 

func set_nav(new_nav):
    nav = new_nav
    update_path()

func update_path():
    nav_path = nav.get_simple_path(get_position(),
                                   get_node(goal_node).get_position(),
                                   false)

func _physics_process(delta):
    if nav_path.size() > 1:
        var d = get_position().distance_to(nav_path[0])
        
        if d > 2:
            set_position(get_position().linear_interpolate(nav_path[0],
                                                           (speed * delta)/d))
        else:
            nav_path.remove(0)
    else:
        pass
        # this means we've reached our point