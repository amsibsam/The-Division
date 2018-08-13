//
//  UIApplication+AppDelegate.swift
//  The Division
//
//  Created by MTMAC16 on 13/08/18.
//  Copyright © 2018 bism. All rights reserved.
//

import Foundation
import UIKit

extension UIApplication {
    static var appDelegate: AppDelegate {
            return UIApplication.shared.delegate as! AppDelegate
    }
}
