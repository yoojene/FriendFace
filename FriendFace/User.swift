//
//  User.swift
//  FriendFace
//
//  Created by Eugene on 04/09/2023.
//

struct User: Codable, Identifiable, Equatable {
    
    let id: String
    let isActive: Bool
    let name: String
    let age: Int
    let company: String
    let email: String
    let address: String
    let about: String
    let registered: String
    
    
}
