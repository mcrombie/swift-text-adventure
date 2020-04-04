
class Player{
	var name:String = "Bob"
	var animal:Animal = Hog()
	var location:Place = base
}

// ANIMAL CLASSES
class Animal {
	var strength:Int
	var speed:Int
	var agility:Int
	init(){
		self.strength = 0
		self.speed = 0
		self.agility = 0
	}
	func speak() {
		print("Abstract animal noise")
	}
}

class Hog: Animal{
	override init(){
		super.init()
		self.strength = 3
		self.speed = 2
		self.agility = 1
	}
	override func speak(){
		print("Oink oink!")
	}
}
class Dog: Animal{
	override init(){
		super.init()
		self.strength = 2
		self.speed = 3
		self.agility = 1
	}
	override func speak(){
		print("Woof woof!")
	}
}
class Frog: Animal{
	override init(){
		super.init()
		self.strength = 1
		self.speed = 2
		self.agility = 3
	}
	override func speak(){
		print("Ribbit ribbit!")
	}
}


//PLACE CLASS
class Place{
	var name:String
	var initDesc:String
	var goalDesc:String
	var reDesc:String
	var finDesc:String

	var entered:Bool = false
	var completed:Bool = false

	var options:[[String]]

	init(name n:String, initDesc id:String, goalDesc gd:String, reDesc rd:String, 
	finDesc fd:String, options opts:[[String]]){
		self.name = n //name of the place
		self.initDesc = id //description on initial entry
		self.goalDesc = gd //what is the goal here?
		self.reDesc = rd //description if you return to the forest without completing the goal
		self.finDesc = fd //description if you return to the forest after finishing the goal
		self.options = opts //options for user input
	}

	func initEntry(){print(initDesc)}

	func reEntry(){print(reDesc)}

	func finEntry(){print(finDesc)}

	

	func tryGoal(_ plyr:Player){
		print(goalDesc)
		chooseOption(player:plyr, place: self.name, options: self.options)

	}

	func play(_ plyr:Player){
		if !entered{
			initEntry()
			tryGoal(plyr)
		}
		else if entered && !completed {
			reEntry()
			tryGoal(plyr)
		}
		else if entered && completed {
			finEntry()
		}
	}
}

func chooseOption(place p:String, options opts:[[String]]){
	print("What do you do?")
		for option in opts{
			print("\(option[0]): \(option[1])")
		}
		
		var validChoice = false
		repeat{
			let choice = readLine()
			validChoice = possibilities(place: p, choice: choice!)
		}while !validChoice
}


//POSSIBLE ACTIONS FOR DIFFERENT PLACES

func possibilities(place p:String, choice c:String) -> Bool{
	if p == "Forest"{
		switch c{
			case "p":
				print("You pull.")
				return true
			case "h":
				print("You ask aloud what to do.")
				return true
			case "g":
				print("You give up and leave. How lame.")
				return true
			default:
				print("You do something nonsensical. Try again.")
				return false
		}
	}
	else{
		return false
	}

}

//OBJECTS FOR EACH PLACE
let base = Place(
	name:"Base",
	initDesc:"You enter the base.",
	goalDesc:"You pick somewhere to go from here.",
	reDesc:"You reenter the base.",
	finDesc:"You completed your quest!",
	options:[
		["s", "Switch animals."],
		["f", "Go to the forest."],
		["m", "Go to the mountain."],
		["d", "Go to the desert."],
		["c", "Go to the castle."]
	]
)
let forest = Place(
	name:"Forest",
	initDesc:"You enter a lush, verdant forest. Birds are singing. Rays of sunshine sneak past the leaves. A light breeze refreshes you.",
	goalDesc:"There is a whimpering noise coming from a fallen tree. You see Old Dog is trapped inside a log! \"Woof woof,\" he barks. \"Could you help me get out of here?\"",
	reDesc:"You reenter the forest. The birds have flown away. They got sick of Old Dog's whimpering. The light breeze and sunshine is not as refreshing. Old Dog could sure use your help.",
	finDesc:"You return to the lush, verdant forest. The birds are singing a paean to your success in liberating Old Dog. You bask in the sunshine and light breeze feeling accomplished.",
	options:[
		["p", "Pull Old Dog out of the log."], 
		["h", "Ask for help."], 
		["g", "Give up and go back."]
	]
)



func main(){
	var running = true
	var player = Player()

	repeat{
		print("Choose where to go:")
		switch c{
			case "s":
				print("You switch animals")
				print(plyr.animal)
				plyr.animal = Frog()
				print(plyr.animal)
				return true
			case "f":
				print("You go to the forest.")
				return true
			case "m":
				print("You go to the mountain.")
				return true
			default:
				print("You do something nonsensical. Try again.")
				return false
		}
	}while running
}

main()
