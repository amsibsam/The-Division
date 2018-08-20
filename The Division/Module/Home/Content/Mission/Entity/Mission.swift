//
//  Mission.swift
//  The Division
//
//  Created by MTMAC16 on 16/08/18.
//  Copyright © 2018 bism. All rights reserved.
//

import Foundation

struct Mission {
    var id: String = ""
    var name: String = ""
    var description: String = ""
    var state: MissionState = .New
    var progress: Int = 0
    var avatarURL: URL? = nil
    var assignee: Member? = nil
    
    init(id: String, name: String, description: String, state: MissionState) {
        self.id = id
        self.name = name
        self.description = description
        self.state = state
    }
}
