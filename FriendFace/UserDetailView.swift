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
            VStack (alignment: .leading) {
                Section {
                    Text("Bio")
                        .font(.title.bold())
                    Text(user.about)
                        .font(.headline)
                    Text("Email")
                        .font(.title2.bold())
                    Text(user.email)
                    Text("Company")
                        .font(.title2.bold())
                    Text(user.company)
                    Text("Address")
                        .font(.title2.bold())
                    Text(user.address)
                }
                .padding()
                
                Section {
                    NavigationLink {
                        FriendView()
                        
                    } label : {
                        HStack {
                            Image(systemName: "person.3.sequence.fill")
                            Text("Friends")
                        }
                        .padding()
                        
                    }
                }
            }
            
            
            
        }
        .navigationTitle(user.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct UserDetailView_Previews: PreviewProvider {
    
    static let user = User(id: "a9c659b8-979e-4603-a418-9f5286449fbb", isActive: true, name:  "Mclean Alford", age: 29, company: "Kiggle", email: "mcleanalford@kiggle.com", address: "312 Danforth Street, Elizaville, Vermont, 5877", about: "Ut ut dolore quis excepteur consequat adipisicing et sint nostrud velit consequat. In esse officia deserunt tempor. Pariatur in dolor aliqua aute exercitation est. Eiusmod et sit est reprehenderit consectetur sint aliquip ex officia irure veniam voluptate irure duis. Sit enim nulla ea elit aliquip laborum deserunt anim nisi eu.", registered:  "2018-02-24T10:33:01-00:00")

    static var previews: some View {
        UserDetailView(user: user)
    }
}
