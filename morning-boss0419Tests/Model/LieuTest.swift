//
//  LieuTest.swift
//  morning-boss0419Tests
//
//  Created by Brice on 01/04/2019.
//  Copyright © 2019 Brice Mangeat. All rights reserved.
//

import XCTest
@testable import morning_boss0419

class LieuTest: XCTestCase {
    
    
    func testInitLieu() {
            let lieu = Lieu(ville: "Montreuil", codepostal: "93100", numero: "27Bis", nom: "Rue du progrès",  indications: "Ceci permet d'apporter des détails sur la commande")
            
            XCTAssertEqual("Montreuil", lieu.ville)
            XCTAssertEqual("93100", lieu.codepostal)
            XCTAssertEqual("27Bis", lieu.numero)
            XCTAssertEqual("Rue du progrès", lieu.nom)
            XCTAssertEqual("Ceci permet d'apporter des détails sur la commande", lieu.indications)
    }

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }


    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
