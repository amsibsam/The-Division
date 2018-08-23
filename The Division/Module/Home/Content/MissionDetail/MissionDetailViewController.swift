//
//  MissionDetailViewController.swift
//  The Division
//
//  Created MTMAC16 on 20/08/18.
//  Copyright © 2018 bism. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class MissionDetailViewController: UIViewController, MissionDetailViewProtocol {
    
    @IBOutlet var ivAgentAvatar: UIImageView!
    @IBOutlet var lbAgentName: UILabel!
    @IBOutlet var lbMissionName: UILabel!
    @IBOutlet var lbMissionDescription: UILabel!
    @IBOutlet var lbMisisonProgress: UILabel!
    @IBOutlet var viewMissionDetailContainer: UIView!
    
	var presenter: MissionDetailPresenterProtocol?
    var mission: Mission!

	override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindDataToView()
    }
    
    private func setupUI() {
        viewMissionDetailContainer.layer.shadowOpacity = 0.7
        viewMissionDetailContainer.layer.shadowColor = UIColor.yellow.cgColor
        viewMissionDetailContainer.layer.shadowRadius = 10
    }

    private func bindDataToView() {
        //MARK: TODO render avatar and agent data
        lbMissionName.text = mission.name
        lbMissionDescription.text = mission.description
        lbAgentName.text = mission.assignee?.name ?? "-"
        ivAgentAvatar.image = mission.assignee?.pict
    }
}
