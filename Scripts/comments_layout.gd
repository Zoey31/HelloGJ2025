extends VBoxContainer

signal user_comment_added(text: String)

var label = preload("res://Scenes/comment.tscn")
var total_offset = 0
const offset = 120

func _ready() -> void:
	var number_of_comments = randi_range(10,25)
	for comment_number in range(number_of_comments):
		add_random_comment()
	
func add_random_comment():
	#var label = Label.new()
	var random_user = randi_range(0, len(random_user_names) - 1)
	var random_comment = randi_range(0, len(random_comments) - 1)
	var label_inst = label.instantiate()
	
	label_inst.get_child(0).text = random_user_names[random_user] + ": \r\n" + random_comments[random_comment]
	label_inst.get_child(0).global_position.y += total_offset
	total_offset += offset
	#var font = Font.new()
	#label.add_theme_font_override("normal_font", )
	#TODO instantitate comment scene here!
	add_child(label_inst)

func add_user_comment(text: String):
	const username = "Troll"
	var label_inst = label.instantiate()
	
	for comment in get_children():
		comment.get_child(0).global_position.y += offset
	total_offset += offset
	
	label_inst.get_child(0).text = username + ": \r\n" + text
	add_child(label_inst)
	move_child(label_inst, 0)
	user_comment_added.emit(text)
	
var random_user_names = [
	"PixelPulse",
"ChillCraze",
"ByteStorm",
"NovaFlip",
"LoopSnax",
"VibeCraft",
"TrendNest",
"ZenoSnap",
"TurboTaco",
"SnapOrb",
"ClipDrip",
"MondoMelt",
"DailyFizz",
"EchoFlex",
"FlipZing",
"BlazeNoodle",
"QuantumChirp",
"ReelSwift",
"HypeCargo",
"BlinkRush",
"NachoVibes",
"LlamaDrama",
"SirClicksALot",
"WaffleTornado",
"ToastedBrain",
"YeetSnack",
"CringeGoblin",
"SoggyLaptop",
"NopeAvenger",
"MemeGuru",
"SynthMode",
"GlitchCraft",
"VoidPanda",
"ArcticRift",
"ShadowNexus",
"FrostPulse",
"HexNinja",
"FluxTheory",
"StaticVibe",
"RogueSyntax",
"heyitsbliss",
"justloopin",
"cloudfade",
"mintyray",
"quietstatic",
"fadedbyte",
"lateclicks",
"duskphase",
"mellowverse",
"softspins"
]

var random_comments = [
	"No way 😱",
"I'm speechless",
"WHAT!?",
"This is wild",
"Mind = blown",
"That ending tho 😮",
"Bro what",
"Plot twist?!",
"I did NOT expect that",
"HOW?? 😳",
"You broke the system",
"Unreal lol",
"Is this even real?",
"Wild stuff 😂",
"Shooketh 💀",
"I'm not okay 😭",
"My jaw dropped",
"This went too far",
"So intense 😬",
"WHY DID I CLICK 😂",
"Comedy gold 😂",
"Bro I’m crying 😭",
"Certified meme",
"Top tier content",
"LMFAO 💀",
"10/10 would do again",
"My brain hurts lol",
"This aged well 🤡",
"I lost it at 0:42",
"Bruh moment",
"This ain't right 💀",
"I can’t stop laughing",
"It’s giving chaos",
"This is illegal 😂",
"Who let you cook?",
"I'm suing 😤",
"Internet undefeated",
"Instant classic",
"Someone call NASA",
"💀💀💀💀💀",
"SAME 😭",
"I feel seen",
"Me every day",
"Been there 😅",
"I needed this",
"So true omg",
"Why is this me",
"This hit home",
"Too relatable 😩",
"Respect 🙌",
"Legend 👏",
"You win the internet",
"Following for more!",
"Subscribed 🔥",
"You’re underrated",
"This deserves more views",
"They did that",
"Love this energy",
"You snapped 👏",
"Perfectly done",
"Let’s gooo 🔥",
"W video",
"Big W 👏",
"This goes HARD",
"Certified banger",
"Instant like",
"Heat 🔥",
"This slaps fr",
"Here before viral",
"Top tier stuff",
"This deserves awards",
"Best one yet",
"Cooked to perfection",
"Vibes are immaculate",
"100/10 🔥",
"MORE OF THIS",
"Drop the full vid!",
"Needed this today",
"GOAT content",
"Elite 👌",
"What did I just watch",
"How is this legal",
"Why tho 😅",
"How did this happen?",
"Where’s part 2?",
"Explain yourself 😂",
"Is this real life",
"Where’s the tutorial",
"I have so many questions",
"Did anyone else notice…",
"I’m confused but okay",
"What’s going on here",
"Can someone explain?",
"WHY IS THIS TRUE",
"This broke my brain",
"I need context lol",
"Wait what just happened",
"I wasn’t ready",
"Run that back",
"How do I unsee this?"
]


func _on_text_edit_text_sent(text: String) -> void:
	add_user_comment(text)
