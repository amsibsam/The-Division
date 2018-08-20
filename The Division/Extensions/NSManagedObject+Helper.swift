//
//  NSManagedObject+Helper.swift
//  The Division
//
//  Created by MTMAC16 on 20/08/18.
//  Copyright © 2018 bism. All rights reserved.
//

import Foundation
import CoreData
import UIKit

extension NSManagedObject {
    class func with(name: String) -> NSManagedObject? {
        let managedContext = UIApplication.appDelegate.persistentContainer.viewContext
        guard let entity = NSEntityDescription.entity(forEntityName: name, in: managedContext) else { return nil }
        
        return NSManagedObject(entity: entity, insertInto: managedContext)
    }
}
