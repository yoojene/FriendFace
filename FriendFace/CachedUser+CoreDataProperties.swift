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
    @NSManaged public var address: String?
    @NSManaged public var registered: Date?
    @NSManaged public var friends: NSSet?
    
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
    public var wrappedAddress: String {
        address ?? "Unknown address"
    }
    
    public var wrappedRegistered: Date {
        registered ?? Date.now
    }
    
    public var friendArray: [CachedFriend] {
        
        
        let set = friends as? Set<CachedFriend> ?? []
        
        return set.sorted {
            $0.wrappedName < $1.wrappedName

        }
    
    }
    
    public var formattedRegisteredDate: String {
        wrappedRegistered.formatted(date: .long, time: .omitted)
    }



}

extension CachedUser : Identifiable {

}
