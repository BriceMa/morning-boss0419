import AVFoundation
import UIKit


class HomeController: UIViewController {

    @IBOutlet var container: UIView!
    @IBOutlet weak var selectButton: UIImageView!
    @IBOutlet weak var ellipseBg: UIImageView!
    @IBOutlet weak var homeBtn: UIButton!
    
    @IBOutlet weak var menuIV: UIImageView!
    @IBOutlet weak var prod1Lbl: UILabel!
    @IBOutlet weak var prod2Lbl: UILabel!
    @IBOutlet weak var prod3Lbl: UILabel!
    
    
    
    private var _segueDeclinateMenu = "declinateMenu"
    private var _segueValidateMenu = "validateMenu"
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        homeBtn.isEnabled = false
        homeBtn.alpha = 0.5
        selectButton.isUserInteractionEnabled = true
        
        MenuService.retrieveMenus(success: { menus in
            self.prod1Lbl.text = menus[0].products?[0].name
            self.prod2Lbl.text = menus[0].products?[1].name
            self.prod3Lbl.text = menus[0].products?[2].name
            self.menuIV.download(menus[0].imgMenu?.url ?? "")

        }) { (Error) in
            print("error")
        }
        
        
        
        
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if
            let touch = touches.first,
            touch.view == selectButton
        {
            let yPosition = touch.location(in: container).y
            let distance = container.frame.midY - yPosition
            selectButton.center.y = yPosition 

            
            if distance > 60 {
                selectButton.image = UIImage(named: "arrowsButtonRed")

                if distance > 100{
                    Vibration.error.vibrate()
                    performSegue(withIdentifier: _segueDeclinateMenu, sender: nil)
                }
            } else if  distance < -60 {
                selectButton.image = UIImage(named: "arrowsButtonGreen")
                if distance < -100{
                    Vibration.success.vibrate()
                    performSegue(withIdentifier: _segueValidateMenu, sender: nil)
                }
            }else if distance >= -60 && distance <= 60{
                selectButton.image = UIImage(named: "arrowsButtons")

            }
        }
    }
    
    @IBAction func profileBtn(_ sender: Any) {
        self.toastMessage("Cette fonctionnalité n'est pas disponible actuellement.")
        Vibration.light.vibrate()
    }
    
    @IBAction func orderBtn(_ sender: Any) {
        self.toastMessage("Cette fonctionnalité n'est pas disponible actuellement.")
        Vibration.light.vibrate()
    }
    
    
}

extension UIViewController{
    enum Vibration {
        case error
        case success
        case warning
        case light
        case medium
        case heavy
        case selection
        case oldSchool
        
        func vibrate() {
            
            switch self {
            case .error:
                let generator = UINotificationFeedbackGenerator()
                generator.notificationOccurred(.error)
                
            case .success:
                let generator = UINotificationFeedbackGenerator()
                generator.notificationOccurred(.success)
                
            case .warning:
                let generator = UINotificationFeedbackGenerator()
                generator.notificationOccurred(.warning)
                
            case .light:
                let generator = UIImpactFeedbackGenerator(style: .light)
                generator.impactOccurred()
                
            case .medium:
                let generator = UIImpactFeedbackGenerator(style: .medium)
                generator.impactOccurred()
                
            case .heavy:
                let generator = UIImpactFeedbackGenerator(style: .heavy)
                generator.impactOccurred()
                
            case .selection:
                let generator = UISelectionFeedbackGenerator()
                generator.selectionChanged()
                
            case .oldSchool:
                AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
            }
            
        }
        
    }
    
        func toastMessage(_ message: String){
            guard let window = UIApplication.shared.keyWindow else {return}
            let messageLbl = UILabel()
            messageLbl.text = message
            messageLbl.textAlignment = .center
            messageLbl.font = UIFont.systemFont(ofSize: 12)
            messageLbl.textColor = .white
            messageLbl.backgroundColor = UIColor(white: 0, alpha: 0.5)
            
            let textSize:CGSize = messageLbl.intrinsicContentSize
            let labelWidth = min(textSize.width, window.frame.width - 40)
            
            messageLbl.frame = CGRect(x: 20, y: window.frame.height - 90, width: labelWidth + 30, height: textSize.height + 20)
            messageLbl.center.x = window.center.x
            messageLbl.layer.cornerRadius = messageLbl.frame.height/2
            messageLbl.layer.masksToBounds = true
            window.addSubview(messageLbl)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                
                UIView.animate(withDuration: 1, animations: {
                    messageLbl.alpha = 0
                }) { (_) in
                    messageLbl.removeFromSuperview()
                }
            }
        }
}

