//
//  Lieu.swift
//  morning-boss0419
//
//  Created by Brice on 01/04/2019.
//  Copyright © 2019 Brice Mangeat. All rights reserved.
//

import Foundation
import CoreLocation



class Lieu {
    private var _ville: String
    private var _codepostal: String
    private var _numero: String
    private var _nom: String
    private var _indications: String
    
    var ville: String {return _ville}
    var codepostal: String {return _codepostal}
    var numero: String {return _numero}
    var nom: String {return _nom}
    var indications: String {return _indications}

    
    
    init(ville: String, codepostal: String, numero: String, nom: String, indications: String) {
        _ville = ville
        _codepostal = codepostal
        _numero = numero
        _nom = nom
        _indications = indications
    }
}
