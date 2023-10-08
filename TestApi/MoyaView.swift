//
//  MoyaView.swift
//  TestApi
//
//  Created by 朱洪苇 on 2023/10/2.
//

import SwiftUI
import Moya
let provider = MoyaProvider<MyAPI>()

struct MoyaView: View {
    @State private var quotes: [Quote] = []

     var body: some View {
         NavigationView {
             List(quotes) { quote in
                 Text(quote.word)
             }
             .navigationBarTitle("Quotes")
             .onAppear {
                 fetchQuotes()
             }
         }
     }

     func fetchQuotes() {
         NetworkManager.shared.fetchQuotes { fetchedQuotes in
             if let fetchedQuotes = fetchedQuotes {
                 self.quotes = fetchedQuotes
             }
         }
     }
}

struct MoyaView_Previews: PreviewProvider {
    static var previews: some View {
        MoyaView()
    }
}
