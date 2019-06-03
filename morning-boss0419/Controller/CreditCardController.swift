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
    
    var recognizer: PayCardsRecognizer!
    private var _toPaymentChoose = "toPaymentChoose"


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


    @IBAction func cardDetect(_ sender: Any) {
        recognizer.startCamera()
    }
    
    @IBAction func toPaymentChoose(_ sender: Any) {
        performSegue(withIdentifier: _toPaymentChoose, sender: nil)
    }
}
