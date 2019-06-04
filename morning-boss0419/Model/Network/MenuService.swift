//
//  MenuService.swift
//  morning-boss0419
//
//  Created by Brice on 03/06/2019.
//  Copyright © 2019 Brice Mangeat. All rights reserved.
//

import Foundation
import Alamofire

class MenuService {
    typealias SuccessMenu = (_ menus: [Menu]) -> ()
    typealias ErrorMenu = (_ error: Error) -> ()
    
    static func retrieveMenus(success: @escaping SuccessMenu,
                              failure: @escaping ErrorMenu){
        let url = "https://morning-api.herokuapp.com/menus"
        
        AF.request(url).responseJSON { response in
            
            if let data = response.data {
                do {
                    let menus = try JSONDecoder().decode([Menu].self, from: data)
                    
                    success(menus)
                } catch let e {
                    failure(e)
                }
            }
        }
        
        
        

    }
}
