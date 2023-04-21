import SwiftUI

struct ClosingScreen: View {
  @ObservedObject var viewModel = DialogViewModel()
  @State var isActiveRestart = false
  @State var isActiveAbout = false

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
        VStack(spacing: 20) {
          DialogButton(text: "Restart") {
            isActiveRestart.toggle()
          }
          DialogButton(text: "Summary") {
            isActiveAbout.toggle()
          }
        }
      }

    }
    .navigationLink(destination: PrologScreen(), isActive: $isActiveRestart)
    .sheet(isPresented: $isActiveAbout, content: {
      SummaryScreen()
    })
    .backgroundGradient()
    .onAppear {
      Task {
        await viewModel.closing()
      }
    }
  }
}
