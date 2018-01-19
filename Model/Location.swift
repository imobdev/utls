//
//  Location.swift
//  mvvm_pract
//
//  Created by Rajat Agarwal on 16/01/18.
//  Copyright © 2018 Rajat. All rights reserved.
//

import UIKit
import ObjectMapper

class Location: Mappable {

    var street:String?
    var city:String?
    var state:String?
    var postCode:String?
    
    required init?(map:Map){
        
    }
    func mapping(map:Map)
    {
        street <- map["street"]
        city <- map["city"]
        state <- map["state"]
        postCode <- map["postcode"]
    }
}
