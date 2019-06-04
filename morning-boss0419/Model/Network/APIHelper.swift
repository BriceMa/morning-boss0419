//
//  APIHelper.swift
//  morning-boss0419
//
//  Created by Brice on 02/06/2019.
//  Copyright © 2019 Brice Mangeat. All rights reserved.
//

import Foundation


//
//typealias ApiCompletion = ( _ Menu: APIMenu?, _ errorString: String?) -> Void
//
//class APIHelper {
//    private let _baseUrl = "https://morning-api.herokuapp.com/"
//    
//    var urlMenu: String {
//        return _baseUrl + "menus/"
//    }
//    
//    func getMenus(_ string: String, completion: ApiCompletion?){
//        if let url = URL(string: string){
//            URLSession.shared.dataTask(with: url) { (data, response, error) in
//                if error != nil {
//                    completion?(nil, error!.localizedDescription)
//                }
//                
//                if data != nil {
//                    do {
//                        let responseJSON = try JSONDecoder().decode(APIMenu.self, from: data!)
//                        completion?(responseJSON, nil)
//                    } catch {
//                        completion?(nil, error.localizedDescription)
//                    }
//                } else {
//                    completion?(nil, "Aucune Data dispo")
//
//                }
//            }.resume()
//        } else {
//            completion?(nil, "Url Invalide")
//        }
//    }
//}
