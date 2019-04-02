import UIKit

class Product {
    private var _name: String
    private var _shortdesc: String
    private var _longdesc: String
    private var _image: UIImage
    private var _categorie: String
    var allergens: Allergens?
    
    var name: String {return _name}
    var shortdesc: String {return _shortdesc}
    var longdesc: String {return _longdesc}
    var image: UIImage {return _image}
    var categorie: String {return _categorie}
    
    init(name: String, shortdesc: String, longdesc: String, categorie: String, image: UIImage, allergens: Allergens?) {
        _name = name
        _shortdesc = shortdesc
        _longdesc = longdesc
        _categorie = categorie
        _image = image
        self.allergens = allergens
    }
}
