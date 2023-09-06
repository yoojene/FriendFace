//
//  ContentView.swift
//  FriendFace
//
//  Created by Eugene on 04/09/2023.
//

import SwiftUI

    
struct ContentView: View {
    
    @Environment(\.managedObjectContext) var moc
//    @State private var users: [User] = []
    
    @FetchRequest(sortDescriptors: []) var users: FetchedResults<CachedUser>
    
    
        
    var body: some View {
        NavigationView {
                List  {
                    ForEach(users) { user in
                        NavigationLink {
//                            UserDetailView(user: user)
                        } label: {
                            HStack (alignment: .center) {
                                Text(user.wrappedName)
                                Spacer()
                                if user.isActive {
                                    Image(systemName: "person.fill").padding(.trailing, 7)
                                } else {
                                    Image(systemName: "person.fill.xmark").foregroundColor(.red)
                                }
                            
                            }
                            .listRowBackground(Color.red)
                            
                        }
                    }

                }
         
                .scrollContentBackground(.hidden)
                .background(
                    LinearGradient(colors: [Color.red, Color.yellow], startPoint: .top, endPoint: .bottom)
                )
                .navigationTitle("FriendFace")
    
                
        }.onAppear {
            Task {
                await getUsers()
            }
        }
    }
    
    
    func getUsers() async {
        
        let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            // handle it
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            let decodedUsers = try decoder.decode(Array<User>.self, from: data)
            
            if users.isEmpty {
                for user in decodedUsers {
                    let cachedUser = CachedUser(context: moc)
                    cachedUser.id = user.id
                    cachedUser.name = user.name
                    cachedUser.isActive = user.isActive
                    cachedUser.age = user.age
                    cachedUser.company = user.company
                    cachedUser.email = user.email
                    cachedUser.about = user.about
                    cachedUser.registered = user.registered
                    
                }
                try? moc.save()
            }
        
          } catch {
            print(error)
            print("There was a error downloading")

            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
