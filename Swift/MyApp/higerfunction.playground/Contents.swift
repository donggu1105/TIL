import UIKit

let numbers = [1,2,3,4,5]


let numbers2 = numbers.map { num in return num + 3 }
let numbers3 = numbers.map { num in return "숫자 : \(num)"}

print(numbers2)
print(numbers3)

let numbers4 = numbers.map {num in return "wassup"}

print(numbers4)

let numbers5 = numbers.map {num in return "what"}

print(numbers5)


let newNumber = numbers.map { "숫자 : \($0)"}

print(newNumber)
