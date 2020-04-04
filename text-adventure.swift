
// ANIMAL CLASSES
class Animal {
    var name:String
	var strength:Int
	var speed:Int
	var agility:Int
	init(_ name:String){
		self.name = name
		self.strength = 0
		self.speed = 0
		self.agility = 0
	}
	func speak() {
		print("Abstract animal noise")
	}
}

class Hog: Animal{
	override init(_ name:String){
		super.init(name)
		self.strength = 3
		self.speed = 2
		self.agility = 1
	}
	override func speak(){
		print("Oink oink!")
	}
}
class Dog: Animal{
	override init(_ name:String){
		super.init(name)
		self.strength = 2
		self.speed = 3
		self.agility = 1
	}
	override func speak(){
		print("Woof woof!")
	}
}
class Frog: Animal{
	override init(_ name:String){
		super.init(name)
		self.strength = 1
		self.speed = 2
		self.agility = 3
	}
	override func speak(){
		print("Ribbit ribbit!")
	}
}

var oinky = Hog("Oinky")
print("\(oinky.name) is \(oinky.strength) strong!")
oinky.speak()


print("Hello! Are you ready for an adventure?")
var ready:String
repeat{
	ready = readLine()!
	if ready == "y"{
		print("Great! Let us get started...")
	}
	else if ready == "n"{
		print("Boo! Fine I will wait until you say yes.")
	}
	else{
		print("That response makes no sense to me. Try again.")
		
	}
} while ready != "y"


// print("How old are you?")

// var age = 66
// var response:String

// if age < 18 {
// 	response = "Kid"
// }
// else if age < 18 && age < 65{
// 	response = "Adult"
// }
// else{
// 	response = "Geezer"
// }
// print("Hello! You are \(age), \(response).")

// var someCharacter = "c"

// switch someCharacter{
// 	case "a":
// 		print("A is for Alligator")
// 	case "b", "c":
// 		print("B is for Butt")
// 	default:
// 		print("Nothing is real!")
// }

// for _ in 1...5{
// 	print("poop!")
// }

// var counter = 2
// repeat{
// 	print("Smorgy Borgyson!")
// 	counter = counter - 1
// } while counter > 0

// func add(_ p1:Int, _ p2:Int) -> Int {

// 	let z = p1 + p2
// 	return z
// }

// print(add(7, 5))

// class Dog {
// 	var name:String
// 	var age:Int
// 	var breed:String?
// 	var mood:String?
// 	var nameAndMood:String{
// 		if mood != nil {
// 			return name + " the \(mood!) dog"
// 		}
// 		else{
// 			return name
// 		}
// 	}
// 	init(){
// 		self.name = "Dog"
// 		self.age = 1
// 		self.breed = "Mut"
// 		self.mood = "Neutral"
// 	}

// 	convenience init(_ n:String, _ a:Int, _ b:String, _ m:String){
// 	self.init()
// 		self.name = n
// 		self.age = a
// 		self.breed = b
// 		self.mood = m
// 	}
	 
// 	func bark() {
// 		print("\(name) barked!")
// 		if breed != nil{
// 			print("\(nameAndMood) is a \(breed!)")
// 		}
// 	}
// }

// class BigDog : Dog {
// 	override func bark() {
// 		super.bark()
// 		print("The ground trembled in his wake!")
// 	}
// }
// var bef = Dog("Bef", 9, "Mut", "Hungry")
// bef.bark()
// var wish = BigDog("Wish", 3, "Chocolate Labrador", "Intrepid")
// wish.bark()
// var dog = Dog()
// dog.bark()

// var bones = [String:Int]()
// bones["White Bone"] = 10
// print(bones["White Bone"]!)
