//
//  CoreDataHelper.swift
//  The Division
//
//  Created by MTMAC16 on 20/08/18.
//  Copyright © 2018 bism. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class CoreDataHelper {
    let shared: CoreDataHelper = CoreDataHelper()
    let managedContext: NSManagedObjectContext!
    
    init() {
        managedContext = UIApplication.appDelegate.persistentContainer.viewContext
    }
    
    func getManagedObject(name: String) -> NSManagedObject {
        let entity = NSEntityDescription.entity(forEntityName: name, in: managedContext)
        return NSManagedObject(entity: entity!, insertInto: managedContext)
    }
}
