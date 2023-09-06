//
//  FriendView.swift
//  FriendFace
//
//  Created by Eugene on 04/09/2023.
//

import SwiftUI

struct FriendView: View {
    
    var friends: [CachedFriend]
    
    var body: some View {
        List {
            ForEach(friends) { friend in
                Text(friend.wrappedName)
            }
            .navigationTitle("Friends")
            
        }
        .scrollContentBackground(.hidden)
        .background(
            LinearGradient(colors: [Color.red, Color.yellow], startPoint: .top, endPoint: .bottom)
        )
        
    }
}
