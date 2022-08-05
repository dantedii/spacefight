extends Area2D

export var PADDING = 70
onready var collisionShape = $CollisionShape2D.shape
var windowsize = OS.window_size


# Called when the node enters the scene tree for the first time.
func _ready():
	collisionShape.set_extents(Vector2(windowsize.x/2+PADDING,windowsize.y/2+PADDING))
	$CollisionShape2D.position.x =  windowsize.x/2
	$CollisionShape2D.position.y =  windowsize.y/2
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_exited(body):
	if body.position.x < windowsize.x/2 - collisionShape.get_extents().x:
		body.position.x += collisionShape.get_extents().x*2
	elif body.position.x > collisionShape.get_extents().x*2-PADDING:
		body.position.x -= collisionShape.get_extents().x*2
	if body.position.y < windowsize.y/2 - collisionShape.get_extents().y:
		body.position.y += collisionShape.get_extents().y*2
	elif body.position.y > collisionShape.get_extents().y*2-PADDING:
		body.position.y -= collisionShape.get_extents().y*2
#	if body == 
