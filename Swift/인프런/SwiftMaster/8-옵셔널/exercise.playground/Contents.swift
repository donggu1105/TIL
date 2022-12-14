import UIKit



var number: Int? = 7
var hello: String? = "안녕하세요"
var name: String? = "홍길동"
var newNum: Double? = 5.5


print(number)
print(hello)
print(name)
print(newNum)


if let num = number {
    print(num)
}

if let hi = hello {
    print(hi)
}

if let n = name {
    print(n)
}

if let num = newNum {
    print(num)
}



// guard let 바인딩 연습 =================


func doPrint(say: String?) {
    guard let hi = say else { return }
    print(hi)
}


doPrint(say: hello)





