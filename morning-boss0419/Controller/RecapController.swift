//
//  RecapController.swift
//  morning-boss0419
//
//  Created by Brice on 02/06/2019.
//  Copyright © 2019 Brice Mangeat. All rights reserved.
//

import UIKit

class RecapController: UIViewController {
    
    var name: String?
    var address: String?
    var town: String?
    var time: String?

    @IBOutlet weak var timeTxtField: UILabel!
    @IBOutlet weak var addressTxtField: UILabel!
    @IBOutlet weak var townTxtField: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(address)
        
        timeTxtField.text = self.time
        addressTxtField.text = self.address
        townTxtField.text = self.town

    }
    

}
