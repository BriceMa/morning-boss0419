//
//  ViewController.swift
//  morning-boss0419
//
//  Created by Brice on 01/04/2019.
//  Copyright © 2019 Brice Mangeat. All rights reserved.
//

import AVFoundation
import UIKit


class HomeController: UIViewController {

    @IBOutlet var container: UIView!
    @IBOutlet weak var selectButton: UIImageView!
    @IBOutlet weak var ellipseBg: UIImageView!
    
    private var _segueDeclinateMenu = "declinateMenu"
    private var _segueValidateMenu = "validateMenu"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        selectButton.isUserInteractionEnabled = true
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if
            let touch = touches.first,
            touch.view == selectButton
        {
            let yPosition = touch.location(in: container).y
            let distance = container.frame.midY - yPosition

            selectButton.center.y = yPosition 

            
            // Changement de content de l'image selon la position
            
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
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if
            let touch = touches.first,
            touch.view == selectButton
        {
            
            // Remettre à la position initiale
        }
    }
    
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


