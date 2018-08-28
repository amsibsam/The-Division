//
//  CreateMissionPopupViewController.swift
//  The Division
//
//  Created by MTMAC16 on 28/08/18.
//  Copyright © 2018 bism. All rights reserved.
//

import Foundation
import UIKit

class CreateMissioPopupViewController: UIViewController {
    
    @IBOutlet var tableViewObjective: UITableView!
    @IBOutlet var tfMissionName: UITextField!
    @IBOutlet var tvMissionDescription: UITextView!
    @IBOutlet var tfAssignee: UITextField!
    private var agentPicker: UIPickerView = UIPickerView()
    
    var objectives: [Objective] = []
    var agents: [Member] = []
    var selectedAgent: Member?
    var completion: ((String, String, Member, [Objective]) -> Void)!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        tfAssignee.inputView = agentPicker
        agentPicker.dataSource = self
        agentPicker.delegate = self
        
        setupTableview()
    }
    
    private func setupTableview() {
        tableViewObjective.delegate = self
        tableViewObjective.dataSource = self
        tableViewObjective.estimatedRowHeight = UITableViewAutomaticDimension
        tableViewObjective.tableFooterView = UIView()
    }
    
    private func showCreateObjectiveAlert() {
        let alert = UIAlertController(title: "Add Objective", message: nil, preferredStyle: .alert)
        alert.addTextField { (tfName) in
            tfName.placeholder = "Objective name"
        }
        alert.addAction(UIAlertAction(title: "Create", style: .default, handler: { (action) in
            self.objectives.append(Objective(name: alert.textFields![0].text!))
            self.tableViewObjective.reloadData()
            self.tableViewObjective.scrollToRow(at: IndexPath(item: self.objectives.count, section: 0), at: .bottom, animated: true)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func createMission(_ sender: Any) {
        guard let assignee = selectedAgent else {
            HUDUtils.showError(with: "Choose Assignee")
            return
        }
        
        dismiss(animated: true, completion: nil)
        completion(tfMissionName.text!, tvMissionDescription.text, assignee, objectives)
    }
    
    @IBAction func cancel(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}

extension CreateMissioPopupViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return agents.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return agents[row].name
    }
}

extension CreateMissioPopupViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedAgent = agents[row]
        tfAssignee.text = selectedAgent?.name
    }
}

extension CreateMissioPopupViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objectives.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == objectives.count {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AddMissionObjectiveCell", for: indexPath) as! AddMissionObjectiveCell
            cell.addCompletion = {
                self.showCreateObjectiveAlert()
            }
            
            return cell
        } else {
            let objective = objectives[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "MissionObjectiveCell", for: indexPath) as! MissionObjectiveCell
            cell.bindDataToView(with: objective)
            
            return cell
        }
    }
    
    
}

extension CreateMissioPopupViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
