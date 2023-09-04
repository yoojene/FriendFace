//
//  User.swift
//  FriendFace
//
//  Created by Eugene on 04/09/2023.
//

import SwiftUI

struct User: Codable, Identifiable {
    
    let id: String
    let isActive: Bool
    let name: String
    let age: Int
    let company: String
    let email: String
    let address: String
    let about: String
    let registered: Date
    let friends: Array<Friend>
    
    var formattedRegistedDate: String {
        registered.formatted(date: .long, time: .omitted)
    }
    
}
