//
//  ValidateController.swift
//  morning-boss0419
//
//  Created by Brice on 16/05/2019.
//  Copyright © 2019 Brice Mangeat. All rights reserved.
//

import UIKit

class InformationController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    private var _segueToPaymentChoose = "toPaymentChoose"
    private var _segueToHome = "toHome"
    var pickerData: [String] = [String]()
    let thePicker = UIPickerView()

    @IBOutlet weak var nameUser: UITextField!
    @IBOutlet weak var adressUser: UITextField!
    @IBOutlet weak var townUser: UITextField!
    @IBOutlet weak var hourTextField: UITextField!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.thePicker.delegate = self
        self.thePicker.dataSource = self
        pickerData = ["6:30","7:00","7:30","8:00","8:30","9:00","9:30","10:00","10:30"]
        hourTextField.inputView = thePicker
        
        hideKeyboardWhenTappedAround()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == _segueToPaymentChoose) {
            let paymentChoiceVC = segue.destination as! PaymentChoiceController
            paymentChoiceVC.name = nameUser.text
            paymentChoiceVC.address = adressUser.text
            paymentChoiceVC.town = townUser.text
            paymentChoiceVC.time = hourTextField.text
        }
    }


    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height/2
            }
        }
    }

    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
  
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        hourTextField.text = pickerData[row]
    }
    
 
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }

    @IBAction func nextBtn(_ sender: Any) {
        performSegue(withIdentifier: _segueToPaymentChoose, sender: nil)
    
    }
    
    
    @IBAction func homeBtn(_ sender: Any) {
        performSegue(withIdentifier: _segueToHome, sender: nil)
        
    }
    
}




extension UIViewController{
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}


