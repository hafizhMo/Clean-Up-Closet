import Foundation

class FoldViewModel: ObservableObject {
  @Published var steps: [Step] = [Step(image: "", desc: "")]
  @Published var index = 0
  @Published var isShow = false
  
  func generateStep(type: ClothType) {
    switch type {
    case .tshirt:
      steps = [
        Step(image: "tshirt_fold_1", desc: "Fold one side of the garment across the center"),
        Step(image: "tshirt_fold_2", desc: "Fold the opposite side the same way, creating a rectangle"),
        Step(image: "tshirt_fold_3", desc: "Fold the rectangle in half lengthwise"),
        Step(image: "tshirt_fold_4", desc: "Fold this in half or in thirds"),
        Step(image: "tshirt_fold_5", desc: "Stand it upright")
      ]
    case .long_sleeved:
      steps = [
        Step(image: "long_fold_1", desc: "Fold one side toward the center"),
        Step(image: "long_fold_2", desc: "Fold the sleeve to fit within the rectangle's width"),
        Step(image: "long_fold_3", desc: "Fold the sleeve back flush with the edge of rectangle"),
        Step(image: "long_fold_4", desc: "Fold the other side the same way"),
        Step(image: "long_fold_5", desc: "Fold this in half or in thirds"),
        Step(image: "long_fold_6", desc: "Stand it upright")
      ]
    case .pants:
      steps = [
        Step(image: "pants_fold_1", desc: "Fold this in third"),
        Step(image: "pants_fold_2", desc: "Fold the other third on top"),
        Step(image: "pants_fold_3", desc: "Fold this in half"),
        Step(image: "pants_fold_4", desc: "Stand it upright")
      ]
    }
  }

  func nextStep() {
    if index < steps.count-1 {
      index += 1
      return
    }
    isShow = true
  }
}

struct Step {
  var image: String
  var desc: String
}

enum ClothType: String {
  case tshirt = "T-Shirt"
  case long_sleeved = "Long-Sleeved Tops"
  case pants = "Pants"
}
