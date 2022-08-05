extends KinematicBody2D


var direction = Vector2()
export var speed = 900
var time = 0
var maxtime = 1
var player

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	time += delta
	if time >= maxtime:
		queue_free()
	move_and_slide(direction*speed)


func _on_Area2D_body_entered(body):
	if body.player != player:
		body.kill()
		queue_free()
	pass # Replace with function body.
