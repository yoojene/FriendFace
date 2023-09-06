//
//  DataController.swift
//  FriendFace
//
//  Created by Eugene on 06/09/2023.
//

import CoreData
import Foundation

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "FriendFace")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("FriendFace failed to load: \(error.localizedDescription)")
                return
            }
            

        }
    }
}
