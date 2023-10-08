//
//  MoyaProvider.swift
//  TestApi
//
//  Created by 朱洪苇 on 2023/10/2.
//

import Foundation
import Moya

class NetworkManager {
    static let shared = NetworkManager()
    private let provider = MoyaProvider<MyAPI>()

    private init() {}

    func fetchQuotes(completion: @escaping ([Quote]?) -> Void) {
        provider.request(.getQuotes) { result in
            switch result {
            case let .success(response):
                do {
                    let quotesResponse = try response.map(QuotesResponse.self)
                    completion(quotesResponse.data)
                } catch {
                    print("Failed to decode response: \(error)")
                    completion(nil)
                }

            case let .failure(error):
                print("Network request failed: \(error)")
                completion(nil)
            }
        }
    }
}
