import SwiftUI

struct FoldScreen: View {
    var type: ClothType
    @ObservedObject var viewModel = FoldViewModel()
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        ZStack {
            
            VStack {
                Text("\(viewModel.index + 1)")
                    .font(.system(size: 32))
                    .padding()
                    .background(Circle().foregroundColor(.lightBlue))
                Text(viewModel.steps[viewModel.index].desc)
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.bottom, 50)
                
                Image(viewModel.steps[viewModel.index].image)
                    .resizable()
                    .scaledToFill()
                    .frame(
                        width: (UIScreen.screenWidth * 0.5) - 20,
                        height: (UIScreen.screenWidth * 0.5) + 20
                    )
                    .clipped()
                    .onTapGesture {
                        viewModel.nextStep()
                    }
                
                Text("Tap the image to see the next step")
                    .foregroundColor(.black.opacity(0.9))
            }
            
            if viewModel.isShow {
                DialogButton(text: "Back") {
                    self.mode.wrappedValue.dismiss()
                }.backgroundTransparant()
            }
        }
        .backgroundGradient()
        .onAppear {
            viewModel.generateStep(type: type)
        }
    }
}
