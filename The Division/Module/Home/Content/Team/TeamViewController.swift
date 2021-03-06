//
//  TeamViewController.swift
//  The Division
//
//  Created MTMAC16 on 14/08/18.
//  Copyright © 2018 bism. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class TeamViewController: LandscapeViewController {
    @IBOutlet var tableViewMember: UITableView!
    var members: [Member] = []
    
	var presenter: TeamPresenterProtocol?
    var teamDivision: TeamDivision!

	override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        presenter?.getTeamMember(on: teamDivision)
    }
    
    private func setupTableView() {
        tableViewMember.delegate = self
        tableViewMember.dataSource = self
        tableViewMember.tableFooterView = UIView()
        tableViewMember.estimatedRowHeight = UITableViewAutomaticDimension
    }
}

extension TeamViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return members.count
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableCell(withIdentifier: "ContentHeaderCell") as! ContentHeaderCell

        header.bindDataToView(in: .Team, with: teamDivision.rawValue, and: members.count)
        header.onAddDidTap = {
            self.presenter?.presentCreateTeamPopup(from: self, completion: { (name, division, avatar) in
                self.presenter?.addMember(with: name, on: division, avatarUrl: nil, image: avatar)
            })
        }
        
        return header
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let member = members[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "TeamMemberCell", for: indexPath) as! TeamMemberCell
        cell.bindDataToView(with: member)
        return cell
    }
}

extension TeamViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension TeamViewController: TeamViewProtocol {
    func onSuccessAddMember(with member: Member) {
        self.members.insert(member, at: 0)
        tableViewMember.beginUpdates()
        tableViewMember.insertRows(at: [IndexPath(row: 0, section: 0)], with: .left)
        tableViewMember.endUpdates()
    }
    
    func onGetMemberSucceeded(with members: [Member]) {
        self.members.append(contentsOf: members)
        tableViewMember.reloadData()
    }
}
