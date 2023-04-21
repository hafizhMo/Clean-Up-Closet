import SwiftUI

struct DeclutteringScreen: View {
    @StateObject var viewModel = DeclutteringViewModel()
    @State var isShow = false
    
    var body: some View {
        VStack(spacing: 0) {
            Text("Swipe left to discard and right to keep.")
                .font(.system(size: 32, weight: .bold))
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)
                .padding(.top, 50)
            Text("Look at the description below to determine if the clothes spark joy 👇")
                .font(.system(size: 20))
                .foregroundColor(.black)
                .padding(.bottom, 50)
            ZStack {
                ForEach(Array(viewModel.clothes.enumerated()), id: \.offset) { index, cloth in
                    ClothCard(viewModel: viewModel, cloth: cloth)
                        .padding(.top, 5 + CGFloat((index * 10)) )
                }
            }
            Spacer()
            CustomDivider()
            HStack(alignment: .center) {
                Image(viewModel.clothes[viewModel.index].emoji)
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: UIScreen.screenWidth * 0.2, maxHeight: UIScreen.screenHeight * 0.1)
                    .padding(30)
                Text(viewModel.clothes[viewModel.index].description)
                    .font(.system(size: 20, weight: .semibold))
                    .padding(.trailing, 20)
                Spacer()
            }
            .background(Color.lightBlue)
        }
        .onAppear {
            viewModel.generateClothes()
        }
        .toast(message: viewModel.toastText, isShowing: $viewModel.isShowToast, duration: Toast.short)
        .backgroundGradient()
        .navigationLink(destination: PreFoldScreen(), isActive: $viewModel.isActive)
        .navigationBarHidden(true)
    }
}
