extends Node

var curr_score = 0.0
var last_comments = []
var multi_combo = 1.0


signal score_changed(score: float)
signal combo_changed(combo: float)

func _ready():
	set_score(0.0)
	set_combo(1.0)
	
	
func set_score(score: float):
	curr_score = score
	score_changed.emit(score)
	
func set_combo(combo: float):
	multi_combo = combo
	combo_changed.emit(combo)

func add_score_for_comment(comment):
	if comment in last_comments:
		print("Repeat comment")
		set_combo(1.0)
		return
	if len(last_comments) > 5:
		last_comments.pop_front()
	last_comments.append(comment)
	
	var len_score = len(comment) * 0.1
	var vul_no_score = get_no_vulgars(comment) * 2
	print("NO Ladnych slow: " + str(vul_no_score))
	
	var non_words = get_no_nonwords(comment)
	print("NO nie-slow: " + str(non_words))
	
	var new_score = curr_score + ((len_score + vul_no_score) * multi_combo) - non_words 
	set_score(new_score)
	set_combo(multi_combo + 0.5)

func _on_comment_added(text: String) -> void:
	add_score_for_comment(text)
	

func get_no_nonwords(comment):
	var no_nonwords = 0
	for word in comment.split(" "):
		if len(word) > 10:
			no_nonwords += len(word)
			continue
		var potencial_non_word = false
		for letter in word:
			if len(word) > 3:
				break
			var letters_no = word.count(letter)
			print("letters no " + str(letters_no) + ", len(word): " + str(len(word)) + ", ratio: " + str((letters_no * 100) / len(word)))
			if (letters_no * 100) / len(word) < 20:
				if potencial_non_word:
					no_nonwords += len(word)
					continue
				potencial_non_word = true
				
	return no_nonwords

func get_no_vulgars(comment):
	var no_vulgarims = 0
	for word in comment.split(" "):
		if is_vulgar(word):
			no_vulgarims += 1
	return no_vulgarims


