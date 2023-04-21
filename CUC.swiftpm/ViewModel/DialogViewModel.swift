import Foundation

@MainActor
class DialogViewModel: ObservableObject {
    @Published var text = ""
    @Published var image = ""
    @Published var imageSource = ""
    @Published var character = ""
    @Published var showButton = false
    @Published var buttonText = ""
    
    private func tell(text: String, image: String, s: Double = 5) async {
        self.text = text
        self.character = image
        try? await Task.sleep(seconds: s)
    }
    
    func startProlog() async {
        await tell(text: "Hello, my name is Mo. Currently, I'm studying abroad and living in a dormitory.", image: "greeting-emoji")
        await tell(text: "I have difficulties in keeping my dorm tidy, especially with my clothes.", image: "worried-emoji")
        image = "mess_wardrobe"
        await tell(text: "My wardrobe is always messy because I rarely organize my clean clothes taken from the laundry neatly into the closet.", image: "meh-emoji", s: 7)
        await tell(text: "I've tried to keep my clean laundry organized in the closet, but it doesn't last long.", image: "dunno-emoji")
        image = ""
        imageSource = ""
        await tell(text: "And one day, I didn't have any clothes that were in the laundry,", image: "explaining-emoji")
        await tell(text: "and at that moment I realized that I had too many clothes.", image: "aha-emoji")
        await tell(text: "Now I know what I have to do first.", image: "greeting-emoji", s: 3)
        await tell(text: "First, let's gather all the clothes in one place.", image: "explaining-emoji", s: 3)
        buttonText = "Start gathering all clothes"
        showButton.toggle()
    }
    
    func afterGathering() async {
        showButton.toggle()
        image = "pile_of_clothes"
        await tell(text: "Now, see how tall the pile of clothes that I have is", image: "explaining-emoji")
        image = ""
        await tell(text: "So, next I need to declutter the clothes that will be kept and thrown away", image: "greeting-emoji")
        await tell(text: "And remember to only keep clothes that spark joy. (This is a famous phrase from Marie Kondo's decluttering method.)", image: "wispering-emoji")
        buttonText = "Start decluttering"
        showButton.toggle()
    }
    
    func congratulate() async {
        await tell(text: "Yay! We have finished sorting out all the clothes.", image: "greeting-emoji")
        await tell(text: "Before we start organizing the clothes in the closet, we need to get rid of the clothes that we have set aside first.", image: "explaining-emoji", s: 7)
        image = "donate_clothes"
        imageSource = "Photo by Annie Spratt on Unsplash"
        await tell(text: "For clothes that are still in good condition, it's better to give them to someone who needs them or donate them.", image: "aha-emoji")
        image = ""
        imageSource = ""
        await tell(text: "We should NOT just 'move' the items to a friend's or family member's house just because we feel attached to them. Otherwise, the items will just pile up in a different place.", image: "x-emoji", s: 9)
        await tell(text: "Lastly, let's fold and neatly organize the clothes that we want to keep.", image: "explaining-emoji")
        buttonText = "Start folding"
        showButton.toggle()
    }
    
    func closing() async {
        await tell(text: "Now that all the clothes have been folded, it's time to arrange them inside the closet.", image: "aha-emoji")
        await tell(text: "Group the clothes by type, and then also group them by color.", image: "explaining-emoji")
        await tell(text: "Don't forget to make use of unused boxes to store socks, underwear, and many more.", image: "greeting-emoji")
        await tell(text: "Yay, done! Now my wardrobe looks neat and tidy.", image: "appreciate-emoji", s: 2)
        showButton.toggle()
    }
}
