//
//  AddMissionObjectiveCell.swift
//  The Division
//
//  Created by MTMAC16 on 28/08/18.
//  Copyright © 2018 bism. All rights reserved.
//

import Foundation
import UIKit

class AddMissionObjectiveCell: UITableViewCell {
    var addCompletion: () -> Void = {}
    
    @IBAction func addObjective(_ sender: UIButton) {
        addCompletion()
    }
}
