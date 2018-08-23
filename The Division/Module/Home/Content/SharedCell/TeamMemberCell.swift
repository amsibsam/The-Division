//
//  TeamMemberCell.swift
//  The Division
//
//  Created by MTMAC16 on 16/08/18.
//  Copyright © 2018 bism. All rights reserved.
//

import UIKit

class TeamMemberCell: UITableViewCell {
    @IBOutlet var ivAvatar: UIImageView!
    @IBOutlet var lbName: UILabel!
    @IBOutlet var lbMissionCount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func bindDataToView(with member: Member) {
        lbName.text = member.name
        lbMissionCount.text = "\(member.missionCount) mission"
        lbMissionCount.text?.append(member.missionCount > 1 ? "s" : "")
        if let avatarURL = member.avatarURL {
            ivAvatar.load(from: avatarURL)
        } else if let pict = member.pict {
            ivAvatar.image = pict
        }
    }

}
