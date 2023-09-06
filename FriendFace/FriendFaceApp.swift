//
//  FriendFaceApp.swift
//  FriendFace
//
//  Created by Eugene on 04/09/2023.
//

import SwiftUI

@main
struct FriendFaceApp: App {
    
    @StateObject private var dataController = DataController()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
