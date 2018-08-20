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
    
    func bindDataToView(in type: MenuType, with title: String, and count: Int) {
        switch type {
        case .Mission:
            lbName.text = "\(title) mission (\(count) mission)"
        case .Team:
            lbName.text = "\(title) (\(count) agent)"
        }
        
        if title.lowercased() == "in progress" || title.lowercased() == "finished" {
            btnAdd.isHidden = true
        }
    }
}

enum MenuType: String {
    case Team
    case Mission
}
