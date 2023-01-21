extends Modchart
@onready var pendelum = $PendelumPhase2
var beat_interval:float = 1.5
var dumbass_timer:float = 0.0
var fuck_ups:int = 0
var can_hit:bool = true
var misses:int = 0
@onready var copies = $copies
#sword please no kill me UwU
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var converted_time:float = ((Conductor.position) / (Conductor.crochet * beat_interval)) * PI
	dumbass_timer += delta
	if dumbass_timer >= ((Conductor.crochet / 1000.0) * beat_interval) / Conductor.rate:
		dumbass_timer = 0
		if Input.is_action_pressed("space") && can_hit:
			return
		fuck_ups += 1
		print("you failed to hit in time!")
			
		misses += 1
	
	var rot_shit:float = sin(converted_time) * 32
	pendelum.rotation = deg_to_rad(rot_shit)
	
	if abs(rot_shit) > 20:
		can_hit = true
	
	if Input.is_action_just_pressed("space"):
		if abs(rot_shit) <= 20:
			if can_hit: good_hit()
		else:
			bad_hit()
func good_hit():
	print("good hit!")
	can_hit = false
	misses = 0
	var dupe = pendelum.duplicate()
	dupe.modulate.a = 0.5
	var tween = get_tree().create_tween()
	tween.set_ease(Tween.EASE_IN_OUT)
	tween.set_trans(Tween.TRANS_CUBIC)
	tween.tween_property(dupe, "modulate:a", 0, 0.3)
	tween.tween_callback(func(): if is_instance_valid(dupe): dupe.queue_free())
	copies.add_child(dupe)
	fuck_ups -= 1
	if fuck_ups <= 0: fuck_ups = 0
	
func bad_hit():
	fuck_ups += 1
	print("bad hit!")
