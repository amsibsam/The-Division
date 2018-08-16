//
//  MissionRouter.swift
//  The Division
//
//  Created MTMAC16 on 16/08/18.
//  Copyright © 2018 bism. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class MissionRouter: MissionWireframeProtocol {

    weak var viewController: UIViewController?

    static func createModule() -> UIViewController {
        // Change to get view from storyboard if not using progammatic UI
        let view = AppStoryBoard.Home.instance.instantiateViewController(withIdentifier: HomeViewControllers.Mission.rawValue) as! MissionViewController
        let interactor = MissionInteractor()
        let router = MissionRouter()
        let presenter = MissionPresenter(interface: view, interactor: interactor, router: router)

        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view

        return view
    }
}
