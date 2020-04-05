class Player{
	var currentAnimal:String
	var rescuedAnimals:[String]
	var running:Bool

	init(){
		self.currentAnimal = "None"
		self.rescuedAnimals = []
		self.running = true
	}
}


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

	func initEntry(){print("\(initDesc)\n")}

	func reEntry(){print("\(reDesc)\n")}

	func finEntry(){print("\(finDesc)\n")}

	

	func tryGoal(_ player:Player){
		print(print("\(goalDesc)\n"))
		chooseOption(player: player, place: self, options: self.options)

	}

	func play(_ player:Player){
		if !entered{
			initEntry()
			tryGoal(player)
		}
		else if entered && !completed {
			reEntry()
			tryGoal(player)
		}
		else if entered && completed {
			finEntry()
		}
	}
}

func listOptions(options opts:[[String]]){
    for option in opts{
        print("\(option[0]): \(option[1])")
    }
}

func chooseOption(player plyr:Player, place p:Place, options opts:[[String]]){
	print("What do you do?\n")
    listOptions(options: opts)
		
    var validChoice = false
    repeat{
        let choice = readLine()
        validChoice = possibilities(player: plyr, place: p, choice: choice!)
    }while !validChoice
}

func possibilities(player plyr:Player, place p:Place, choice c:String) -> Bool{
	if p.name == "Forest"{
        p.entered = true
		switch c{
			case "p":
                if plyr.currentAnimal == "Hog"{
                    print("\nYou pull Old Dog out. He returns with you back to base!\n")
                    p.completed = true
					plyr.rescuedAnimals.append("Old Dog")
                    return true
                } 
                else{
                    print("You pull but fail to free Old Dog.")
                    return false
                }

			case "h":
				print("You ask aloud what to do. The birds suggest pulling him free.")
				return false
			case "g":
				print("You give up and leave. How lame.")
				return true
			default:
				print("You do something nonsensical. Try again.")
				return false
		}
	}
	else if p.name == "Mountain"{
        p.entered = true
		switch c{
			case "j":
                if plyr.currentAnimal == "Frog"{
                    print("\nYou jump up and assist Old Hog. He returns with you back to base!\n")
                    p.completed = true
					plyr.rescuedAnimals.append("Old Hog")
                    return true
                } 
                else{
                    print("You jump...but not high enough..")
                    return false
                }

			case "h":
				print("You ask aloud what to do. The birds sugest jumping up and guiding him down.")
				return false
			case "g":
				print("You give up and leave. How lame.")
				return true
			default:
				print("You do something nonsensical. Try again.")
				return false
		}
	}
	else if p.name == "Desert"{
        p.entered = true
		switch c{
			case "r":
                if plyr.currentAnimal == "Dog"{
                    print("\nYou run and quickly catch the lioness, freeing Old Frog from her back. He returns with you back to base!\n")
                    p.completed = true
					plyr.rescuedAnimals.append("Old Frog")
                    return true
                } 
                else{
                    print("You run...but not fast enough.")
                    return false
                }

			case "h":
				print("You ask aloud what to do. The buzzards laugh at you and suggest running to catch up to her.")
				return false
			case "g":
				print("You give up and leave. How lame.")
				return true
			default:
				print("You do something nonsensical. Try again.")
				return false
		}
	}
	else if p.name == "Castle"{
        p.entered = true
		switch c{
			case "f":
                print("You fight the lion! He beats you up :( SHUCKS!")
				return false
			case "i":
				print("You kindly ask the lion to stop being a jerk. He appreciates this and agrees to be good.")
				print("YOU WIN!")
				plyr.running = false
				return true
			case "h":
				print("You ask aloud what to do. The buzzards laugh at you and suggest running to catch up to her.")
				return false
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
let mountain = Place(
	name:"Mountain",
	initDesc:"You come up to the the towering, splendiferous mountain. Birds are singing. The sky is vast and open. Sunshine graces your face.",
	goalDesc:"There is a whimpering noise coming from above. You see Old Hog is stuck on a ledge on the mountain! \"Oink oink,\" he snorts. \"Could you help me get down from here?\"",
	reDesc:"You return to the mountains. The birds have flown away. They got sick of Old Hog's whimpering. The vast sky is foreboding. Old Hog could sure use your help.",
	finDesc:"You return to the towering, splendiferous mountain. The birds are singing a paean to your success in liberating Old Hog. You bask in the sunshine from the open sky.",
	options:[
		["j", "Jump up to help Old Hog."], 
		["h", "Ask for help."], 
		["g", "Give up and go back."]
	]
)
let desert = Place(
	name:"Desert",
	initDesc:"You enter the quiescent, flat desert. Buzzards are feasting. The sky is vast and open. The sun beats down on your face. It is hot.",
	goalDesc:"A lioness runs by you. There is a whimpering noise coming from her back. You see Old Frog tied to her back! \"Ribbit ribbit,\" he croacks. \"Could you help me get off of here?\"",
	reDesc:"You return to the desert. The buzzards have finished their meal and are eyeing you speculatively. The heat is discouraging. Old Frog could sure use your help.",
	finDesc:"You return to the quiescent, flat desert. The buzzards are impressed with your success in liberating Old Frog. You enjoy the scenery.",
	options:[
		["r", "Run to free Old Frog."], 
		["h", "Ask for help."], 
		["g", "Give up and go back."]
	]
)
let castle = Place(
	name:"Castle",
	initDesc:"You enter the colossal, stone castle. Birds are still circling the towers outside beneath the grim, overcast sky. Inside the lion is sitting on a gilded throne.",
	goalDesc:"\"How dare you enter my domain!?\" roars the lion.",
	reDesc:"You return to the castle. Birds are still circling the towers outside beneath the grim, overcast sky. Inside the lion is still sitting on a gilded throne.",
	finDesc:"You return to the colossal, stone castle. The birds are singing a paean to what a hero you are for bringing peace to the land.",
	options:[
		["f", "Fight the lion."], 
		["i", "Implore the lion to be nice."], 
		["h", "Ask for help."], 
		["g", "Give up and go back."]
	]
)

let animalOptions = [["d", "dog"], ["f", "frog"], ["h", "hog"]]




func main(){

	var player = Player()

    func switchAnimal() -> String{
        listOptions(options: animalOptions)
        var validAnimal = false
        repeat {
            var startAnimal = readLine()
            switch startAnimal{
                case "d":
                    print("You choose the dog.")
                    return "Dog"
                case "f":
                    print("You choose the frog.")
                    return "Frog"
                case "h":
                    print("You choose the hog.")
                    return "Hog"
                default:
                    print("You do something nonsensical. Try again.")
            }
        } while !validAnimal
        

    }

    print("\nWelcome! This is a story about the adventure of a dog, a frog, and a hog. The birds have called the three of them together at a place called Nemeton. There the birds inform them that the elders of each of their species has been overthrown and have gone missing. A cruel lion has taken up residence in a castle in the center of the land. It is up to the three animals to overthrow the tyrannical lion. However, the castle is locked. It can only be opened with the combined wisdom of Old Dog, Old Frog, and Old Hog. They will have to be found. Only the combined efforts of Dog, Frog, and Hog can save the day.\n")
    print("\nWhich animal do you want to start with?\n")
    player.currentAnimal = switchAnimal()

	repeat{
		print("\n You are in Nemeton playing as \(player.currentAnimal).\n")
		if player.rescuedAnimals.count > 0 {
			print("You have rescued:")
			for i in player.rescuedAnimals{
				print("\(i)")
			}
				
		}
		print("\nChoose where to go:\n")
        print("s: Switch animals")
        print("f: Forest")
        print("m: Mountain")
        print("d: Desert")
        print("c: Castle\n")
        let c = readLine()
		switch c{
			case "s":
				print("Switch to what animal?\n")
                player.currentAnimal = switchAnimal()
			case "f":
				print("You go to the forest.\n")
                forest.play(player)
			case "m":
				print("You go to the mountain.\n")
				mountain.play(player)
			case "d":
				print("You go to the desert.\n")
				desert.play(player)
			case "c":
				if player.rescuedAnimals.count >= 3{
					print("You go to the castle.\n")
					castle.play(player)
				}
				else{
					print("You need to rescue all three elders before you can enter the castle.\n")
				}

			default:
				print("You do something nonsensical. Try again.")
		}
	}while player.running
}

main()