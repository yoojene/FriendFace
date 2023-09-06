//
//  CachedUser+CoreDataProperties.swift
//  FriendFace
//
//  Created by Eugene on 06/09/2023.
//
//

import Foundation
import CoreData


extension CachedUser {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedUser> {
        return NSFetchRequest<CachedUser>(entityName: "CachedUser")
    }

    @NSManaged public var id: String?
    @NSManaged public var isActive: Bool
    @NSManaged public var name: String?
    @NSManaged public var age: Int16
    @NSManaged public var company: String?
    @NSManaged public var email: String?
    @NSManaged public var about: String?
    @NSManaged public var registered: Date?
    @NSManaged public var friend: [CachedFriend]?
    
    public var wrappedId: String {
        id ?? "Unknown Id"
    }
    
    public var wrappedName: String {
        name ?? "Unknown name"
    }
    
    public var wrappedCompany: String {
        company ?? "Unknown company"
    }
    
    public var wrappedEmail: String {
        email ?? "Unknown email"
    }
    
    public var wrappedAbout: String {
        about ?? "Unknown about"
    }
    
    public var wrappedRegistered: Date {
        registered ?? Date.now
    }
    
    public var friendArray: [CachedFriend] {
        guard let friend else {
            return [] as [CachedFriend]
        }
        return friend
    }



}

extension CachedUser : Identifiable {

}
