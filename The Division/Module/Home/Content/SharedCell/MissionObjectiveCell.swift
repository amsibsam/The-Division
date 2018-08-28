//
//  MissionObjectiveCell.swift
//  The Division
//
//  Created by MTMAC16 on 28/08/18.
//  Copyright © 2018 bism. All rights reserved.
//

import Foundation
import UIKit

class MissionObjectiveCell: UITableViewCell {
    @IBOutlet var tfObjective: UILabel!
    
    func bindDataToView(with objective: Objective) {
        tfObjective.text = objective.name
    }
}
