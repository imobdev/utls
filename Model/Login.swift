//
//  Login.swift
//  mvvm_pract
//
//  Created by Rajat Agarwal on 16/01/18.
//  Copyright © 2018 Rajat. All rights reserved.
//

import UIKit
import ObjectMapper

class Login: Mappable {

    var userName:String?
    var password:String?
    
    required init?(map:Map){
        
    }
    func mapping(map:Map)
    {
       userName <- map["userName"]
       password <- map["password"]
    }
}
