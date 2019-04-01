//
//  User.swift
//  morning-boss0419
//
//  Created by Brice on 01/04/2019.
//  Copyright © 2019 Brice Mangeat. All rights reserved.
//

import Foundation

class User {
    private var _prenom: String
    private var _nom: String
    private var _mail: String
    private var _tel: String
    private var _password: String
    var lieu: Lieu?
    
    var prenom: String {return _prenom}
    var nom: String {return _nom}
    var mail: String {return _mail}
    var tel: String {return _tel}
    var password: String {return _password}
    
    init(prenom: String, nom: String, mail:String, tel: String, password: String, lieu: Lieu?) {
        _prenom = prenom
        _nom = nom
        _mail = mail
        _tel = tel
        _password = password
        self.lieu = lieu
    }
}
