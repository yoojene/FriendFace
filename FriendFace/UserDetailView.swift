//
//  UserDetailView.swift
//  FriendFace
//
//  Created by Eugene on 04/09/2023.
//

import SwiftUI



struct UserDetailView: View {
    
    var user: CachedUser
    
    var body: some View {
        ScrollView {
            VStack (alignment: .leading, spacing: 0) {
                Section {
                    Text("Bio")
                        .font(.title.bold())
                    Text(user.wrappedAbout)
                        .textCardStyle()
                        
                    Text("Email")
                        .font(.title2.bold())
                    Text(user.wrappedEmail)
                        .textCardStyle()
                    
                    Text("Date Registered")
                        .font(.title2.bold())
                    Text(user.formattedRegisteredDate)
                        .textCardStyle()
                    
                    Text("Company")
                        .font(.title2.bold())
                    Text(user.wrappedCompany)
                        .textCardStyle()
                    
                    Text("Address")
                        .font(.title2.bold())
                    Text(user.wrappedAddress)
                        .textCardStyle()
                }
                .padding()
                
                Section {
                    NavigationLink {
                        FriendView(friends: user.friendArray)
                        
                    } label : {
                        HStack {
                            Image(systemName: "person.3.sequence.fill")
                            Text("Friends")
                        }
                        .toolbar {
                            ToolbarItem(placement: .principal) {
                                HStack {
                                    Text(user.wrappedName)
                                    Image(systemName: user.isActive ? "person.fill" : "person.fill.xmark")
                                }
                                
                            }
                        }
                        .padding()
                        
                    }
                }
            }.onAppear {
                print(user)
            }
            
            
            
        }
        .navigationTitle(user.wrappedName)
        .navigationBarTitleDisplayMode(.inline)
        .background(
            LinearGradient(colors: [Color.red, Color.orange], startPoint: .top, endPoint: .bottom)
        )
    }
}

