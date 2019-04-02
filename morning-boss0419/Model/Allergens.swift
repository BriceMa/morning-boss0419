import UIKit

class Allergens {
    private var _gluten: Bool
    private var _lactose: Bool
    private var _vegan: Bool
    
    var gluten: Bool {return _gluten}
    var lactose: Bool {return _lactose}
    var vegan: Bool {return _vegan}
    
    init(gluten: Bool, lactose: Bool, vegan: Bool) {
        _gluten = gluten
        _lactose = lactose
        _vegan = vegan
    }
}
