//
//  Name.swift
//  mvvm_pract
//
//  Created by Rajat Agarwal on 16/01/18.
//  Copyright © 2018 Rajat. All rights reserved.
//

import UIKit
import ObjectMapper

class Name: Mappable {

    var title:String?
    var first:String?
    var last:String?
    
    required init?(map:Map){
        
    }
    func mapping(map:Map)
    {
       title <- map["title"]
       first <- map["first"]
       last <- map["last"]
    }
    
    func getFullName() ->String
    {
        return title! + " : " + first! + " " + last!
    }
}
