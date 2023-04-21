import SwiftUI

struct DialogButton: View {
  var text: String
  var width = UIScreen.screenWidth * 0.9
  
  var onClick: (() -> Void)
  
  var body: some View {
    Button {
      onClick()
    } label: {
      Text(text)
        .font(.system(size: 20, weight: .semibold))
        .foregroundColor(.white)
        .padding(.vertical, 20)
        .frame(minWidth: width)
        .background(
          HStack(spacing: 0) {
            LinearGradient(gradient: Gradient(colors: [.lightBlue, .darkBlue]), startPoint: .leading, endPoint: .trailing)
            LinearGradient(gradient: Gradient(colors: [.lightBlue, .darkBlue]), startPoint: .trailing, endPoint: .leading)
          }
        )
    }
  }
}

struct DialogButton_Previews: PreviewProvider {
  static var previews: some View {
    DialogButton(text: "Button") {
      
    }
  }
}
