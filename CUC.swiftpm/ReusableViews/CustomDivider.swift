import SwiftUI

struct CustomDivider: View {
  var color: Color?
  var width: CGFloat?
  
  var body: some View {
    Rectangle()
      .fill(color ?? .black)
      .frame(height: width ?? 4.0)
      .edgesIgnoringSafeArea(.horizontal)
  }
}
