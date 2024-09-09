extends CharacterBody2D

@onready var AnimSprite = $AnimatedSprite2D
@onready var Hbox_standing = $Hbox_standing
@onready var Hbox_crouching = $Hbox_crouching
@onready var dash = $Dash 
@onready var Hbox_attacking_R = $hbox/Hbox_attack_right
@onready var Hbox_attacking_L = $hbox/Hbox_attack_left
@onready var attack_timer = $Timer
@onready var combo_timer = $Timer 
@onready var HboxTimer = $hbox/HitboxTimer
@onready var AnimTree : AnimationTree = $AnimationTree
@onready var Sprite : Sprite2D = $Sprite2D
@onready var character_state : CharacterStateMachine = $CharacterStateMachine
@onready var ap : AnimationPlayer = $AnimationPlayer

var is_crouching : bool = false

var direction : Vector2 = Vector2.ZERO


const GRAVITY = 1000
const SPEED = 300

const AIR_SPEED = 250
const DASH_SPEED = 600


enum State { idle, run, jump, duck, slide, attack, end_dash }

var current_state = State.idle

func _ready():
	Hbox_crouching.disabled = true
	Hbox_standing.disabled = false
	AnimTree.active = true
	print("Player script ready!") 

func _physics_process(delta):
	velocity.y += GRAVITY * delta
	# Apply gravity 	
	direction = Input.get_vector("move_left", "move_right" , "jump" , "duck")
	if direction.x != 0 && character_state.check_can_move():
		velocity.x = direction.x * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if(Input.is_action_just_pressed("duck")):
		crouching()
	elif(Input.is_action_just_released("duck")):
		standing()
	facing()
	player_animation()
	move_and_slide() 



func facing():
	if direction.x > 0 :
		Sprite.flip_h = 0
	elif direction.x < 0 :
		Sprite.flip_h = 1
		
		
func crouching():
	if is_crouching:
		return
	is_crouching = true

func standing():
	if is_crouching == false:
		return
	is_crouching = false

func player_animation(): 
	AnimTree.set("parameters/Run/blend_position", direction.x)
