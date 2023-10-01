import SwiftUI

struct ContentView: View {
    @State private var quotes: [Quote] = []

     var body: some View {
         NavigationView {
             List(quotes) { quote in
                 Text(quote.word)
                     .lineLimit(1)
             }
             .navigationTitle("Quotes")
             .onAppear {
                 fetchData()
             }
         }
     }
    
    struct ResponseData: Decodable {
        let data: [Quote]
    }
     
    func fetchData() {
        guard let url = URL(string: "https://172.245.154.103:3000/xinyu") else {
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }

            if let data = data {
                do {
                    let decodedData = try JSONDecoder().decode(ResponseData.self, from: data)
                    DispatchQueue.main.async {
                        self.quotes = decodedData.data
                    }
                } catch {
                    print("Error decoding JSON: \(error.localizedDescription)")
                }
            }
        }.resume()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
