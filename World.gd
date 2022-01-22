extends Node2D

onready var Rabbit = preload("res://Rabbit.tscn")
# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"

var carrots: int = 10
var timer: float = 2.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    $Carrots.text = str(carrots)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
    if Input.is_action_just_pressed("spawn"):
        var rabbit = Rabbit.instance()
        rabbit.position = Vector2(100, 100)
        add_child(rabbit)
    
    timer -= delta
    if timer <= 0 and carrots > 0:
        timer = 5.0
        var new_carrots = randi() % ((carrots / 2.5) as int + 3)
        carrots += new_carrots
        $Carrots.text = str(carrots)

func eat() -> bool:
    if carrots == 0:
        return false
    
    carrots -= 1
    $Carrots.text = str(carrots)
    return true
