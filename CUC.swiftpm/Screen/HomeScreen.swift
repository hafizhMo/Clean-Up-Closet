import SwiftUI

struct HomeScreen: View {
    @State var isActive = false
    
    var body: some View {
        VStack {
            Text("Clean Up Closet")
                .font(.system(size: 32, weight: .bold))
                .foregroundColor(.black)
                .textCase(.uppercase)
            
            Text("Organizing your clothes")
                .foregroundColor(.black)
                .font(.system(size: 20))
                .padding(.bottom, 80)
            
            DialogButton(text: "Start", width: 200) {
                isActive.toggle()
            }
            
        }
        .navigationLink(destination: PrologScreen(), isActive: $isActive)
        .backgroundGradient()
    }
}
