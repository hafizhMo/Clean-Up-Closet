import SwiftUI

struct TypeCard: View {
    var image: String
    var text: ClothType
    var onClick: ((ClothType) -> Void)
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.white.opacity(0.9))
                .frame(
                    width: UIScreen.screenWidth * 0.3,
                    height: (UIScreen.screenWidth * 0.3) + 80
                )
                .cornerRadius(8)
                .shadow(radius: 8)
            
            VStack {
                Image(image)
                    .resizable()
                    .scaledToFill()
                    .frame(
                        width: (UIScreen.screenWidth * 0.3) - 20,
                        height: (UIScreen.screenWidth * 0.3) + 20
                    )
                    .clipped()
                Text(text.rawValue)
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.black)
            }
            
        }.onTapGesture {
            onClick(text)
        }
    }
}
