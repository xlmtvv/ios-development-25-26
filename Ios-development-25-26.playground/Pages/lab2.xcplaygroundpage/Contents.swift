import Foundation

// lab2 #1
for num in 1...100 {
    if (num % 3 == 0 && num % 5 == 0) {
        print("FizzBuzz")
    }
    else if (num % 3 == 0 && num % 5 != 0) {
        print("Fizz")
    }
    else if (num % 3 != 0 && num % 5 == 0) {
        print("Buzz")
    }
}


// lab2 #2

func isPrime(_ number: Int) -> Bool {
    guard number > 1 else {
        return false
    }
    
    if number == 2 || number == 3{
        return true
    }
    
    
    let lastNumToCheck = Int(sqrt(Double(number)))
    for num in 2...lastNumToCheck {
        if number % num == 0 {
            return false
        }
    }
    return true
}

print(isPrime(5))


// lab2 # 3

func temperatureConverter(currentSystem: String, temp: Double, newSystem: String) -> String {
    var result: Double = temp

    let from = currentSystem.lowercased()
    let to = newSystem.lowercased()
    
    var tempInCelsius: Double = 0.0
    //every system to C
    if from == "celsius" {
        tempInCelsius = temp
    } else if from == "fahrenheit" {
        tempInCelsius = (temp - 32) * 5 / 9
    } else if from == "kelvin" {
        tempInCelsius = temp - 273.15
    } else {
        return "неизвестная система измерения \(currentSystem)"
    }
    
    // from C to other
    if to == "celsius" {
        result = tempInCelsius
    } else if to == "fahrenheit" {
        result = (tempInCelsius * 9 / 5) + 32
    } else if to == "kelvin" {
        result = tempInCelsius + 273.15
    } else {
        return "неизвестная система измерения \(newSystem)"
    }
    
    return "\(temp)° \(currentSystem) = \(String(format: "%.2f", result))° \(newSystem)"
}

let currentSystem: String = "Celsius"
let currentTemperature: Double = 23.0
let newSystem: String = "Fahrenheit"

print(temperatureConverter(currentSystem: currentSystem, temp: currentTemperature, newSystem: newSystem))


// lab 2 #4
var shoppingList: [String] = []
let actions = [
    ("add", "Moloko"),
    ("add", "Moloko"),
    ("add", "Maslo"),
    ("add", "eggs"),
    ("remove", "Maslo"),
    ("add", "tvorog"),
    ("exit", "")
]

var index = 0
var isRunning: Bool = true

while isRunning && index < actions.count {
    let action = actions[index]
    let command = action.0.lowercased()
    let item = action.1
    
    index += 1
    if command == "add"  && !shoppingList.contains(item){
        shoppingList.append(item)
        print("Added item \(item)")
    }
    
    else if command == "remove" {
        if let i = shoppingList.firstIndex(of: item) {
            shoppingList.remove(at: i)
            print("removed \(item)")
        } else {
            print("item not found")
        }
    } else  if command == "exit"{
        print("exiting")
        isRunning = false
    } else {
        print("no command found")
    }
    
    
    print("Current Shopping List: \(shoppingList)")
    print(String(repeating: "-", count: 20))
}


//lab2 # 5
var sentence = "The quick, brown fox jumps over the lazy dog. I am lazy, the laziest in the world"
sentence = sentence.replacingOccurrences(of: ",", with: "")
sentence = sentence.replacingOccurrences(of: ".", with: "")
sentence = sentence.replacingOccurrences(of: "!", with: "")

// sentence = sentence.components(separatedBy: CharacterSet.punctuationCharacters).joined()


sentence = sentence.lowercased()

var dict: [String: Int] = [:]

for word in sentence.components(separatedBy: " ") {
    dict[word, default: 0] += 1
}

print(dict)


//lab2 # 6


func fibonacciNumber(_ n: Int) -> Int {
    if n == 0 {
        return 0
    } else if n == 1 {
        return 1
    }
    
    return fibonacciNumber(n - 1) + fibonacciNumber(n - 2)
}

func fibonacci(_ n: Int) -> [Int]{
    var result: [Int] = []
    if n < 0 {
        return result
    }
    
    for num in 0...n {
        result.append(fibonacciNumber(num))
    }
    
    return result
}



print(fibonacci(7))

// # 7


let studentScores: [String: Int] = [
    "Alisher": 90,
    "Alibek": 92,
    "Alina": 78,
    "Dias": 66,
    "Dastan": 95,
    "Dana": 88,
    "Salman": 40
]

var totalScore = 0
for score in studentScores.values {
    totalScore += score
}

let averageScore = Double(totalScore) / Double(studentScores.count)

let highestScore = studentScores.values.max() ?? 0
let lowestScore = studentScores.values.min() ?? 0


print(String(repeating: "-", count: 20))
print("Average score: \(averageScore)")
print("Highest score: \(highestScore)")
print("Lowest score: \(lowestScore)")
print(String(repeating: "-", count: 20))


for (name, score) in studentScores {
    if Double(score) >= averageScore {
        print("\(name): \(score) Above or equal to average")
    } else {
        print("\(name): \(score) Below average")
    }
    
}


// #8

func isPalindrome(_ text: String) -> Bool {
    let cleanText = text.lowercased().filter {$0.isLetter || $0.isNumber}
    let reversedText = String(cleanText.reversed())
    
    return cleanText == reversedText
    
}

print(isPalindrome("Racecar"))



// # 9
func calculator(_ num1: Double, _ operation: Character, _ num2: Double) -> Double {
    switch operation {
    case "+":
        return num1 + num2
    case "-":
        return num1 - num2
    case "*":
        return num1 * num2
    case "/":
        if num2 == 0 {
            print("деление на ноль невозможно")
            return 0.0
        }
        return num1 / num2
    default:
        print("неизвестная операция")
        return 0.0
    }
}

let result = calculator(10, "+", 7)
print("Результат: \(result)")



// # 10
func hasUniqueCharacters(_ text: String) -> Bool {
    var unique = Set(text)
    return text.count == unique.count
}

print(hasUniqueCharacters("abcA"))

