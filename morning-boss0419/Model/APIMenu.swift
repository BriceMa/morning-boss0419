//
//  APIMenu.swift
//  morning-boss0419
//
//  Created by Brice on 02/06/2019.
//  Copyright © 2019 Brice Mangeat. All rights reserved.
//

import Foundation

struct Menu {
    var __v: Int
    var _id: String
    var createdAt: String
    var id: String
    var imgMenu: ImgMenu
    var products: [Produit]
    var updatedAt: String
}

struct Produit{
    var name: String
    var shortDesc: String
    var longDesc: String
    var categorie: String
    var _id: String
    var createdAt: String
    var updatedAt: String
    var __v: Int
    var id: String
    var imageProduct: String
    var allergens: String
}

struct ImgMenu{
    var __v: Int
    var _id: String
    var createdAt: String
    var ext: String
    var hash: String
    var id: String
    var mime: String
    var name: String

    var provider: String
    var related: [String]
    var sha256: String
    var size: String
    var updateAt: String
    var url: String

}

