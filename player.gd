extends KinematicBody2D


var speed:Vector2
const MAXSPEED = 50
const ACCELERATION = 1
const ROTATIONSPEED = 0.05
export(int,"player 1","player 2") var player
onready var playerString = "p"+str(player+1)
var dead = false

var bullet = preload("res://bullet.tscn")

func _ready():
	pass


func kill():
	dead = true
	speed = Vector2.ZERO
	$AnimationPlayer.play("kill")

func _physics_process(delta):
	if not dead:
		if Input.is_action_pressed(playerString + "accelerate"):
			speed += transform.basis_xform(Vector2.UP * ACCELERATION)
		if Input.is_action_just_pressed(playerString + "shoot"):
			var bullet_instance = bullet.instance()
			bullet_instance.position=position
			bullet_instance.direction = transform.basis_xform(Vector2.UP)
			bullet_instance.player = player
			get_tree().get_root().add_child(bullet_instance)
		rotate((Input.get_action_strength(playerString + "right")-Input.get_action_strength(playerString + "left"))*ROTATIONSPEED)
		#print(position)
		speed.clamped(MAXSPEED)
		move_and_slide(speed)
