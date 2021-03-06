//
//  PartnerViewController.swift
//  The Division
//
//  Created MTMAC16 on 28/08/18.
//  Copyright © 2018 bism. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class PartnerViewController: LandscapeViewController {

    @IBOutlet var lbPartnerCount: UILabel!
    @IBOutlet var collectionViewPartner: UICollectionView!
    @IBOutlet var mainContainer: UIView!
    
    var presenter: PartnerPresenterProtocol?
    var mission: Mission!
    var partners: [Member] = [] {
        didSet {
            updateLabel(position: partners.count > 0 ? 1 : 0)
        }
    }
    var selectedAgent: Member?
    var agents: [Member] = []
    var currentPossition: Int = 0 {
        didSet {
            updateLabel(position: currentPossition + 1)
        }
    }
    var tfAgentHelper: UITextField = UITextField(frame: CGRect.zero)
    var agentPicker: UIPickerView = UIPickerView()

	override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        presenter?.getAllAgent()
        presenter?.getPartner(on: mission)
    }
    
    
    @IBAction func addPartner(_ sender: UIButton) {
        tfAgentHelper.becomeFirstResponder()
        tfAgentHelper.delegate = self
    }
    
    
    @IBAction func next(_ sender: UIButton) {
        if (partners.count > 1) && (currentPossition < (partners.count - 1)) {
            currentPossition += 1
            collectionViewPartner.scrollToItem(at: IndexPath(row: currentPossition, section: 0), at: .centeredHorizontally, animated: true)
        }
    }
    
    @IBAction func previous(_ sender: UIButton) {
        if currentPossition > 0 {
            currentPossition -= 1
            collectionViewPartner.scrollToItem(at: IndexPath(row: currentPossition, section: 0), at: .centeredHorizontally, animated: true)
        }
    }
    
    private func setupUI() {
        let tapGestuer = UITapGestureRecognizer(target: self, action: #selector(PartnerViewController.exit))
        mainContainer.addGestureRecognizer(tapGestuer)
        
        agentPicker.delegate = self
        agentPicker.dataSource = self
        tfAgentHelper.inputView = agentPicker
        view.addSubview(tfAgentHelper)
        
        setupCollectionView()
    }
    
    private func updateLabel(position: Int) {
        lbPartnerCount.text = "\(position)/\(partners.count)"
    }
    
    private func setupCollectionView() {
        collectionViewPartner.delegate = self
        collectionViewPartner.dataSource = self
        collectionViewPartner.isUserInteractionEnabled = false
        collectionViewPartner.shouldIgnoreScrollingAdjustment = true
    }
    
    @objc func exit() {
        dismiss(animated: true, completion: nil)
    }
    
    override func doOnTappedAround(_ sender: UIGestureRecognizer) {
        super.doOnTappedAround(sender)
        dismiss(animated: true, completion: nil)
    }
    
    private func removeParticipantFromAvailableAgent(participants: [Member]) {
        if let assigneeIndex = agents.index(where: { (agent) -> Bool in
            return agent.id == mission.assignee!.id
        }) {
            agents.remove(at: assigneeIndex)
        }
        
        for participant in participants {
            if let indexToBeRemove = agents.index(where: { (agent) -> Bool in
                return agent.id == participant.id
            }) {
                agents.remove(at: indexToBeRemove)
            }
        }
        
        agentPicker.reloadAllComponents()
    }
}

extension PartnerViewController: PartnerViewProtocol {
    func onAddPartnerSucceeded(with partner: Member) {
        self.partners.append(partner)
        // remove added agent to mission partner from list
        removeParticipantFromAvailableAgent(participants: [partner])
        
        self.collectionViewPartner.insertItems(at: [IndexPath(row: self.partners.count - 1, section: 0)])
        self.collectionViewPartner.scrollToItem(at: IndexPath(row: self.partners.count - 1, section: 0), at: .centeredHorizontally, animated: true)
        currentPossition = partners.count - 1
    }
    
    func onGetPartnerSucceeded(with partners: [Member]) {
        self.partners = partners
        removeParticipantFromAvailableAgent(participants: partners)
        selectedAgent = self.agents.first
        collectionViewPartner.reloadData()
    }
    
    func onGetAllAgentSucceeded(with agents: [Member]) {
        self.agents.append(contentsOf: agents)
        removeParticipantFromAvailableAgent(participants: [])
        agentPicker.reloadAllComponents()
    }
}

extension PartnerViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return partners.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PartnerCell", for: indexPath) as! PartnerCell
        cell.bindDataToView(with: partners[indexPath.row])
        
        return cell
    }
    
    
}

extension PartnerViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionViewPartner.deselectItem(at: indexPath, animated: true)
    }
}

extension PartnerViewController: UIPickerViewDataSource {
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

extension PartnerViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if agents.count > 0 {
            selectedAgent = agents[row]
        }        
    }
}

extension PartnerViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let partner = selectedAgent else { return }
        presenter?.addPartner(on: mission, with: partner)
    }
}
