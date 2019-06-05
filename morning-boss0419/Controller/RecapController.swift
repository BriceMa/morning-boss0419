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

        timeTxtField.text = self.time
        addressTxtField.text = self.address
        townTxtField.text = self.town

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == _toEnd) {
            let endVC = segue.destination as! EndOrderController
            endVC.name = self.name
            endVC.address = self.address
            endVC.town = self.town
            endVC.time = self.time
        }
    }
    
    @IBAction func toCreditCard(_ sender: Any) {
        performSegue(withIdentifier: _toCreditCard, sender: nil)
    }
    @IBAction func toEnd(_ sender: Any) {
        performSegue(withIdentifier: _toEnd, sender: nil)
    }
    
}
