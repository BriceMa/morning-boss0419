import UIKit
import PayCardsRecognizer


class CreditCardController: UIViewController {
    
    @IBOutlet weak var titulaireTxtField: UITextField!
    @IBOutlet weak var numberTxtField: UITextField!
    @IBOutlet weak var expTxtField: UITextField!
    @IBOutlet weak var nextOutletBtn: UIButton!
    
    
    var name: String?
    var address: String?
    var town: String?
    var time: String?
    
    var recognizer: PayCardsRecognizer!
    var result: PayCardsRecognizerResult?

    private var _toPaymentChoose = "toPaymentChoose"
    private var _toRecap = "toRecap"
    private var _toRecognizer = "toRecognizer"


    override func viewDidLoad() {
        super.viewDidLoad()

        nextOutletBtn.isEnabled = false

        


        if result != nil{
            self.titulaireTxtField.text = result?.recognizedHolderName
            self.numberTxtField.text = result?.recognizedNumber?.format(" ")
            
            if let month = result?.recognizedExpireDateMonth, let year = result?.recognizedExpireDateYear {
                expTxtField.text = String(format: "%@/%@", month, year)
            }
        }
        
        hideKeyboardWhenTappedAround()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == _toRecap) {
            let recapVC = segue.destination as! RecapController
            recapVC.name = self.name
            recapVC.address = self.address
            recapVC.town = self.town
            recapVC.time = self.time
        }
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height/2
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
        
        checkTextFields()
    }
    
    func checkTextFields() {
        guard
            let nameCard = titulaireTxtField.text, !nameCard.isEmpty,
            let numberCard = numberTxtField.text, !numberCard.isEmpty,
            let expCard = expTxtField.text, !expCard.isEmpty
            else {
                nextOutletBtn.isEnabled = false
                nextOutletBtn.alpha = 0.5
                return
        }
        nextOutletBtn.isEnabled = true
        nextOutletBtn.alpha = 1
    }
    
  
    


    @IBAction func cardDetect(_ sender: Any) {
        performSegue(withIdentifier: _toRecognizer, sender: nil)
    }
    
    @IBAction func toPaymentChoose(_ sender: Any) {
        performSegue(withIdentifier: _toPaymentChoose, sender: nil)
    }
    
    @IBAction func toRecapBtn(_ sender: Any) {
        performSegue(withIdentifier: _toRecap, sender: nil)
    }
    
}

