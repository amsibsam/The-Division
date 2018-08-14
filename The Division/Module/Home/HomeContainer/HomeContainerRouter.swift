//
//  HomeContainerRouter.swift
//  The Division
//
//  Created MTMAC16 on 14/08/18.
//  Copyright © 2018 bism. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class HomeContainerRouter: HomeContainerWireframeProtocol {

    weak var viewController: UIViewController?

    static func createModule() -> UIViewController {
        // Change to get view from storyboard if not using progammatic UI
        let view = AppStoryBoard.Home.instance.instantiateViewController(withIdentifier: HomeViewControllers.Home.rawValue) as! HomeContainerViewController
        let interactor = HomeContainerInteractor()
        let router = HomeContainerRouter()
        let dataManager = HomeContainerDataManager()
        let presenter = HomeContainerPresenter(interface: view, interactor: interactor, router: router)

        view.presenter = presenter
        dataManager.interactor = interactor
        interactor.presenter = presenter
        interactor.dataManager = dataManager
        router.viewController = view

        return view
    }
    
    static func createModuleAsRoot() {
        UIApplication.appDelegate.window?.rootViewController = createModule()
    }
}
