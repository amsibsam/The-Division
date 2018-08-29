//
//  Mission.swift
//  The Division
//
//  Created by MTMAC16 on 16/08/18.
//  Copyright © 2018 bism. All rights reserved.
//

import Foundation

class Mission {
    var id: String = ""
    var name: String = ""
    var description: String = ""
    var state: MissionState = .New
    var progress: Double = 0
    var avatarURL: URL? = nil
    var assignee: Member? = nil
    var objective: [Objective] = []
    
    init(id: String, name: String, description: String, state: MissionState) {
        self.id = id
        self.name = name
        self.description = description
        self.state = state
    }
}

public enum MissionState: String {
    case InProgress = "In Progress"
    case New = "New"
    case Finished = "Finished"
}
