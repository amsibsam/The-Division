//
//  Mission.swift
//  The Division
//
//  Created by MTMAC16 on 16/08/18.
//  Copyright © 2018 bism. All rights reserved.
//

import Foundation

struct Mission {
    var name: String = ""
    var description: String = ""
    var progress: Int = 0
    var avatarURL: URL? = nil
    var assignee: Member? = nil
    
    init(name: String, description: String) {
        self.name = name
        self.description = description
    }
}
