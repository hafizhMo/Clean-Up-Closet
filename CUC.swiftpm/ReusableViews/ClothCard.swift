import SwiftUI

struct ClothCard: View {
  @ObservedObject var viewModel: DeclutteringViewModel
  @State private var offset = CGSize.zero
  @State private var color: Color = .white
  var cloth: Cloth
  
  var body: some View {
    ZStack {
      Rectangle()
        .foregroundColor(color.opacity(0.9))
        .frame(
          width: UIScreen.screenHeight * 0.5,
          height: UIScreen.screenHeight * 0.5
        )
        .cornerRadius(8)
        .shadow(radius: 8)

      Image(cloth.image)
        .resizable()
        .scaledToFill()
        .frame(
          width: (UIScreen.screenHeight * 0.5) - 20,
          height: (UIScreen.screenHeight * 0.5) - 20
        )
        .clipped()
        .padding(20)

    }
    .offset(x: offset.width * 1.5, y: offset.height * 0.4)
    .rotationEffect(.degrees(Double(offset.width / 40)))
    .gesture(
      DragGesture()
        .onChanged({ gesture in
          offset = gesture.translation
          withAnimation {
            changeColor(width: offset.width)
          }
        })
        .onEnded({ _ in
          withAnimation {
            swipeCard(width: offset.width)
            changeColor(width: offset.width)
          }
        })
    )
  }
  
  func swipeCard(width: CGFloat) {
    switch width {
    case -500...(-150):
      if cloth.mustKeep {
        viewModel.showToast(text: cloth.warningText!)
        offset = CGSize.zero
        return
      }
      viewModel.updateIndex()
      offset = CGSize(width: -500, height: 0)
    case 150...500:
      if cloth.mustDiscard {
        viewModel.showToast(text: cloth.warningText!)
        offset = CGSize.zero
        return
      }
      viewModel.updateIndex()
      offset = CGSize(width: 500, height: 0)
    default:
      offset = .zero
    }
  }
  
  func changeColor(width: CGFloat) {
    switch width {
    case -500...(-130):
      color = .red
    case 130...500:
      color = .green
    default:
      color = .white
    }
  }
}
