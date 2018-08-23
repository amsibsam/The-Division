//
//  UITextView+Padding.swift
//  The Division
//
//  Created by MTMAC16 on 14/08/18.
//  Copyright © 2018 bism. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
    
    func addDoneButton(picker: UIPickerView) {
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: picker.frame.height, width: UIScreen.main.bounds.width, height: 40))
        let btnDone = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonDidTap))
        
        toolbar.setItems([btnDone], animated: true)
        self.inputAccessoryView = toolbar
    }
    
    @objc func doneButtonDidTap() {
        self.resignFirstResponder()
    }
}
