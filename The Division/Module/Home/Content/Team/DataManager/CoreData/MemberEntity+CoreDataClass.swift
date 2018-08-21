//
//  MemberEntity+CoreDataClass.swift
//  The Division
//
//  Created by MTMAC16 on 21/08/18.
//  Copyright © 2018 bism. All rights reserved.
//
//

import Foundation
import CoreData


public class MemberEntity: NSManagedObject {
    var avatarURL: URL? {
        return URL(string: self.avatarUrl ?? "http://")
    }
}
