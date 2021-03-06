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
    case Mission = "Mission"
    
    var instance: UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }
}

enum Navigation: String {
    case Login = "LoginNavigation"
    case Mission = "MissionNavigation"
}

enum MainViewControllers: String {
    case Intro = "IntroViewController"
    case IntroItem = "IntroItemViewController"
    case Login = "LoginViewController"
    case Register = "RegisterViewController"
}

enum HomeViewControllers: String {
    case Home = "HomeContainerViewController"
    case Team = "TeamViewController"
    case Mission = "MissionViewController"
    case CreateMember = "CreateMemberPopupViewController"
    case CreateMission = "CreateMissionPopupViewController"
}

enum MissionViewControllers: String {
    case MissionDetail = "MissionDetailViewController"
    case Objective = "ObjectiveViewController"
    case Note = "NoteViewController"
    case Partner = "PartnerViewController"
}
