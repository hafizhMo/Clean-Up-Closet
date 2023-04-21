import SwiftUI

struct DialogBox: View {
  
  @Binding var text: String
  
    var body: some View {
      VStack {
        Text(text)
          .font(.system(size: 20))
          .padding()
      }
      .frame(
        minWidth: 0,
        maxWidth: .infinity,
        minHeight: 125,
        alignment: .topLeading
      )
      .background(Color.lightBlue)
    }
}
