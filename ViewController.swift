//
//  ViewController.swift
//  mvvm_pract
//
//  Created by Rajat Agarwal on 16/01/18.
//  Copyright © 2018 Rajat. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

class ViewController: UIViewController ,UITableViewDelegate , UITableViewDataSource {

    var userModel : [UsersModel] = []
    
    @IBOutlet weak var userViewModel : ViewControllerModel!
    @IBOutlet weak var tableView:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //downloadData()
        //print(Cons.shared.rajat())
        //checkinClosure()
        Utls.shared.getData("https://api.randomuser.me/?results=10&nat=e", completed: { (Success , response) in
            print(response)
        })
        Utls.shared.getDataAlamofire("https://api.randomuser.me/?results=10&nat=e") { (Success,response) in
            print(response)
        }
    }
    
    func tableView(_ tableView:UITableView ,numberOfRowsInSection section:Int) -> Int
    {
        return userModel.count
    }
    func tableView(_ tableView:UITableView , cellForRowAt indexPath:IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let item:UsersModel = self.userModel[indexPath.row]
        
        let name = cell.viewWithTag(1) as! UILabel
        let email = cell.viewWithTag(2) as! UILabel
        
        name.text = item.name?.getFullName()
        email.text = item.email
        
        return cell
        
    }
    
    func checkinClosure()
    {
        let a = {(val1:Int ,val2:Int ) -> Int in val1 / val2 }
        print(a(4, 2))
        //print(Cons.shared.c1)
    }
    
    func downloadData()
    {
        /*self.userViewModel.getUser {
            self.userModel = Array(self.userViewModel.userModel)
            self.tableView.reloadData()
        }*/
        
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
                        print(object)
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
        /*Alamofire.request("" , method: .post ,parameters:["":""], encoding:JSONEncoding.default ,headers:nil).responseJSON
            { response in
        }*/
    }

    @IBAction func changeControllers(_ sender: Any){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "secondViewController")
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    func getData()
    {
        let task = URLSession.shared.dataTask(with: URL(string:"https://api.randomuser.me/?results=10&nat=e")!) { (data, response, error) in
            guard let unwrappedData = data else {return}
            do
            {
                let json = try JSONSerialization.jsonObject(with: unwrappedData, options: [])
                if let object = json as? [String:Any]
                {
                    
                    print(object)
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

}

