extends KinematicBody

onready var Dialogue = get_node("/root/Game/UI/Dialogue")

var dialogue = [
	"Que pasa me hambre! Como estas? (press E to continue)"
	, "You gotta destroy the targets. You just gotta. (press E to continue)"
	, "If I was you, hypoltheticaly of coarse, I would aline my red crosshair with the target. (press E to continue)"
	, "After that, I'd probably press the space bar. (press E to continue)"
	, "But hey, thats just me. I'm not your boss or anything."
]

func _ready():
	$AnimationPlayer.play("Idle")
	Dialogue.connect("finished_dialogue", self, "finished")
	
	

func _on_Area_body_entered(_body):
	Dialogue.start_dialogue(dialogue)


func _on_Area_body_exited(_body):
	Dialogue.hide_dialogue()


func finished():
	get_node("/root/Game/Target_container").show()
	Global.timer = 120
	Global.update_time()
	get_node("/root/Game/UI/Timer").start()
