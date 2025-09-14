extends Node2D

var Flaggen:Array = []
@onready var allbuttons:Node = $allbuttons
@onready var imagesprite:Sprite2D = $Sprite2D
@onready var Playbutton:Button = $plaY
@onready var Button1:Button = $allbuttons/Flag1
@onready var Button3:Button = $allbuttons/Flag3
@onready var Button2:Button = $allbuttons/Flag2
@onready var Button4:Button = $allbuttons/Flag4
@onready var flammenzahl:Sprite2D = $allbuttons/Flame
@onready var leavebutton:Button = $Leave
var streak:int = 0
var survival:bool 


func randomizeflag()->void:
	
	if Playbutton.visible == true:
		Playbutton.visible = false
		Playbutton.disabled = true
		Button1.visible = true
		Button2.visible = true
		Button3.visible = true
		Button4.visible = true
		Button1.disabled = false
		Button2.disabled = false
		Button3.disabled = false
		Button4.disabled = false
		leavebutton.visible = true
		imagesprite.visible = true
	
				
	var randomflag = Flaggen.pick_random()
	var texture = load("res://flags_renamed_simple/" + randomflag)
	imagesprite.texture = texture

	

	var selection:Array  = []
	var Wortohnepngname:String = ""
	
	for  buchstabe in randomflag:
		
		if buchstabe != ".":
			
			
			Wortohnepngname += buchstabe
		else:
			break
		
	selection.append(Wortohnepngname)
	imagesprite.name = Wortohnepngname
	
	for i in range(0,3):
	
		var randomflag2 = countrynamelist.pick_random()
		while randomflag2 == Wortohnepngname:
			randomflag2 = countrynamelist.pick_random()
		selection.append(randomflag2)
		
	selection.shuffle()
	
	for i in range(0,4):
		allbuttons.get_child(i).text = selection[i]
func Buttonpressed(button) -> void:
	if button.text == imagesprite.name:
		randomizeflag()
		streak += 1 
		flammenzahl.get_child(0).text = str(streak)
		if streak == 1:
			print("hallo")
			flammenzahl.visible = true
		else:
			print("DOESNT WORK")
	else:
		streak = 0
		flammenzahl.get_child(0).text = str(streak)
		
		
		

	


		
		
			
		

	

	

var countrynamelist = ["Afghanistan","Anguilla","Albania","Algeria","Andorra","Angola","Antigua and Barbuda"
,"Argentina","Armenia","Australia","Austria",
"Aruba","Azerbaijan","Bahamas","Bahrain",
"Bangladesh","Barbados","Belarus","Belgium","Belize","Benin",
"Bhutan","Bolivia","Bosnia and Herzegovina","Botswana","Brazil"
,"Brunei","Bulgaria","Burkina Faso","Burundi",
"Cabo Verde","Cambodia","Cameroon","Canada"
,"Central African Republic","Chad","Chile","China"
,"Colombia","Comoros",
"Congo (Congo-Brazzaville)","Costa Rica","Croatia","Cuba","Cyprus","Czechia (Czech Republic)"
,"Democratic Republic of the Congo","Denmark","Djibouti","Dominica",
"Dominican Republic","Ecuador","Egypt","El Salvador","Equatorial Guinea"
,"Eritrea","Estonia","Eswatini (fmr. 'Swaziland')","Ethiopia","Fiji",
"Finland","France","Gabon","Gambia","Georgia","Germany","Ghana","Greece","Grenada","Guatemala",

"Guinea","Guinea-Bissau","Guyana","Haiti","Holy See","Honduras","Hungary","Iceland","India",
"Indonesia",
"Iran","Iraq","Ireland","Israel","Italy","Jamaica","Japan","Jordan","Kazakhstan","Kenya",
"Kiribati","Kuwait","Kyrgyzstan","Laos","Latvia","Lebanon","Lesotho","Liberia","Libya",
"Liechtenstein",
"Lithuania","Luxembourg","Madagascar","Malawi","Malaysia","Maldives","Mali","Malta",
"Marshall Islands","Mauritania",
"Mauritius","Mexico","Micronesia","Moldova","Monaco","Mongolia","Montenegro","Morocco",
"Mozambique","Myanmar (Burma)",
"Namibia","Nauru","Nepal","Netherlands","New Zealand","Nicaragua","Niger","Nigeria",
"North Korea","North Macedonia",
"Norway","Oman","Pakistan","Palau","Palestine State","Panama","Papua New Guinea","Paraguay",
"Peru","Philippines",
"Poland","Portugal","Qatar","Romania","Russia","Rwanda","Saint Kitts and Nevis","Saint Lucia",
"Saint Vincent and the Grenadines","Samoa",
"San Marino","Sao Tome and Principe","Saudi Arabia","Senegal","Serbia","Seychelles",
"Sierra Leone","Singapore","Slovakia","Slovenia",
"Solomon Islands","Somalia","South Africa","South Korea","South Sudan","Spain","Sri Lanka","Sudan","Suriname","Sweden",
"Switzerland","Syria","Tajikistan","Tanzania","Thailand","Timor-Leste","Togo","Tonga",
"Trinidad and Tobago","Tunisia",
"Turkey","Turkmenistan","Tuvalu","Uganda","Ukraine","United Arab Emirates","United Kingdom",
"United States","Uruguay","Uzbekistan",
"Vanuatu","Venezuela","Vietnam","Yemen","Zambia","Zimbabwe"]
func _ready() -> void:
	Playbutton.pressed.connect(randomizeflag)
	var dir = DirAccess.open("res://flags_renamed_simple")
	dir.list_dir_begin()
	var file_name = dir.get_next()
	while file_name != "":
		
		if file_name.to_lower().ends_with("png"):
			Flaggen.append(file_name) 
		file_name = dir.get_next()
	
	Button1.pressed.connect(Buttonpressed.bind(Button1))
	Button2.pressed.connect(Buttonpressed.bind(Button2))
	Button3.pressed.connect(Buttonpressed.bind(Button3))
	Button4.pressed.connect(Buttonpressed.bind(Button4))

func _on_leave_pressed() -> void:
	cancel1()

func cancel1() -> void:
	leavebutton.visible = false
	streak = 0
	flammenzahl.get_child(0).text = "zero"
	flammenzahl.visible = false
	
	imagesprite.visible = false
	Playbutton.visible  = true
	Playbutton.disabled  = false
	Button1.visible = false
	Button1.disabled = true
	Button2.visible = false
	Button2.disabled = true
	Button3.visible = false
	Button3.disabled = true
	Button4.visible = false
	Button4.disabled = true

 
