//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


let r = [1,2,3,4,5,6,7,8,9]

for i in 1..<8 {
    print("i is \(i)")
}

for i in r {
    print(i)
}

let cool = 1
let g = "This is some pretty cool shit man"

//: Strings are sequences of unicode characters. Sigh..

g.characters.count

var rev:String = ""

// reverse the collection of strings, neat
for c in g.characters.reverse() {
    
    rev = rev + String(c)
}

print(rev)

r.count

var dict = [String:Int]()
dict["hello"] = 2
dict["whoa"] = 4

for (key, value) in dict {
    print("key is \(key) : \(value)")
}


let opt:Int? = Optional(45)

opt!
if let opt = opt {
    print("oh hello:")
}

func nextNumber(num: Int) -> Int? {
    
    if num > 3 {
        return .Some(num+3)
    }
    
    return .None
}

/*: 
# Tuples
return some stuff with a named tuple
Tuple can contain various types, and are better then handling things than a
 [AnyObject] array.
*/

func coolTimes() -> (time:Int, cool:Int) {
    return (1,3)
}

let times = coolTimes()

// access a tuple like this :
times.cool

//:tuples are almost like anonymous lightweight objects
let tup = ("hello", "there", "Oktoberfest!", 1)

// Declare typed Optionals of a tuple type
var y:Optional<(String, Int)> = ("yoyo", 33)
var no:Optional<(String, Int)> = nil


/*: The ?? operator will assign value if optional can be unwrapped.
much like in JS var t = x || "nothing"
*/

let something = y ?? ("nope", 0)
let another = no ?? ("here", 1)


//: Function showing howto pattern match on tuple positions
func switchyWithTuple(t:(Int, Int)) -> String {
    switch t {
    case (_ , 2) :
        return "Two in the last spot"
    
    case (1,1) :
        return "Snake eyes!"
        
    default:
        return "I dunno that's cool"
    }
}

let resp = switchyWithTuple((12,2))
let blah = switchyWithTuple((1,1))


//: Optional binding using a WHERE clause is powerful
let one = 1
let two = 2
let bump:String? = "WHOA"

if let huh = bump where (one+two == 3) {
    print("Swift is cool!!")
}

/*: 
## Switches
An even better Swtich statement with a 'let' and 'where' clause wow!
using 'let' clauses allows variables to be bound within the case block
the argument can also be used within a calculation */

//http://nshipster.com/swift-1.2/
func betterSwitchyWithTuple(t:(Int, Int)) -> String {
    
    switch t {
        
    case (0, let x):
        return "Zero eh and his friend \(x)"
        
    case let (1,h) where (t.0+t.1 % 2 == 0):
        return "Even snakeeye wink with \(h)"
        
    default:
        return "Default case here partner"
    }
}

//Exercises Chap 2
func addStrings(o:String, t:String) -> Int? {
if let oneInt = Int(o) , let twoInt = Int(t) {
    return oneInt+twoInt;
}
    return nil
}

let someOpt = addStrings("123", t:"Que sera sera")
let otherOpt = addStrings("123" , t:"134")

var myNumb = 2
var divider = 7 / myNumb

/* 
# Enumerations

By default, enums are not ordered. This means we can't compare enum values with each other. This can be fixed by assigning an enum value a starting 'Int' value. Then the value can be used where any Int can. The enum just needs to have a 'raw' type.

*/

enum TeaInts:Int {
    case green = 1
    case black = 2
    case white = 3
}

enum TeaAssocValues {
    case additives(String, String)
    case howHot(Int)
}

/* : Associated values within Enums are powerful! Mult values can be tagged to an enum state. Remember that an enum only ever has ONE valid state at a time. It's like a state machine.
    
    Setting new values in the enum erases the previous ones.
    Instance methods can be added to an enum.
    Type methods can be added via the 'static' keyword.
    
    mutating methods must be marked as such
*/

enum TeaType {
    case green
    case black
    case white
    case fruit(String, String)
    
    func whatKindOfTea() -> String {
    
        switch self {
            
        case .green:
            return "yummy green tea"
        case .black:
            return "pip pip black tea cherrio"
        case .white:
            return "cool white tea"
        case .fruit(let one, let two):
            return "Fruit tea with \(one) and \(two)"
        }
    }
    
    mutating func dumpIt() {
        self = .white
    }
}

let tea:TeaType = .fruit("honey", "lemon")
tea.whatKindOfTea()

/* :
# Classes
Passed by reference, just like normal ObjC classes. There are no ivars which shadow property names. 

## Initialization : Before using the class. ALL properties must be initialized or have default values when declared. **Note** During init we cannot called any instance methods with `self` to set a default variable; self doesn't yet exist!

*/




