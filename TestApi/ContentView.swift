import SwiftUI

struct ContentView: View {
    @State private var quotes: [Quote] = []
     
     var body: some View {
         VStack {
             List(quotes, id: \._id) { quote in
                 Text(quote.word)
                     .lineLimit(1)
             }
             .onAppear {
                 fetchQuotes()
             }
         }
     }
     
     func fetchQuotes() {
         guard let url = URL(string: "https://172.245.154.103:3000/xinyu") else {
             return
         }
         URLSession.shared.dataTask(with: url) { data, response, error in
             if let data = data {
                 if let decodedResponse = try? JSONDecoder().decode(QuotesResponse.self, from: data) {
                     DispatchQueue.main.async {
                         self.quotes = decodedResponse.data
                     }
                     return
                 }
             }
             print("Failed to fetch quotes")
         }
         .resume()
     }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
