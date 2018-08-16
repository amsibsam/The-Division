//
//  UIViewController+gesture.swift
//  The Division
//
//  Created by MTMAC16 on 16/08/18.
//  Copyright © 2018 bism. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func tappedAround() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.doOnTappedAround(_:)))
        tapGesture.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @objc func doOnTappedAround(_ sender: UIGestureRecognizer) {
        self.view.endEditing(true)
    }
}
