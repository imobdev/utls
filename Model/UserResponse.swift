//
//  UserResponse.swift
//  mvvm_pract
//
//  Created by Rajat Agarwal on 17/01/18.
//  Copyright © 2018 Rajat. All rights reserved.
//

import UIKit
import ObjectMapper

class UserResponse: Mappable {
    var userModelList: [UsersModel]?
    
    required init?(map:Map)
    {
        
    }
    func mapping(map: Map) {
        userModelList <- map["results"]
 }
    
}
