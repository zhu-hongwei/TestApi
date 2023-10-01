import Foundation

struct Quote: Codable {
    let _id: String
    let word: String
}

struct QuotesResponse: Codable {
    let code: Int
    let msg: String
    let duration: String
    let data: [Quote]
    let length: Int
}
