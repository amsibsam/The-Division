//
//  RegisterRouter.swift
//  The Division
//
//  Created MTMAC16 on 31/08/18.
//  Copyright © 2018 bism. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class RegisterRouter: RegisterWireframeProtocol {

    weak var viewController: UIViewController?

    static func createModule() -> UIViewController {
        // Change to get view from storyboard if not using progammatic UI
        let view = AppStoryBoard.Main.instance.instantiateViewController(withIdentifier: MainViewControllers.Register.rawValue) as! RegisterViewController
        let interactor = RegisterInteractor()
        let router = RegisterRouter()
        let dataManager = RegisterDataManager()
        let networkManager = NetworkServiceManager()
        let presenter = RegisterPresenter(interface: view, interactor: interactor, router: router)

        view.presenter = presenter
        interactor.presenter = presenter
        interactor.dataManager = dataManager
        dataManager.interactor = interactor
        dataManager.networkManager = networkManager
        networkManager.delegate = dataManager
        router.viewController = view

        return view
    }
}