//
//  LandscapeViewController.swift
//  The Division
//
//  Created by MTMAC16 on 14/08/18.
//  Copyright © 2018 bism. All rights reserved.
//

import UIKit

class LandscapeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setLandscapeOrientation()
        // Do any additional setup after loading the view.
    }

    func setLandscapeOrientation() {
        let value = UIInterfaceOrientationMask.landscape.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
    }
}
