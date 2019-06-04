//
//  RecognizerViewController.swift
//  morning-boss0419
//
//  Created by Brice on 04/06/2019.
//  Copyright © 2019 Brice Mangeat. All rights reserved.
//

import UIKit
import PayCardsRecognizer


class RecognizerViewController: UIViewController, PayCardsRecognizerPlatformDelegate {

    
    private var _toCreditCard = "toCreditCard"
    var recognizer: PayCardsRecognizer!
    
    @IBOutlet weak var recognizerContainer: UIView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        recognizer = PayCardsRecognizer(delegate: self, resultMode: .async, container: recognizerContainer, frameColor: .green)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        recognizer.startCamera()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        recognizer.stopCamera()
    }
    
    func payCardsRecognizer(_ payCardsRecognizer: PayCardsRecognizer, didRecognize result: PayCardsRecognizerResult) {
   
        
        
        if result.isCompleted {
            performSegue(withIdentifier: _toCreditCard, sender: result)
        } else {
            print("erreur de reconnaissance")
        }
    }
    
    @IBAction func start() {
        recognizer.startCamera()
    }
    
    @IBAction func stop() {
        recognizer.stopCamera()
    }
    
    @IBAction func restart() {
        recognizer.resumeRecognizer()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! CreditCardController
        vc.result = sender as? PayCardsRecognizerResult
    }



}

extension String {
    
    public func format(_ seprator: String) -> String {
        let src = self
        var dst = [String]()
        var i = 1
        for char in src {
            let mod = i % 4
            dst.append(String(char))
            if mod == 0 {
                dst.append(seprator)
            }
            i += 1
        }
        return dst.joined(separator: "")
    }
    
}
