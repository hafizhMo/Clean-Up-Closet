import SwiftUI

struct PrologScreen: View {
  @ObservedObject var viewModel = DialogViewModel()
  @State var isActive = false

  var body: some View {
    ZStack {
      VStack {
        Image(viewModel.image)
          .resizable()
          .frame(
            width: UIScreen.screenWidth * 0.5,
            height: UIScreen.screenWidth * 0.5
          )
          .scaledToFill()
          .clipped()
        Text(viewModel.imageSource)
          .multilineTextAlignment(.center)
          .foregroundColor(.black.opacity(0.7))
          .frame(maxWidth: UIScreen.screenWidth * 0.7)
      }

      VStack(alignment: viewModel.image == "" ? .center : .leading, spacing: 0) {
        Spacer()
        Image(viewModel.character)
        DialogBox(text: $viewModel.text)
      }

      if viewModel.showButton {
        DialogButton(text: viewModel.buttonText) {
          if viewModel.buttonText == "Start decluttering" {
            isActive.toggle()
          } else {
            Task { await viewModel.afterGathering()}
          }
        }.backgroundTransparant()
      }

    }
    .navigationLink(destination: DeclutteringScreen(), isActive: $isActive)
    .backgroundGradient()
    .onAppear {
      Task {
        await viewModel.startProlog()
      }
    }
  }
}
