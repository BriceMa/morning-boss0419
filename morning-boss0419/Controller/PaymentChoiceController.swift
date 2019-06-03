//
//  PaymentChoiceController.swift
//  morning-boss0419
//
//  Created by Brice on 02/06/2019.
//  Copyright © 2019 Brice Mangeat. All rights reserved.
//

import UIKit

class PaymentChoiceController: UIViewController {
    
    private var _toInformation = "toInformation"
    private var _toCreditCard = "toCreditCard"

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func nextBtn(_ sender: Any) {
        performSegue(withIdentifier: _toCreditCard, sender: nil)

    }
    @IBAction func backBtn(_ sender: Any) {
        performSegue(withIdentifier: _toInformation, sender: nil)
    }
}
