import Foundation

struct Quote: Identifiable, Decodable {
    var id: String { _id }
    let _id: String
    let word: String
}
