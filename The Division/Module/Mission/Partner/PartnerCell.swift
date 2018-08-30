//
//  PartnerCell.swift
//  The Division
//
//  Created by MTMAC16 on 28/08/18.
//  Copyright © 2018 bism. All rights reserved.
//

import Foundation
import UIKit

class PartnerCell: UICollectionViewCell {
    @IBOutlet var lbPartnerName: UILabel!
    @IBOutlet var lbPartnerDivision: UILabel!
    @IBOutlet var ivPartnerAvatar: UIImageView!
    
    func bindDataToView(with member: Member) {
        lbPartnerName.text = member.name
        lbPartnerDivision.text = member.division.rawValue
        ivPartnerAvatar.image = member.pict
    }
}
