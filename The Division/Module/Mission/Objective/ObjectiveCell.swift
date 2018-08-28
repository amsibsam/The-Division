//
//  ObjectiveCell.swift
//  The Division
//
//  Created by MTMAC16 on 28/08/18.
//  Copyright © 2018 bism. All rights reserved.
//

import Foundation
import UIKit
import M13Checkbox

class ObjectiveCell: UITableViewCell {
    @IBOutlet var checkboxContainer: UIView!
    @IBOutlet var lbObjective: UILabel!
    var checkbox: M13Checkbox!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        checkbox = M13Checkbox(frame: CGRect(x: 0, y: 0, width: 35, height: 35))
        checkbox.boxType = .square
        checkbox.animationDuration = 0.3
        checkbox.stateChangeAnimation = .fill
        checkbox.checkmarkLineWidth = 2.0
        checkbox.secondaryCheckmarkTintColor = #colorLiteral(red: 1, green: 0.9921094184, blue: 0.3750105696, alpha: 1)
        checkbox.tintColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        checkbox.secondaryTintColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        checkboxContainer.addSubview(checkbox)
    }

}
