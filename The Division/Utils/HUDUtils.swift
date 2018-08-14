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
    }
    
    static func showLoading(with message: String = "Please Wait") {
        HUD.show(.labeledProgress(title: "Loading", subtitle: message))
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            dismiss()
        }
    }
    
    static func dismiss() {
        HUD.hide()
    }
}
