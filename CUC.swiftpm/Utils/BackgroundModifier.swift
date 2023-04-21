import SwiftUI

struct ImageBackgroundModifier: ViewModifier {
  
  func body(content: Content) -> some View {
    content
      .frame(
        minWidth: 0,
        maxWidth: .infinity,
        minHeight: 0,
        maxHeight: .infinity
      )
      .background(
        Image("background")
          .resizable()
          .aspectRatio(contentMode: .fill)
          .edgesIgnoringSafeArea(.all)
      )
      .navigationBarHidden(true)
  }
}

struct ColorBackgroundModifier: ViewModifier {
  var color = Color.black.opacity(0.5)
  
  func body(content: Content) -> some View {
    content
      .frame(
        minWidth: 0,
        maxWidth: .infinity,
        minHeight: 0,
        maxHeight: .infinity
      )
      .background(color)
  }
}

extension View {
  func backgroundGradient() -> some View {
    modifier(ImageBackgroundModifier())
  }

  func backgroundTransparant() -> some View {
    modifier(ColorBackgroundModifier())
  }
}
