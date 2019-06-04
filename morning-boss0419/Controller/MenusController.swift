import UIKit

class MenusController: UIViewController {
    
    private var _segueToHome = "toHome"
    var menus = [Menu]()
    
    @IBOutlet weak var collectionView: UICollectionView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.layer.shadowOffset = CGSize(width: 0, height: 0)
        collectionView.layer.shadowColor = UIColor(displayP3Red: 129, green: 129, blue: 129, alpha: 0.1).cgColor
        collectionView.layer.shadowRadius = 15
        
        MenuService.retrieveMenus(success: { menus in

            self.menus = menus
            self.collectionView.reloadData()
        }) { (Error) in
            print("error")
        }
       
    }
    
    

    @IBAction func toHome(_ sender: Any) {
        performSegue(withIdentifier: _segueToHome, sender: nil)
    }
    
}

extension MenusController: UICollectionViewDataSource{
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuCell.identifier , for: indexPath) as? MenuCell {
            
            cell.setupCell(self.menus[indexPath.row])
            
            return cell

        }
        return UICollectionViewCell()
        
    }

    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menus.count
    }
}
