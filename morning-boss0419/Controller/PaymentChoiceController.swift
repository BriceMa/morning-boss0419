import UIKit

class PaymentChoiceController: UIViewController {
    
    private var _toInformation = "toInformation"
    private var _toCreditCard = "toCreditCard"
    
    var name: String?
    var address: String?
    var town: String?
    var time: String?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == _toCreditCard) {
            let creditCardVC = segue.destination as! CreditCardController
            creditCardVC.name = self.name
            creditCardVC.address = self.address
            creditCardVC.town = self.town
            creditCardVC.time = self.time
        }
    }
    
    @IBAction func nextBtn(_ sender: Any) {
        performSegue(withIdentifier: _toCreditCard, sender: nil)
    }
    @IBAction func backBtn(_ sender: Any) {
        performSegue(withIdentifier: _toInformation, sender: nil)
    }
}
