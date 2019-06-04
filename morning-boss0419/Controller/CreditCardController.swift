//
//  CreditCardController.swift
//  morning-boss0419
//
//  Created by Brice on 02/06/2019.
//  Copyright © 2019 Brice Mangeat. All rights reserved.
//

import UIKit
import PayCardsRecognizer


class CreditCardController: UIViewController {
    
    var name: String?
    var address: String?
    var town: String?
    var time: String?
    
    var recognizer: PayCardsRecognizer!
    private var _toPaymentChoose = "toPaymentChoose"
    private var _toRecap = "toRecap"


    override func viewDidLoad() {
        super.viewDidLoad()
               
        hideKeyboardWhenTappedAround()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == _toRecap) {
            let recapVC = segue.destination as! RecapController
            recapVC.name = self.name
            recapVC.address = self.address
            recapVC.town = self.town
            recapVC.time = self.time
        }
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height/2
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    


    @IBAction func cardDetect(_ sender: Any) {
        recognizer.startCamera()
    }
    
    @IBAction func toPaymentChoose(_ sender: Any) {
        performSegue(withIdentifier: _toPaymentChoose, sender: nil)
    }
    
    @IBAction func toRecap(_ sender: Any) {
        performSegue(withIdentifier: _toRecap, sender: nil)
    }
}

