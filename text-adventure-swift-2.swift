class Player{
    var name:String
    var animal:String

    init(_ n:String, _ a:String){
        self.name = n
        self.animal = a
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

	func initEntry(){print(initDesc)}

	func reEntry(){print(reDesc)}

	func finEntry(){print(finDesc)}

	

	func tryGoal(_ currentAnimal:String){
		print(goalDesc)
		chooseOption(animal: currentAnimal, place: self, options: self.options)

	}

	func play(_ currentAnimal:String){
		if !entered{
			initEntry()
			tryGoal(currentAnimal)
		}
		else if entered && !completed {
			reEntry()
			tryGoal(currentAnimal)
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

func chooseOption(animal animal:String, place p:Place, options opts:[[String]]){
	print("What do you do?")
    listOptions(options: opts)
		
    var validChoice = false
    repeat{
        let choice = readLine()
        validChoice = possibilities(animal: animal, place: p, choice: choice!)
    }while !validChoice
}

func possibilities(animal animal:String, place p:Place, choice c:String) -> Bool{
	if p.name == "Forest"{
        p.entered = true
		switch c{
			case "p":
                if animal == "Hog"{
                    print("\nYou pull Old Dog out. He returns with you back to base!\n")
                    p.completed = true
                    return true
                } 
                else{
                    print("You pull but fail to free Old Dog.")
                    return false
                }

			case "h":
				print("You ask aloud what to do.\nThe birds laugh at you.")
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

let animalOptions = [["d", "dog"], ["f", "frog"], ["h", "hog"]]




func main(){
	var running = true
    var currentAnimal:String

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

    print("\nWelcome! This is a story about the adventure of a dog, a frog, and a hog.\n")

    print("\nGreat! Each of these animals plays a part in the story. It is up to you to help each animal do its part. Which animal do you want to start with?\n")
    currentAnimal = switchAnimal()

	repeat{
		print("\nChoose where to go:\n")
        print("s: Switch animals")
        print("f: Forest")
        print("m: Mountain")
        print("d: Desert")
        print("c: Castle")
        let c = readLine()
		switch c{
			case "s":
				print("Switch to what animal?\n")
                currentAnimal = switchAnimal()
			case "f":
				print("You go to the forest.")
                forest.play(currentAnimal)
			case "m":
				print("You go to the mountain.")
			case "d":
				print("You go to the mountain.")
			case "c":
				print("You go to the mountain.")
			default:
				print("You do something nonsensical. Try again.")
		}
	}while running
}

main()