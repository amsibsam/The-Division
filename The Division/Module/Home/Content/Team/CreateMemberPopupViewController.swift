//
//  CreateMemberPopupViewController.swift
//  The Division
//
//  Created by MTMAC16 on 21/08/18.
//  Copyright © 2018 bism. All rights reserved.
//

import UIKit

class CreateMemberPopupViewController: LandscapeViewController {
    @IBOutlet var ivMemberAvatar: UIImageView!
    @IBOutlet var tfName: UITextField!
    @IBOutlet var tfDivision: UITextField!
    private let divisionPicker = UIPickerView()
    
    
    var completion: ((String, TeamDivision, UIImage?) -> ())!
    let divisions: [String] = ["Transportation", "Acara", "Keamanan", "Perlengkapan"]
    var selectedAvatar: UIImage? {
        didSet {
            guard selectedAvatar != nil else { return }
            ivMemberAvatar.image = selectedAvatar
        }
    }
    
    override var shouldAutorotate: Bool {
        return false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setLandscapeOrientation()
    }
    
    @IBAction func done(_ sender: UIButton) {
        if !tfName.text!.isEmpty && !tfDivision.text!.isEmpty {
            self.completion(tfName.text!, TeamDivision(rawValue: tfDivision.text!)!, selectedAvatar)
            dismiss(animated: true, completion: nil)
        } else {
            HUDUtils.showError(with: "Fail create member, please fill the data correctly")
            dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func cancel(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    //MARK: private function
    private func setupUI() {
        let tapGestureAvatar = UITapGestureRecognizer(target: self, action: #selector(CreateMemberPopupViewController.didTapAvatar))
        ivMemberAvatar.isUserInteractionEnabled = true
        ivMemberAvatar.addGestureRecognizer(tapGestureAvatar)
        
        divisionPicker.delegate = self
        divisionPicker.dataSource = self
        tfDivision.inputView = divisionPicker
        tfDivision.addDoneButton(picker: divisionPicker)
    }
    
    private func pickAvatar() {
        let pickerVC = UIImagePickerController()
        pickerVC.delegate = self
        pickerVC.sourceType = .photoLibrary
        present(pickerVC, animated: true, completion: nil)
    }
    
    //MARK: selector function
    @objc func didTapAvatar() {
        pickAvatar()
    }

}

extension CreateMemberPopupViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let imageData = info[UIImagePickerControllerOriginalImage] as? UIImage {
            self.selectedAvatar = imageData
        }
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
        setLandscapeOrientation()
    }
    
    func navigationControllerSupportedInterfaceOrientations(_ navigationController: UINavigationController) -> UIInterfaceOrientationMask {
        return .landscape
    }
    
}

extension CreateMemberPopupViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return divisions.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return divisions[row]
    }

}

extension CreateMemberPopupViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        tfDivision.text = divisions[row]
    }
}
