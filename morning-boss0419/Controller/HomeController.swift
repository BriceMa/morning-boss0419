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
                    
                    performSegue(withIdentifier: _segueDeclinateMenu, sender: nil)
                }
            } else if  distance < -60 {
                selectButton.image = UIImage(named: "arrowsButtonGreen")
                if distance < -100{
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
    

}

