import SwiftUI

struct PreFoldScreen: View {
    @State var type: ClothType = .tshirt
    @State var isActive = false
    @State var isActive2 = false
    @State var isFolded = false
    
    var body: some View {
        VStack {
            Text("Here are the folding techniques for several types of clothing:")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)
                .padding(.bottom, 50)
            
            HStack {
                TypeCard(image: "tshirt_fold_1", text: .tshirt) { cloth in
                    type = cloth
                    isActive.toggle()
                    isFolded = true
                }
                TypeCard(image: "long_fold_1", text: .long_sleeved) { cloth in
                    type = cloth
                    isActive.toggle()
                    isFolded = true
                }
                TypeCard(image: "pants_fold_1", text: .pants) { cloth in
                    type = cloth
                    isActive.toggle()
                    isFolded = true
                }
            }
            .padding(.bottom, 50)
            
            if isFolded {
                DialogButton(text: "Start organizing", width: 200) {
                    isActive2.toggle()
                }
            }
        }
        .navigationLink(destination: FoldScreen(type: type), isActive: $isActive)
        .navigationLink(destination: ClosingScreen(), isActive: $isActive2)
        .backgroundGradient()
    }
}
