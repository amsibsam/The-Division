//
//  ContentHeaderCell.swift
//  The Division
//
//  Created by MTMAC16 on 16/08/18.
//  Copyright © 2018 bism. All rights reserved.
//

import UIKit

class ContentHeaderCell: UITableViewCell {
    @IBOutlet var lbName: UILabel!
    @IBOutlet var btnAdd: UIButton!
    var onAddDidTap: () -> Void = {}

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func addItem(_ sender: UIButton) {
        onAddDidTap()
    }
    
    func bindDataToView(with title: String, and count: Int) {
        lbName.text = "\(title) (\(count) agent)"
    }
}
