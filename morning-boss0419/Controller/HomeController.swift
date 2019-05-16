//
//  ViewController.swift
//  morning-boss0419
//
//  Created by Brice on 01/04/2019.
//  Copyright © 2019 Brice Mangeat. All rights reserved.
//

import UIKit

class HomeController: UIViewController {

    @IBOutlet var container: UIView!
    @IBOutlet weak var selectButton: UIImageView!
    @IBOutlet weak var ellipseBg: UIImageView!
    
    var segueDeclinateMenu = "declinateMenu"
    var segueValidateMenu = "validateMenu"
    
    
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
            
//            selectButton.layer.anchorPoint = CGPoint(
//                x: selectButton.center.x + self.ellipseBg.frame.width,
//                y: selectButton.center.y)
//            selectButton?.transform = CGAffineTransform(rotationAngle: -distance/360)

            selectButton.center.y = yPosition 

            print(distance)
            
            // Changement de content de l'image selon la position
            
            if distance > 60 {
                selectButton.image = UIImage(named: "arrowsButtonRed")

                if distance > 100{
                    
                    performSegue(withIdentifier: segueDeclinateMenu, sender: nil)
                }
            } else if  distance < -60 {
                selectButton.image = UIImage(named: "arrowsButtonGreen")
                if distance < -100{
                    performSegue(withIdentifier: segueValidateMenu, sender: nil)
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
    

}

