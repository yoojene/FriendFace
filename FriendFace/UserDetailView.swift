//
//  UserDetailView.swift
//  FriendFace
//
//  Created by Eugene on 04/09/2023.
//

import SwiftUI



struct UserDetailView: View {
    
    var user: User
    
    var body: some View {
        ScrollView {
            VStack (alignment: .leading, spacing: 0) {
                Section {
                    Text("Bio")
                        .font(.title.bold())
                    Text(user.about)
                        .textCardStyle()
                        
                    Text("Email")
                        .font(.title2.bold())
                    Text(user.email)
                        .textCardStyle()
                    
                    Text("Date Registered")
                        .font(.title2.bold())
                    Text(user.formattedRegisteredDate)
                        .textCardStyle()
                    
                    Text("Company")
                        .font(.title2.bold())
                    Text(user.company)
                        .textCardStyle()
                    
                    Text("Address")
                        .font(.title2.bold())
                    Text(user.address)
                        .textCardStyle()
                }
                .padding()
                
                Section {
                    NavigationLink {
                        FriendView(friends: user.friends)
                        
                    } label : {
                        HStack {
                            Image(systemName: "person.3.sequence.fill")
                            Text("Friends")
                        }
                        .toolbar {
                            ToolbarItem(placement: .principal) {
                                HStack {
                                    Text(user.name)
                                    Image(systemName: user.isActive ? "person.fill" : "person.fill.xmark")
                                }
                                
                            }
                        }
                        .padding()
                        
                    }
                }
            }
            
            
            
        }
        .navigationTitle(user.name)
        .navigationBarTitleDisplayMode(.inline)
        .background(
            LinearGradient(colors: [Color.red, Color.orange], startPoint: .top, endPoint: .bottom)
        )
    }
}

struct UserDetailView_Previews: PreviewProvider {
    
    static let user = User(id: "a9c659b8-979e-4603-a418-9f5286449fbb", isActive: true, name:  "Mclean Alford", age: 29, company: "Kiggle", email: "mcleanalford@kiggle.com", address: "312 Danforth Street, Elizaville, Vermont, 5877", about: "Ut ut dolore quis excepteur consequat adipisicing et sint nostrud velit consequat. In esse officia deserunt tempor. Pariatur in dolor aliqua aute exercitation est. Eiusmod et sit est reprehenderit consectetur sint aliquip ex officia irure veniam voluptate irure duis. Sit enim nulla ea elit aliquip laborum deserunt anim nisi eu.", registered: Date.now, friends: [
        Friend(id: "19ea3704-c0f6-41d5-a08f-00a09e1da82a", name: "Rhodes Carr"),
        Friend(id: "22934d37-6bbd-4023-b99b-88819eeee0da", name: "Joanna Hurst"),
        Friend(id: "63caacb0-7312-41ca-ad9b-33cb93e6c85d", name: "Kristine Kinney"),
        Friend(id: "1744a058-d78a-414f-ab8b-8b02432703d7",name: "Manning Richard"),
        Friend(id: "4d15d138-f3c4-460e-a03f-e1235f2df62b",name: "Tucker Alexander"),
        Friend(id:"d8cc81db-9e4a-4ac1-afba-d287f5142cb6",name: "Tammie Prince")
    ])

    static var previews: some View {
        UserDetailView(user: user)
    }
}

