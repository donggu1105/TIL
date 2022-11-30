import UIKit



class Person {
    var birth: Int = 0
    
    var age: Int {
        return 2021 - birth
    }

//    func getAge() -> Int {
//        return 2021 - birth
//    }
//
//    func setAge(_ age: Int) {
//        self.birth = 2021 - age
//    }
}




var p1 = Person()
p1.birth = 2000
p1.age         // get


//p1.age = 20    // set
p1.birth




//p1.birth
//
//
//var p2 = Person()
//p2.setAge(11)
//p2.birth


