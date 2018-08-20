//
//  MissionDetailRouter.swift
//  The Division
//
//  Created MTMAC16 on 20/08/18.
//  Copyright © 2018 bism. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class MissionDetailRouter: MissionDetailWireframeProtocol {

    weak var viewController: UIViewController?

    static func createModule(with mission: Mission) -> UIViewController {
        // Change to get view from storyboard if not using progammatic UI
        let view = AppStoryBoard.Home.instance.instantiateViewController(withIdentifier: HomeViewControllers.MissionDetail.rawValue) as! MissionDetailViewController
        view.mission = mission
        let interactor = MissionDetailInteractor()
        let router = MissionDetailRouter()
        let presenter = MissionDetailPresenter(interface: view, interactor: interactor, router: router)

        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view

        return view
    }
}
