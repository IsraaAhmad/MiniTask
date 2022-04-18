//
//  ViewController.swift
//  AlamoTest
//
//  Created by Israa Ahmad on 22/03/2022.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    var count = 0
    @IBAction func btn(_ sender: Any) {
        print(items[count])
        count = count + 1
        print("***********")
    }
    
var items = [User]()
    override func viewDidLoad() {
        let url = "https://gorest.co.in/public/v2/users"
        super.viewDidLoad()
        AF.request(url).responseJSON { AFDataResponse<Any> in
            <#code#>
        }
        AF.request(url).responseJSON { (response) in
//            if let json = response.value as? [[String:Any]] {
//                for user in json{
//                    let id = user["id"] as? Int
//                    let name = user["name"] as? String
//                    let email = user["email"] as? String
//                    let gender = user["gender"] as? String
//                    let status = user["status"] as? String
//                    let model = User(id: id, name: name, email: email, gender: gender, status: status)
//                    self.items.append(model)
//                }
//            }
            do{
                print(response)
                let users = try JSONDecoder().decode([User].self, from: response.data!)
                self.items = users
            }
            catch{
                print("error")
            }
          
        }
            
        
        // Do any additional setup after loading the view.
    }


}
//https://gorest.co.in/public/v2/users
