//
//  ContentView.swift
//  FriendFace
//
//  Created by Eugene on 04/09/2023.
//

import SwiftUI

    
struct ContentView: View {
    
    @State private var users: [User] = []
    
        
    var body: some View {
        NavigationView {
            List  {
                ForEach(users) { user in
                    NavigationLink {
                        UserDetailView(user: user)
                    } label: {
                        HStack (alignment: .center) {
                            Text(user.name)
                            Spacer()
                            if user.isActive {
                                Image(systemName: "person.fill").padding(.trailing, 7)
                            } else {
                                Image(systemName: "person.fill.xmark")
                            }
                        
                        }
                        
                    }
                }

            }
            .navigationTitle("Friend Face")
                
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
                users = decodedUsers

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
