import Foundation
import SwiftUI


struct MyDefaultBtnSytle: ButtonStyle {
    
    var bgColor: Color = Color.blue
    var textColor: Color = Color.white
    
    init(bgColor: Color = Color.blue, textColor: Color = Color.white) {
        self.bgColor = bgColor
        self.textColor = textColor
    }
    
    
  func makeBody(configuration: Configuration) -> some View {
    Button(action: {}, label: {
      HStack {
        Spacer()
        configuration.label
              .lineLimit(2)
              .minimumScaleFactor(0.7)
              .foregroundColor(textColor)
        Spacer()
      }
    })
    // 👇🏻 makes all taps go to the original button
    .allowsHitTesting(false)
    .padding()
    .background(bgColor.cornerRadius(8))
    .scaleEffect(configuration.isPressed ? 0.95 : 1)
  }
}
