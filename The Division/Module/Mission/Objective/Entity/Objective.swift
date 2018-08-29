//
//  Objective.swift
//  The Division
//
//  Created by MTMAC16 on 28/08/18.
//  Copyright © 2018 bism. All rights reserved.
//

import Foundation

class Objective {
    var id: String = ""
    var name: String = ""
    var isComplete: Bool = false
    
    init(id: String, name: String) {
        self.id = id
        self.name = name
    }
}
