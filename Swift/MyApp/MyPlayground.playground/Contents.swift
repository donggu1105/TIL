import UIKit




class Color {
    
    let red, blue, green: Double
    
    
    convenience init(red: Double) {
        self.init(red: red, blue: 1.0, green: 1.0)
    }
    
    
    init(red: Double, blue: Double, green: Double) {
        self.red = red
        self.blue = blue
        self.green = green
    }
}

var c = Color(red: 2.0)

c.blue

