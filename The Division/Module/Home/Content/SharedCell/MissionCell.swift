//
//  MissionCell.swift
//  The Division
//
//  Created by MTMAC16 on 16/08/18.
//  Copyright © 2018 bism. All rights reserved.
//

import UIKit

class MissionCell: UITableViewCell {
    @IBOutlet var ivMission: UIImageView!
    @IBOutlet var lbName: UILabel!
    
    func bindDataToView(with mission: Mission) {
        lbName.text = mission.name
    }

}
