import UIKit

class MenusController: UIViewController {
    
    private var _segueToHome = "toHome"
    var menus = [Menu]()
    
    @IBOutlet weak var collectionView: UICollectionView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
