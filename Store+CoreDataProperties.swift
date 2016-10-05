//
//  Store+CoreDataProperties.swift
//  
//
//  Created by Misha Korchak on 06.10.16.
//
//

import Foundation
import CoreData


extension Store {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Store> {
        return NSFetchRequest<Store>(entityName: "Store");
    }

    @NSManaged public var sImage: NSData?

}
