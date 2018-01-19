//
//  APiClient.swift
//  mvvm_pract
//
//  Created by Rajat Agarwal on 16/01/18.
//  Copyright © 2018 Rajat. All rights reserved.
//

import UIKit
import AlamofireObjectMapper
import Alamofire

class APiClient: NSObject {
    var userModel = [UsersModel]()
    
    func getValueAlamofire(complete : @escaping Downloadcomplete)
    {
        Alamofire.request("https://api.randomuser.me/?results=10&nat=e").responseObject{(response:DataResponse<UserResponse>) in
            
            let list = response.result.value
            if let userModel =  list?.userModelList
            {
                
                for(_,user) in userModel.enumerated()
                {
                    self.userModel.append(user)
                }
            }
            complete()
        }
    }
}
