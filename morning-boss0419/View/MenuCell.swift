import UIKit

class MenuCell: UICollectionViewCell {
    
    
    @IBOutlet weak var imgMenu: UIImageView!
    @IBOutlet weak var nameMenu: UILabel!
    @IBOutlet weak var firstProductMenu: UILabel!
    @IBOutlet weak var secondProductMenu: UILabel!
    @IBOutlet weak var thirdProductMenu: UILabel!
    
    
    
    static let identifier = "card_identifier"
    
    var menu: Menu!
    
    func setupCell (_ menu: Menu){
        self.menu = menu
        self.nameMenu.text = "Daily Combo"
        self.imgMenu.download(self.menu.imgMenu?.url ?? "")
        self.firstProductMenu.text = self.menu.products?[0].name
        self.secondProductMenu.text = self.menu.products?[1].name
        self.thirdProductMenu.text = self.menu.products?[2].name
    }

}


extension UIImageView {
    
    func download(_ urlString: String) {
        guard let url = URL(string: "https://morning-api.herokuapp.com" + urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let imageData = data, let image = UIImage(data: imageData) else { return }
            DispatchQueue.main.async {
                self.image = image
            }
            }.resume()
    }
    
}
