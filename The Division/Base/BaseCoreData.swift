//
//  BaseCoreData.swift
//  The Division
//
//  Created by MTMAC16 on 20/08/18.
//  Copyright © 2018 bism. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class BaseCoreData {
    let managedContext: NSManagedObjectContext!
    
    init() {
        managedContext = UIApplication.appDelegate.persistentContainer.viewContext
    }
    
    func fetch(entityName: String) -> [NSManagedObject]? {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: entityName)
        
        do {
            return try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("error fetch core data \(error)")
            return nil
        }
    }
}
