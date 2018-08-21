//
//  TeamRouter.swift
//  The Division
//
//  Created MTMAC16 on 14/08/18.
//  Copyright © 2018 bism. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class TeamRouter: TeamWireframeProtocol {

    weak var viewController: UIViewController?

    static func createModule(with type: TeamDivision) -> UIViewController {
        // Change to get view from storyboard if not using progammatic UI
        let view = AppStoryBoard.Home.instance.instantiateViewController(withIdentifier: HomeViewControllers.Team.rawValue) as! TeamViewController
        view.teamDivision = type
        let interactor = TeamInteractor()
        let router = TeamRouter()
        let dataManager = TeamDataManager()
        let presenter = TeamPresenter(interface: view, interactor: interactor, router: router)

        view.presenter = presenter
        interactor.presenter = presenter
        interactor.dataManager = dataManager
        dataManager.interactor = interactor
        router.viewController = view

        return view
    }
    
    func presentCreateTeamPopup(from view: TeamViewProtocol, completion: @escaping (String, TeamDivision, Data?) -> ()) {
        
        if let sourceView = view as? UIViewController {
            let view = AppStoryBoard.Home.instance.instantiateViewController(withIdentifier: HomeViewControllers.CreateMember.rawValue) as! CreateMemberPopupViewController
            view.completion = completion
            view.modalPresentationStyle = .overCurrentContext
            
            sourceView.present(view, animated: true, completion: nil)
        }
    }
}
