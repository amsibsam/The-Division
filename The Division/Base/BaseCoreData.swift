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
}
