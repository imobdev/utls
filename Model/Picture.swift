//
//  Picture.swift
//  mvvm_pract
//
//  Created by Rajat Agarwal on 16/01/18.
//  Copyright © 2018 Rajat. All rights reserved.
//

import UIKit
import ObjectMapper

class Picture: Mappable {

    var large:String?
    var medium:String?
    var thumbnail:String?
    
    required init?(map:Map)
    {
        
    }
    
    func mapping(map:Map)
    {
       large <- map["large"]
       medium <- map["medium"]
       thumbnail <- map["thumbnail"]
    }
}
