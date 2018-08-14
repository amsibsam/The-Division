//
//  AppStoryBoard.swift
//  The Division
//
//  Created by MTMAC16 on 13/08/18.
//  Copyright © 2018 bism. All rights reserved.
//

import Foundation
import UIKit

enum AppStoryBoard: String {
    case Main = "Main"
    case Home = "Home"
    
    var instance: UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }
}

enum MainViewControllers: String {
    case Intro = "IntroViewController"
    case IntroItem = "IntroItemViewController"
    case Login = "LoginViewController"
}

enum HomeViewControllers: String {
    case Home = "HomeContainerViewController"
    case Team = "TeamViewController"
}
