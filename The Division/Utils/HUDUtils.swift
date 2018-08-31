//
//  HUDUtils.swift
//  The Division
//
//  Created by MTMAC16 on 14/08/18.
//  Copyright © 2018 bism. All rights reserved.
//

import Foundation
import PKHUD

class HUDUtils {
    static func showError(with message: String) {
        HUD.show(.labeledError(title: "Error", subtitle: message))
        dismiss()
    }
    
    static func showLoading(with message: String = "Please Wait") {
        HUD.show(.labeledProgress(title: "Loading", subtitle: message))
        dismiss()
    }
    
    static func showInfo(with message: String) {
        HUD.flash(.label(message))
    }
    
    static func dismiss() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            HUD.hide()
        }
    }
    
}
