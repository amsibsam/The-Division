//
//  Member.swift
//  The Division
//
//  Created by MTMAC16 on 16/08/18.
//  Copyright © 2018 bism. All rights reserved.
//

import Foundation
import UIKit

struct Member {
    let id: String
    let name: String
    let division: TeamDivision
    let missionCount: Int
    var avatarURL: URL?
    var pict: UIImage?
}

public enum TeamDivision: String {
    case Transportation = "Transportation"
    case Acara = "Acara"
    case Keamanan = "Keamanan"
    case Perlengkapan = "Perlengkapan"
}
