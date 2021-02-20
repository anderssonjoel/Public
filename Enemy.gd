extends KinematicBody

enum {IDLE, ALERT, AGRESSIVE}

var state = IDLE

var viewcollision = true
var bodies_seen = [null]
var target = null
var target_group = null

var orientation = Transform()


onready var space_state = get_world().direct_space_state
onready var ray = $RayCast
onready var viewcone = $Area


func _ready():
	orientation = global_transform
	orientation.origin = Vector3()
	add_to_group("Enemy")
	print("I´m ", self)

func _physics_process(delta):
	space_state = get_world().direct_space_state
	
	bodies_seen = viewcone.get_overlapping_bodies()
	for body in bodies_seen:
		if body is preload("res://characters/Player.gd"):
			ray.look_at(body.global_transform.origin, Vector3(0, 1, 0))
			target = ray.get_collider()
			target_group = ray.get_groups()
			print(target_group)
			
			DrawLine3d.DrawLine(self.global_transform.origin, body.global_transform.origin + Vector3.UP, Color(0, 1, 1), 2)
			



#func move_to_target(delta):
	#var direction = (last_location.transform.origin)
	#move_and_slide(direction * speed * delta, Vector3.UP)

	#match state:
		#IDLE:
			#print("Idle")
		#ALERT:
			#print("ALERT")
		#AGRESSIVE:
			 #print("Agressive")



