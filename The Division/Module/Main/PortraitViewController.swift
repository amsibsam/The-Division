//
//  PortraitViewController.swift
//  The Division
//
//  Created by MTMAC16 on 14/08/18.
//  Copyright © 2018 bism. All rights reserved.
//

import UIKit

class PortraitViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let value = UIInterfaceOrientation.portrait.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        // Do any additional setup after loading the view.
    }

}
