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
    
    
    var completion: ((String, TeamDivision, Data?) -> ())!
    let divisions: [String] = ["Transportation", "Acara", "Keamanan", "Perlengkapan"]
    var selectedAvatar: Data? {
        didSet {
            guard let avatarData = selectedAvatar else { return }
            ivMemberAvatar.image = UIImage(data: avatarData)
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
        
        addDoneButton()
    }
    
    private func pickAvatar() {
        let pickerVC = UIImagePickerController()
        pickerVC.delegate = self
        pickerVC.sourceType = .photoLibrary
        present(pickerVC, animated: true, completion: nil)
    }
    
    private func addDoneButton() {
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: divisionPicker.frame.height, width: UIScreen.main.bounds.width, height: 40))
        let btnDone = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(CreateMemberPopupViewController.didTapDone))
        
        toolbar.setItems([btnDone], animated: true)
        tfDivision.inputAccessoryView = toolbar
    }
    
    //MARK: selector function
    @objc func didTapAvatar() {
        pickAvatar()
    }
    
    @objc func didTapDone() {
        tfDivision.resignFirstResponder()
    }
}

extension CreateMemberPopupViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let imageData = info[UIImagePickerControllerOriginalImage] as? UIImage {
            self.selectedAvatar = UIImagePNGRepresentation(imageData)
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
