//
//  EndOrderController.swift
//  morning-boss0419
//
//  Created by Brice on 02/06/2019.
//  Copyright © 2019 Brice Mangeat. All rights reserved.
//

import UIKit

class EndOrderController: UIViewController {

    private var _toHome = "toHome"
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func toHomeEnd(_ sender: Any) {
        performSegue(withIdentifier: _toHome, sender: nil)
    }
    @IBAction func toHome(_ sender: Any) {
        performSegue(withIdentifier: _toHome, sender: nil)
    }
}
