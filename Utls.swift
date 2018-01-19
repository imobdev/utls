//
//  Utls.swift
//  mvvm_pract
//
//  Created by Rajat Agarwal on 20/01/18.
//  Copyright © 2018 Rajat. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

//pod ‘Alamofire’
//pod 'AlamofireObjectMapper'
typealias Completed = (_ success:Bool,_ data:[String:Any]) -> ()
class Utls: NSObject {
    var userModel = [UsersModel]()
    
    static var shared = Utls()
    private override init()
    {
        
    }
    func getValueAlamofire(_ url:String , complete : @escaping Downloadcomplete)
    {
        Alamofire.request(url).responseObject{(response:DataResponse<UserResponse>) in
            
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
    //func getData(_ url:String,Completed : @escaping (Bool,[String:Any]) -> ())
    func getData(_ url:String , completed : @escaping Completed)
    {
        let task = URLSession.shared.dataTask(with: URL(string:url)!) { (data, response, error) in
            guard let unwrappedData = data else {return}
            do
            {
                let json = try JSONSerialization.jsonObject(with: unwrappedData, options: [])
                if let object = json as? [String:Any]
                {
                    completed(true , object)
                    //print(object)
                }
                else if let object = json as? [Any]
                {
                    print(object)
                }
                else
                {
                    print("json is invalid")
                }
            }
            catch
            {
                print(error.localizedDescription)
            }
            
        }
        task.resume()
    }
    
    func getDataAlamofire(_ url: String, completed: @escaping (Bool ,[String : Any]) -> () )
    {
        Alamofire.request("https://api.randomuser.me/?results=10&nat=e" , method: .get ,parameters:["":""] , encoding: JSONEncoding.default ,headers : nil).responseJSON
            { response in
                if String(describing:response.result ) == "SUCCESS"
                {
                    //print(response)
                    if let object = response.result.value as? [Any]
                    {
                        print(object)
                    }
                    else if let object = response.result.value as? [String:Any]
                    {
                        //print(object)
                        completed(true , object)
                    }
                    else
                    {
                        print("Invalid JSon")
                    }
                }
                else
                {
                    print("error")
                }
        }
    }
    
}
