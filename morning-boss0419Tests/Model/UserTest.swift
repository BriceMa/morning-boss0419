//
//  UserTest.swift
//  morning-boss0419Tests
//
//  Created by Brice on 01/04/2019.
//  Copyright © 2019 Brice Mangeat. All rights reserved.
//

import XCTest
@testable import morning_boss0419

class UserTest: XCTestCase {
    
    func testInitUser(){
        
        let lieu = Lieu(ville: "Montreuil", codepostal: "93100", numero: "27Bis", nom: "Rue du progrès",  indications: "Ceci permet d'apporter des détails sur la commande")
        
        let user = User(prenom: "PrenomTest", nom: "NomTest", mail: "mail@itest.fr", tel:"0000000000", password:"passwordTest", lieu: lieu)
        
        XCTAssertEqual("PrenomTest", user.prenom)
        XCTAssertEqual("NomTest", user.nom)
        XCTAssertEqual("mail@test.fr", user.mail)
        XCTAssertEqual("0000000000", user.tel)
        XCTAssertEqual("passwordTest", user.password)
    }
    
    override func setUp() {
    }
    
    override func tearDown() {
        
    }
    
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
