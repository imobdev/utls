//
//  UsersModel.swift
//  mvvm_pract
//
//  Created by Rajat Agarwal on 16/01/18.
//  Copyright © 2018 Rajat. All rights reserved.
//

import UIKit
import ObjectMapper

class UsersModel: Mappable {
    
    
    var email:String?
    var gender:String?
    var dob:String?
    var registered:String?
    var phone:String?
    var cell:String?
    
    var name:Name?
    var location:Location?
    var login:Login?
    var picture:Picture?
    
    required init?(map:Map)
    {
        
    }
    
    func mapping(map: Map) {
        gender <- map["gender"]
        email <- map["email"]
        dob <- map["dob"]
        registered <- map["regisered"]
        phone <- map["phone"]
        cell <- map["cell"]
        
        name <- map["name"]
        location <- map["location"]
        login <- map["login"]
        picture <- map["picture"]
    }
    
    
    

}
