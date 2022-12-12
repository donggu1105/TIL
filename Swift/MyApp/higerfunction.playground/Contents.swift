import UIKit


let array = [1,2,3,4,5,6,7,8,9,10]


let array2 = array.reduce(0) { a, b in
    return a + b
}

print(type(of: array2))



let array3 = array.filter {return $0 % 2 == 1}.map {return $0 * $0}.reduce(0) { a, b in
    return a + b
}

print(array3)

let immutableArray = [1,2,3,4,5]


immutableArray.forEach { num in
    print(num)
}


let stringArray: [String?] = ["A",nil, "B"]

let stringArray2: [String] = stringArray.compactMap {$0}
print(stringArray2)
