//
//  IntroRouter.swift
//  The Division
//
//  Created MTMAC16 on 13/08/18.
//  Copyright © 2018 bism. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class IntroRouter: IntroWireframeProtocol {

    weak var viewController: UIViewController?

    static func createModule(setAsRoot: Bool = false) -> UIViewController {
        // Change to get view from storyboard if not using progammatic UI
        let view = AppStoryBoard.Main.instance.instantiateViewController(withIdentifier: MainViewControllers.Intro.rawValue) as! IntroViewController
        let interactor = IntroInteractor()
        let router = IntroRouter()
        let presenter = IntroPresenter(interface: view, interactor: interactor, router: router)

        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        if setAsRoot {
            UIApplication.appDelegate.window?.rootViewController = view
        }

        return view
    }
    
    static func createModule(asRoot: Bool = false) {
        // Change to get view from storyboard if not using progammatic UI
        let view = AppStoryBoard.Main.instance.instantiateViewController(withIdentifier: MainViewControllers.Intro.rawValue) as! IntroViewController
        let interactor = IntroInteractor()
        let router = IntroRouter()
        let presenter = IntroPresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        if asRoot {
            UIApplication.appDelegate.window?.rootViewController = view
        }
    }
}
