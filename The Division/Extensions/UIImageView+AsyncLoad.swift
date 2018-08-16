//
//  UIImageView+AsyncLoad.swift
//  The Division
//
//  Created by MTMAC16 on 16/08/18.
//  Copyright © 2018 bism. All rights reserved.
//

import Foundation
import UIKit
import AlamofireImage

extension UIImageView {
    func load(from url: URL) {
        self.af_setImage(withURL: url)
    }
}
