//
//  LoginViewController.swift
//  The Division
//
//  Created MTMAC16 on 13/08/18.
//  Copyright © 2018 bism. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet var tfEmail: UITextField!
    @IBOutlet var tfPassword: UITextField!
    
	var presenter: LoginPresenterProtocol?

    override var shouldAutorotate: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let value = UIInterfaceOrientation.portrait.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        tfEmail.setLeftPaddingPoints(10)
        tfPassword.setLeftPaddingPoints(10)
//        let homeVC = AppStoryBoard.Home.instance.instantiateViewController(withIdentifier: HomeViewControllers.Home.rawValue)
//        addChildViewController(homeVC)
//        self.view.addSubview(homeVC.view)
//        homeVC.view.isHidden = true
        
    }

    @IBAction func doLogin(_ sender: UIButton) {
        presenter?.login(email: tfEmail.text!, password: tfPassword.text!)
    }
}

extension LoginViewController: LoginViewProtocol {
    func showLoading() {
        HUDUtils.showLoading()
    }
    
    func showError(with message: String) {
        HUDUtils.showError(with: message)
    }
    
    func dismissLoading() {
        HUDUtils.dismiss()
    }
    
    func showLoginSucceeded() {
        let homeVC = AppStoryBoard.Home.instance.instantiateViewController(withIdentifier: "HomeContainerViewController")
        UIApplication.appDelegate.window?.rootViewController = homeVC
    }
}
