//
//  EndOrderController.swift
//  morning-boss0419
//
//  Created by Brice on 02/06/2019.
//  Copyright © 2019 Brice Mangeat. All rights reserved.
//

import UIKit
import UserNotifications

class EndOrderController: UIViewController {

    private var _toHome = "toHome"
    
    var name: String?
    var address: String?
    var town: String?
    var time: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let center = UNUserNotificationCenter.current()
        
        let content = UNMutableNotificationContent()
        
        content.title = "Votre commande a bien été enregistrée !"
        content.subtitle = "Merci pour votre commande, \(name!)"
        content.body = "Vous receptionnerez votre commande au \(address!) à \(town!) pour \(time!)."
        content.sound = UNNotificationSound.default
        
        content.threadIdentifier = "local-notifications temp"
        
        let date = Date(timeIntervalSinceNow: 1)
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        let request = UNNotificationRequest(identifier: "content", content: content, trigger: trigger)
        center.add(request) { (err) in
            if err != nil{
                print(err)
            }
        }

    }
    @IBAction func toHomeEnd(_ sender: Any) {
        performSegue(withIdentifier: _toHome, sender: nil)
    }
    @IBAction func toHome(_ sender: Any) {
        performSegue(withIdentifier: _toHome, sender: nil)
    }
}


