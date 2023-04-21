import Foundation

@MainActor
class DeclutteringViewModel: ObservableObject {
  @Published var text = ""
  @Published var image = ""
  @Published var clothes: [Cloth] = [Cloth(description: "test", image: "cloth1")]
  @Published var index = 0
  @Published var isActive = false
  @Published var isShowToast = false
  @Published var toastText = ""

  private func tell(text: String, image: String, s: Double = 5) async {
    self.text = text
    self.image = image
    try? await Task.sleep(seconds: s)
  }

  func generateClothes() {
    let clothes_default = [
      Cloth(description: "Wow, this is my favorite hoodie. It's comfortable to wear because it's oversized.", image: "7_cloth", mustKeep: true, warningText: "This cloth spark joy so much.", emoji: "love-emoji"),
      Cloth(description: "This is my Entrepreneurship team shirt from college, I love the design.", image: "1_cloth"),
      Cloth(description: "This shirt is almost too small for me to wear.", image: "5_cloth", mustDiscard: true, warningText: "This shirt doesn't fit anymore.", emoji: "sad-emoji"),
      Cloth(description: "This is my favorite shirt, grey is the coolest color.", image: "6_cloth", mustKeep: true, warningText: "I really like the color.", emoji: "love-emoji"),
      Cloth(description: "This shirt used to belong to my older sibling, But it's too big.", image: "2_cloth"),
      Cloth(description: "Wow, this shirt is nice, but unfortunately the back part has a hole.", image: "4_cloth", mustDiscard: true, warningText: "This shirt is already damaged.", emoji: "sad-emoji"),
      Cloth(description: "This is my high school soccer club shirt, and I rarely wear it now.", image: "3_cloth")
    ].shuffled()
    clothes = clothes_default
    index = clothes.count - 1
  }
  
  func updateIndex() {
    if index > 0 {
      index -= 1
      return
    }
    
    isActive.toggle()
  }
  
  func showToast(text: String) {
    isShowToast.toggle()
    toastText = text
  }
}

struct Cloth {
  var description: String
  var image: String
  var mustKeep: Bool = false
  var mustDiscard: Bool = false
  var warningText: String?
  var emoji: String = "hmm-emoji"
}
