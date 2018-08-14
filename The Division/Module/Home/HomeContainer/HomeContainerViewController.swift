//
//  HomeContainerViewController.swift
//  The Division
//
//  Created MTMAC16 on 14/08/18.
//  Copyright © 2018 bism. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class HomeContainerViewController: LandscapeViewController {

    @IBOutlet var tablewViewMenu: UITableView!
    @IBOutlet var constraintMenuLeading: NSLayoutConstraint!
    @IBOutlet var viewContainer: UIView!
    
    var isMenuAppear: Bool = false
    var presenter: HomeContainerPresenterProtocol?
    var menuItems: [[MenuItem]] = []

    override var shouldAutorotate: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.landscape
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        presenter?.getMenuItem()
        initiateContent()
    }
    
    @objc func closeMenuAction(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        
        tablewViewMenu.slide(horizontalTranslation: calculateClosingTranslation(xPosition: translation.x, gestureState: sender.state))
    }
    
    @IBAction func onGestureReaction(_ sender: UIScreenEdgePanGestureRecognizer) {
        let translation = sender.translation(in: view)
        
        tablewViewMenu.slide(horizontalTranslation: calculateOpeningTranslation(xPosition: translation.x, gestureState: sender.state))
    }
    
    @IBAction func showDrawer(_ sender: UIButton) {
        if isMenuAppear {
            tablewViewMenu.slide(horizontalTranslation: -self.tablewViewMenu.frame.width)
        } else {
            tablewViewMenu.slide(horizontalTranslation: self.tablewViewMenu.frame.width)
        }
        
        isMenuAppear = !isMenuAppear
    }
    
    // MARK: Content view controller
    private func initiateContent() {
        let teamVC = TeamRouter.createModule()
        addChildViewController(teamVC)
        viewContainer.addSubview(teamVC.view)
    }
    
    // MARK: Private function
    private func setupTableView() {
        let gestureClose = UIPanGestureRecognizer(target: self, action: #selector(self.closeMenuAction(_:)))
        gestureClose.delegate = self
        tablewViewMenu.addGestureRecognizer(gestureClose)
        tablewViewMenu.delegate = self
        tablewViewMenu.dataSource = self
        tablewViewMenu.bounces = false
        tablewViewMenu.tableFooterView = UIView()
        
    }
    
    private func calculateOpeningTranslation(xPosition: CGFloat, gestureState: UIGestureRecognizerState) -> CGFloat {
        var xTranslation = xPosition > tablewViewMenu.frame.width ? tablewViewMenu.frame.width : xPosition
        if xTranslation < (tablewViewMenu.frame.width / 3) && gestureState == .ended {
            xTranslation = -xPosition
            isMenuAppear = false
        } else if xTranslation > (tablewViewMenu.frame.width / 3) && gestureState == .ended {
            xTranslation = tablewViewMenu.frame.width
            isMenuAppear = true
        }
        
        return xTranslation
    }
    
    private func calculateClosingTranslation(xPosition: CGFloat, gestureState: UIGestureRecognizerState) -> CGFloat {
        var xTranslation = xPosition > 0 ? 0 : xPosition
        
        if xTranslation > (-tablewViewMenu.frame.width / 3) && gestureState == .ended {
            xTranslation = 0
            isMenuAppear = true
        } else if xTranslation < (-tablewViewMenu.frame.width / 3) && gestureState == .ended {
            xTranslation = -tablewViewMenu.frame.width
            isMenuAppear = false
        }
        
        return tablewViewMenu.frame.width + xTranslation
    }
}

// MARK: View Protocol
extension HomeContainerViewController: HomeContainerViewProtocol {
    func onGetMenuItemSucceed(menuItems: [[MenuItem]]) {
        self.menuItems = menuItems
        tablewViewMenu.reloadData()
    }
}

// MARK: TableView DataSource
extension HomeContainerViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView(frame: CGRect(x: 0, y: 0, width: tablewViewMenu.frame.width, height: 40))
        let divider = UIView(frame: CGRect(x: 0, y: 30, width: tablewViewMenu.frame.width, height: 3))
        divider.backgroundColor = #colorLiteral(red: 1, green: 0.9921094184, blue: 0.3750105696, alpha: 1)
        header.backgroundColor = #colorLiteral(red: 0.1494665567, green: 0.1596326825, blue: 0.1749108919, alpha: 1)
        let lblTitle = UILabel(frame: CGRect(x: 20, y: 0, width: tableView.frame.width, height: 30))
        lblTitle.text = section == 0 ? "Team" : "Mission"
        lblTitle.textColor = #colorLiteral(red: 1, green: 0.9921094184, blue: 0.3750105696, alpha: 1)
        lblTitle.font = UIFont.boldSystemFont(ofSize: lblTitle.font.pointSize)
        
        
        header.addSubview(divider)
        header.addSubview(lblTitle)
        return header
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let menuItem = menuItems[indexPath.section][indexPath.row]
        let cell = UITableViewCell()
        cell.backgroundColor = #colorLiteral(red: 0.1494665567, green: 0.1596326825, blue: 0.1749108919, alpha: 1)
        cell.textLabel?.textColor = #colorLiteral(red: 1, green: 0.9921094184, blue: 0.3750105696, alpha: 1)
        cell.textLabel?.text = menuItem.name
        
        let lbCount = UILabel(frame: CGRect(x: cell.frame.width - 70, y: 0, width: 40, height: 40))
        lbCount.text = "\(menuItem.count)"
        lbCount.textColor = #colorLiteral(red: 1, green: 0.9921094184, blue: 0.3750105696, alpha: 1)
        cell.addSubview(lbCount)
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return menuItems.count
    }
}

// MARK: TableView Delegate
extension HomeContainerViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tablewViewMenu.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: Gesture Delegate
extension HomeContainerViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}