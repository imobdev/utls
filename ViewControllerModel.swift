//
//  ViewControllerModel.swift
//  mvvm_pract
//
//  Created by Rajat Agarwal on 16/01/18.
//  Copyright © 2018 Rajat. All rights reserved.
//

import UIKit
import AlamofireObjectMapper
import Alamofire


typealias Downloadcomplete = () -> ()
class ViewControllerModel: NSObject {

    var userModel = [UsersModel]()
    @IBOutlet weak var apiClient:APiClient!
    
    func getUser(complete:@escaping Downloadcomplete)
    {
        self.apiClient.getValueAlamofire{
            self.userModel = self.apiClient.userModel
            complete()
        }
    }
    
    
}
