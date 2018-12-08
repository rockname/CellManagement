import Foundation

struct Task {
    let id: Int
    let name: String
    let category: Category
}

enum Category: String, CaseIterable {
    case personal, shopping, work
}