func is_vulgar(word):
	return word in ['fuck', 'shit', 'cock', 'whore',
	 'chuj','chuja', 'chujek', 'chuju', 'chujem', 'chujnia',
'chujowy', 'chujowa', 'chujowe', 'cipa', 'cipę', 'cipe', 'cipą',
'cipie', 'dojebać','dojebac', 'dojebie', 'dojebał', 'dojebal',
'dojebała', 'dojebala', 'dojebałem', 'dojebalem', 'dojebałam',
'dojebalam', 'dojebię', 'dojebie', 'dopieprzać', 'dopieprzac',
'dopierdalać', 'dopierdalac', 'dopierdala', 'dopierdalał',
'dopierdalal', 'dopierdalała', 'dopierdalala', 'dopierdoli',
'dopierdolił', 'dopierdolil', 'dopierdolę', 'dopierdole', 'dopierdoli',
'dopierdalający', 'dopierdalajacy', 'dopierdolić', 'dopierdolic',
'dupa', 'dupie', 'dupą', 'dupcia', 'dupeczka', 'dupy', 'dupe', 'huj',
'hujek', 'hujnia', 'huja', 'huje', 'hujem', 'huju', 'jebać', 'jebac',
'jebał', 'jebal', 'jebie', 'jebią', 'jebia', 'jebak', 'jebaka', 'jebal',
'jebał', 'jebany', 'jebane', 'jebanka', 'jebanko', 'jebankiem',
'jebanymi', 'jebana', 'jebanym', 'jebanej', 'jebaną', 'jebana',
'jebani', 'jebanych', 'jebanymi', 'jebcie', 'jebiący', 'jebiacy',
'jebiąca', 'jebiaca', 'jebiącego', 'jebiacego', 'jebiącej', 'jebiacej',
'jebia', 'jebią', 'jebie', 'jebię', 'jebliwy', 'jebnąć', 'jebnac',
'jebnąc', 'jebnać', 'jebnął', 'jebnal', 'jebną', 'jebna', 'jebnęła',
'jebnela', 'jebnie', 'jebnij', 'jebut', 'koorwa', 'kórwa', 'kurestwo',
'kurew', 'kurewski', 'kurewska', 'kurewskiej', 'kurewską', 'kurewska',
'kurewsko', 'kurewstwo', 'kurwa', 'kurwaa', 'kurwami', 'kurwą', 'kurwe',
'kurwę', 'kurwie', 'kurwiska', 'kurwo', 'kurwy', 'kurwach', 'kurwami',
'kurewski', 'kurwiarz', 'kurwiący', 'kurwica', 'kurwić', 'kurwic',
'kurwidołek', 'kurwik', 'kurwiki', 'kurwiszcze', 'kurwiszon',
'kurwiszona', 'kurwiszonem', 'kurwiszony', 'kutas', 'kutasa', 'kutasie',
'kutasem', 'kutasy', 'kutasów', 'kutasow', 'kutasach', 'kutasami',
'matkojebca', 'matkojebcy', 'matkojebcą', 'matkojebca', 'matkojebcami',
'matkojebcach', 'nabarłożyć', 'najebać', 'najebac', 'najebał',
'najebal', 'najebała', 'najebala', 'najebane', 'najebany', 'najebaną',
'najebana', 'najebie', 'najebią', 'najebia', 'naopierdalać',
'naopierdalac', 'naopierdalał', 'naopierdalal', 'naopierdalała',
'naopierdalala', 'naopierdalała', 'napierdalać', 'napierdalac',
'napierdalający', 'napierdalajacy', 'napierdolić', 'napierdolic',
'nawpierdalać', 'nawpierdalac', 'nawpierdalał', 'nawpierdalal',
'nawpierdalała', 'nawpierdalala', 'obsrywać', 'obsrywac', 'obsrywający',
'obsrywajacy', 'odpieprzać', 'odpieprzac', 'odpieprzy', 'odpieprzył',
'odpieprzyl', 'odpieprzyła', 'odpieprzyla', 'odpierdalać',
'odpierdalac', 'odpierdol', 'odpierdolił', 'odpierdolil',
'odpierdoliła', 'odpierdolila', 'odpierdoli', 'odpierdalający',
'odpierdalajacy', 'odpierdalająca', 'odpierdalajaca', 'odpierdolić',
'odpierdolic', 'odpierdoli', 'odpierdolił', 'opieprzający',
'opierdalać', 'opierdalac', 'opierdala', 'opierdalający',
'opierdalajacy', 'opierdol', 'opierdolić', 'opierdolic', 'opierdoli',
'opierdolą', 'opierdola', 'piczka', 'pieprznięty', 'pieprzniety',
'pieprzony', 'pierdel', 'pierdlu', 'pierdolą', 'pierdola', 'pierdolący',
'pierdolacy', 'pierdoląca', 'pierdolaca', 'pierdol', 'pierdole',
'pierdolenie', 'pierdoleniem', 'pierdoleniu', 'pierdolę', 'pierdolec',
'pierdola', 'pierdolą', 'pierdolić', 'pierdolicie', 'pierdolic',
'pierdolił', 'pierdolil', 'pierdoliła', 'pierdolila', 'pierdoli',
'pierdolnięty', 'pierdolniety', 'pierdolisz', 'pierdolnąć',
'pierdolnac', 'pierdolnął', 'pierdolnal', 'pierdolnęła', 'pierdolnela',
'pierdolnie', 'pierdolnięty', 'pierdolnij', 'pierdolnik', 'pierdolona',
'pierdolone', 'pierdolony', 'pierdołki', 'pierdzący', 'pierdzieć',
'pierdziec', 'pizda', 'pizdą', 'pizde', 'pizdę', 'piździe', 'pizdzie',
'pizdnąć', 'pizdnac', 'pizdu', 'podpierdalać', 'podpierdalac',
'podpierdala', 'podpierdalający', 'podpierdalajacy', 'podpierdolić',
'podpierdolic', 'podpierdoli', 'pojeb', 'pojeba', 'pojebami',
'pojebani', 'pojebanego', 'pojebanemu', 'pojebani', 'pojebany',
'pojebanych', 'pojebanym', 'pojebanymi', 'pojebem', 'pojebać',
'pojebac', 'pojebalo', 'popierdala', 'popierdalac', 'popierdalać',
'popierdolić', 'popierdolic', 'popierdoli', 'popierdolonego',
'popierdolonemu', 'popierdolonym', 'popierdolone', 'popierdoleni',
'popierdolony', 'porozpierdalać', 'porozpierdala', 'porozpierdalac',
'poruchac', 'poruchać', 'przejebać', 'przejebane', 'przejebac',
'przyjebali', 'przepierdalać', 'przepierdalac', 'przepierdala',
'przepierdalający', 'przepierdalajacy', 'przepierdalająca',
'przepierdalajaca', 'przepierdolić', 'przepierdolic', 'przyjebać',
'przyjebac', 'przyjebie', 'przyjebała', 'przyjebala', 'przyjebał',
'przyjebal', 'przypieprzać', 'przypieprzac', 'przypieprzający',
'przypieprzajacy', 'przypieprzająca', 'przypieprzajaca',
'przypierdalać', 'przypierdalac', 'przypierdala', 'przypierdoli',
'przypierdalający', 'przypierdalajacy', 'przypierdolić',
'przypierdolic', 'qrwa', 'rozjebać', 'rozjebac', 'rozjebie',
'rozjebała', 'rozjebią', 'rozpierdalać', 'rozpierdalac', 'rozpierdala',
'rozpierdolić', 'rozpierdolic', 'rozpierdole', 'rozpierdoli',
'rozpierducha', 'skurwić', 'skurwiel', 'skurwiela', 'skurwielem',
'skurwielu', 'skurwysyn', 'skurwysynów', 'skurwysynow', 'skurwysyna',
'skurwysynem', 'skurwysynu', 'skurwysyny', 'skurwysyński',
'skurwysynski', 'skurwysyństwo', 'skurwysynstwo', 'spieprzać',
'spieprzac', 'spieprza', 'spieprzaj', 'spieprzajcie', 'spieprzają',
'spieprzaja', 'spieprzający', 'spieprzajacy', 'spieprzająca',
'spieprzajaca', 'spierdalać', 'spierdalac', 'spierdala', 'spierdalał',
'spierdalała', 'spierdalal', 'spierdalalcie', 'spierdalala',
'spierdalający', 'spierdalajacy', 'spierdolić', 'spierdolic',
'spierdoli', 'spierdoliła', 'spierdoliło', 'spierdolą', 'spierdola',
'srać', 'srac', 'srający', 'srajacy', 'srając', 'srajac', 'sraj',
'sukinsyn', 'sukinsyny', 'sukinsynom', 'sukinsynowi', 'sukinsynów',
'sukinsynow', 'śmierdziel', 'udupić', 'ujebać', 'ujebac', 'ujebał',
'ujebal', 'ujebana', 'ujebany', 'ujebie', 'ujebała', 'ujebala',
'upierdalać', 'upierdalac', 'upierdala', 'upierdoli', 'upierdolić',
'upierdolic', 'upierdoli', 'upierdolą', 'upierdola', 'upierdoleni',
'wjebać', 'wjebac', 'wjebie', 'wjebią', 'wjebia', 'wjebiemy',
'wjebiecie', 'wkurwiać', 'wkurwiac', 'wkurwi', 'wkurwia', 'wkurwiał',
'wkurwial', 'wkurwiający', 'wkurwiajacy', 'wkurwiająca', 'wkurwiajaca',
'wkurwić', 'wkurwic', 'wkurwi', 'wkurwiacie', 'wkurwiają', 'wkurwiali',
'wkurwią', 'wkurwia', 'wkurwimy', 'wkurwicie', 'wkurwiacie', 'wkurwić',
'wkurwic', 'wkurwia', 'wpierdalać', 'wpierdalac', 'wpierdalający',
'wpierdalajacy', 'wpierdol', 'wpierdolić', 'wpierdolic', 'wpizdu',
'wyjebać', 'wyjebac', 'wyjebali', 'wyjebał', 'wyjebac', 'wyjebała',
'wyjebały', 'wyjebie', 'wyjebią', 'wyjebia', 'wyjebiesz', 'wyjebie',
'wyjebiecie', 'wyjebiemy', 'wypieprzać', 'wypieprzac', 'wypieprza',
'wypieprzał', 'wypieprzal', 'wypieprzała', 'wypieprzala', 'wypieprzy',
'wypieprzyła', 'wypieprzyla', 'wypieprzył', 'wypieprzyl', 'wypierdal',
'wypierdalać', 'wypierdalac', 'wypierdala', 'wypierdalaj',
'wypierdalał', 'wypierdalal', 'wypierdalała', 'wypierdalala',
'wypierdalać', 'wypierdolić', 'wypierdolic', 'wypierdoli',
'wypierdolimy', 'wypierdolicie', 'wypierdolą', 'wypierdola',
'wypierdolili', 'wypierdolił', 'wypierdolil', 'wypierdoliła',
'wypierdolila', 'zajebać', 'zajebac', 'zajebie', 'zajebią', 'zajebia',
'zajebiał', 'zajebial', 'zajebała', 'zajebiala', 'zajebali', 'zajebana',
'zajebani', 'zajebane', 'zajebany', 'zajebanych', 'zajebanym',
'zajebanymi', 'zajebiste', 'zajebisty', 'zajebistych', 'zajebista',
'zajebistym', 'zajebistymi', 'zajebiście', 'zajebiscie', 'zapieprzyć',
'zapieprzyc', 'zapieprzy', 'zapieprzył', 'zapieprzyl', 'zapieprzyła',
'zapieprzyla', 'zapieprzą', 'zapieprza', 'zapieprzy', 'zapieprzymy',
'zapieprzycie', 'zapieprzysz', 'zapierdala', 'zapierdalać',
'zapierdalac', 'zapierdalaja', 'zapierdalał', 'zapierdalaj',
'zapierdalajcie', 'zapierdalała', 'zapierdalala', 'zapierdalali',
'zapierdalający', 'zapierdalajacy', 'zapierdolić', 'zapierdolic',
'zapierdoli', 'zapierdolił', 'zapierdolil', 'zapierdoliła',
'zapierdolila', 'zapierdolą', 'zapierdola', 'zapierniczać',
'zapierniczający', 'zasrać', 'zasranym', 'zasrywać', 'zasrywający',
'zesrywać', 'zesrywający', 'zjebać', 'zjebac', 'zjebał', 'zjebal',
'zjebała', 'zjebala', 'zjebana', 'zjebią', 'zjebali', 'zjeby']
