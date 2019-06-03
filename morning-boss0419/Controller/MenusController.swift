//
//  DeclineController.swift
//  morning-boss0419
//
//  Created by Brice on 02/04/2019.
//  Copyright © 2019 Brice Mangeat. All rights reserved.
//

import UIKit

class MenusController: UIViewController {
    
    private var _segueToHome = "toHome"
    var menus:Any = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        MenuService.retrieveMenus(success: { (dataMenus) in
            self.menus = dataMenus
            //print(self.menus)
            
            
        }) { (Error) in
            print("error")
        }
       
    }
    
    

    @IBAction func toHome(_ sender: Any) {
        performSegue(withIdentifier: _segueToHome, sender: nil)
    }
    
}

extension UIViewController: UICollectionViewDataSource{
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuCell.identifier , for: indexPath) as! MenuCell
        return cell
    }

    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
}
