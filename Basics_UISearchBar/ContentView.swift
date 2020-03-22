import SwiftUI

struct User: Hashable {
    let name: String
}

struct ContentView: View {
    private let users = [User(name: "Alberto"), User(name: "Diana"), User(name: "Laura"), User(name: "Sergio"),
                         User(name: "Alco"), User(name: "Puente"), User(name: "Joan"), User(name: "Angel")]
    @State var searchText: String = ""
    
    var body: some View {
        VStack {
            SearchBar(text: $searchText)
            List {
                ForEach(getSearchByName(), id: \.self) { user in
                    Text(user.name)
                }
            }
        }
    }
    
    private func getSearchByName() -> [User] {
        guard !searchText.isEmpty else { return users }
        return users.filter { $0.name.containsCaseInsensitive(searchText) }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
