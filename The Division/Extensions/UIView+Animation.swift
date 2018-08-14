//
//  UIView+Animation.swift
//  The Division
//
//  Created by MTMAC16 on 13/08/18.
//  Copyright © 2018 bism. All rights reserved.
//

import Foundation
import UIKit

public extension UIView {
    func zoomIn(duration: Double) {
        self.isHidden = false
        self.transform = CGAffineTransform(scaleX: 0, y: 0)
        UIView.animate(withDuration: duration) {
            self.transform = CGAffineTransform.identity
        }
    }
    
    func slide(horizontalTranslation: CGFloat) {
        UIView.animate(withDuration: 0.3) {
            self.transform = CGAffineTransform(translationX: horizontalTranslation, y: self.layer.anchorPoint.y)
        }
    }
}
