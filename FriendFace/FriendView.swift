//
//  FriendView.swift
//  FriendFace
//
//  Created by Eugene on 04/09/2023.
//

import SwiftUI

struct FriendView: View {
    
    var friends: [Friend]
    
    var body: some View {
        List {
            ForEach(friends) { friend in
                Text(friend.name)
            }
            .navigationTitle("Friends")
            
        }
        .scrollContentBackground(.hidden)
        .background(
            LinearGradient(colors: [Color.red, Color.yellow], startPoint: .top, endPoint: .bottom)
        )
        
    }
}

struct FriendView_Previews: PreviewProvider {
    static var previews: some View {
        FriendView(friends: [
            Friend(id: "19ea3704-c0f6-41d5-a08f-00a09e1da82a", name: "Rhodes Carr"),
            Friend(id: "22934d37-6bbd-4023-b99b-88819eeee0da", name: "Joanna Hurst"),
            Friend(id: "63caacb0-7312-41ca-ad9b-33cb93e6c85d", name: "Kristine Kinney"),
            Friend(id: "1744a058-d78a-414f-ab8b-8b02432703d7",name: "Manning Richard"),
            Friend(id: "4d15d138-f3c4-460e-a03f-e1235f2df62b",name: "Tucker Alexander"),
            Friend(id:"d8cc81db-9e4a-4ac1-afba-d287f5142cb6",name: "Tammie Prince")
        ])
    }
}
