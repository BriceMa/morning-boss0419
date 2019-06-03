//
//  ValidateController.swift
//  morning-boss0419
//
//  Created by Brice on 16/05/2019.
//  Copyright © 2019 Brice Mangeat. All rights reserved.
//

import UIKit

class InformationController: UIViewController {
    
    private var _segueToPaymentChoose = "toPaymentChoose"
    private var _segueToHome = "toHome"

    @IBOutlet weak var nameUser: UITextField!
    @IBOutlet weak var adressUser: UITextField!
    @IBOutlet weak var townUser: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


    @IBAction func nextBtn(_ sender: Any) {
        performSegue(withIdentifier: _segueToPaymentChoose, sender: nil)
    }
    
    
    @IBAction func homeBtn(_ sender: Any) {
        performSegue(withIdentifier: _segueToHome, sender: nil)
        
    }
    
}

