extends Area2D


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"
export var speed: float = 2.0

var target: Vector2
var health: float = 10.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    set_new_target()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
    health -= delta
    if health <= 0:
        queue_free()
    
    var distance_sqr = position.distance_squared_to(target)
    if distance_sqr <= 9:
        if get_parent().eat():
            health += 10.0
        set_new_target()
    
    var move := target - position
    if move.x < 0:
        $AnimatedSprite.flip_h = false
    else:
        $AnimatedSprite.flip_h = true
    
    position = position.linear_interpolate(target, speed * delta)

func set_new_target() -> void:
    target = Vector2(randi() % 800 + 100, randi() % 500 + 50)
