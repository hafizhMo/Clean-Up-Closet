import SwiftUI

struct AboutScreen: View {
    var body: some View {
        VStack {
            Text("About KonMari Method")
                .font(.system(size: 24, weight: .semibold))
                .foregroundColor(.black)
                .padding(.bottom, 8)
            Text("The KonMari method is a popular approach to tidying up and organizing various aspects of one's life, including one's home, possessions, and daily routine. The method was developed by Marie Kondo, a Japanese organizing consultant and author.")
                .font(.system(size: 20))
                .foregroundColor(.black)
                .padding(.bottom, 1)
            Text("Here is a summary of the KonMari method:")
                .font(.system(size: 20))
                .foregroundColor(.black)
                .frame(maxWidth: .infinity, alignment: .leading)
            AboutList(index: 1, text: "Visualize your ideal lifestyle ✨", subtext: "Begin by visualizing your ideal lifestyle and the type of home and possessions that would bring you joy and fulfillment.")
            AboutList(index: 2, text: "Tidy by category, not location 🧺", subtext: "Tidy up your belongings by category, rather than by location, starting with clothes, then moving on to books, papers, miscellaneous items, and sentimental items.")
            AboutList(index: 3, text: "Discard before organizing 🗑", subtext: "Before organizing, discard items that no longer bring you joy or serve a purpose in your life. Thank them for their service and let them go.")
            AboutList(index: 4, text: "Keep only what sparks joy ❤️", subtext: "Keep only the items that spark joy when you hold them or use them. This helps you surround yourself with items that make you happy and that you truly value.")
            AboutList(index: 5, text: "Organize your space 🏠", subtext: "Organize the items you have decided to keep in a way that is both functional and visually pleasing, using storage solutions that work for you.")
            AboutList(index: 6, text: "Maintain your space 🏗", subtext: "Once you have completed the tidying process, maintain your space by putting things back in their designated spots and continuing to regularly discard items that no longer spark joy.")
        }
        .padding(30)
        .backgroundGradient()
    }
}

struct SummaryScreen: View {
    @State var isActive = false
    var body: some View {
        VStack {
            Text("Summary of the KonMari method for tidying up clothes")
                .font(.system(size: 24, weight: .semibold))
                .foregroundColor(.black)
                .padding(.bottom, 8)
            AboutList(index: 1, text: "Gather all your clothes in one place", subtext: "Start by collecting all your clothes from every corner of your home and pile them up in one place.")
            AboutList(index: 2, text: "Sort clothes by category", subtext: "Sort your clothes into categories such as tops, bottoms, dresses, outerwear, and accessories.")
            AboutList(index: 3, text: "Take each item in your hands", subtext: "Pick up each item of clothing and hold it in your hands. Ask yourself if it sparks joy. If it does, keep it. If not, thank it for its service and let it go.")
            AboutList(index: 4, text: "Discard unwanted items", subtext: "Discard the items that no longer bring you joy. Donate or sell items that are still in good condition, and recycle or dispose of items that are worn out.")
            AboutList(index: 5, text: "Fold clothes neatly", subtext: "Marie Kondo has a unique method of folding clothes that maximizes storage space and helps keep clothes wrinkle-free. Fold clothes into a rectangular shape and then into a small square.")
            AboutList(index: 6, text: "Store clothes vertically", subtext: "Store clothes vertically in drawers or on shelves so that you can see all your clothes at a glance.")
                .padding(.bottom, 20)
            DialogButton(text: "About KonMari Method", width: 250) {
                isActive.toggle()
            }
        }
        .padding(30)
        .backgroundGradient()
        .sheet(isPresented: $isActive) {
            AboutScreen()
        }
    }
}

struct AboutList: View {
    var index: Int
    var text: String
    var subtext: String
    
    var body: some View {
        HStack(alignment: .top) {
            Text("\(index).")
                .font(.system(size: 20, weight: .semibold))
                .foregroundColor(.black.opacity(0.7))
            VStack(alignment: .leading) {
                Text(text)
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.black)
                    .padding(.bottom, 1)
                Text(subtext)
                    .font(.system(size: 20))
                    .foregroundColor(.black)
            }
            Spacer()
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}
