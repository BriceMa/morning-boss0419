//
//  RecapController.swift
//  morning-boss0419
//
//  Created by Brice on 02/06/2019.
//  Copyright © 2019 Brice Mangeat. All rights reserved.
//

import UIKit

class RecapController: UIViewController {
    
    private var _toCreditCard = "toCreditCard"
    private var _toEnd = "toEnd"
    
    var name: String?
    var address: String?
    var town: String?
    var time: String?

    @IBOutlet weak var timeTxtField: UILabel!
    @IBOutlet weak var addressTxtField: UILabel!
    @IBOutlet weak var townTxtField: UILabel!
    @IBOutlet weak var nextOutletBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextOutletBtn.isEnabled = false

                
        timeTxtField.text = self.time
        addressTxtField.text = self.address
        townTxtField.text = self.town

    }
    
    @IBAction func toEnd(_ sender: Any) {
        performSegue(withIdentifier: _toEnd, sender: nil)
    }
    
    @IBAction func toCreditCard(_ sender: Any) {
        performSegue(withIdentifier: _toCreditCard, sender: nil)
    }
}
