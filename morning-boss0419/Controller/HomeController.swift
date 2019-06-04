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
}

