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
            
            
//            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8){
//                print("Data: \(utf8Text)")
//                success(utf8Text as! [Menu] )
//            }

            
            
            switch response.result {
            case .success(let value):
                let menus = value
                print(menus)
                //success(menus as! [Menu])
                break

            case .failure(let error):
                failure(error)
                break
            }
            

        }
        
        
        

    }
}
