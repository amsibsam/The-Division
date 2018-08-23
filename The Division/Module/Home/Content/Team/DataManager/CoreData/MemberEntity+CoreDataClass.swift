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
import UIKit

public class MemberEntity: NSManagedObject {
    var avatarURL: URL? {
        if let url = self.avatarUrl {
            print("avatar url \(url)")
            return url.isEmpty ? nil : URL(string: self.avatarUrl ?? "http://")
        } else {
            return nil
        }
        
    }
    
    var pict: UIImage? {
        guard let data = pictData as Data? else { return nil }
        return UIImage(data: data)
    }
}
