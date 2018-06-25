//
//  LoginViewController.swift
//  iTrafficControl
//
//  Created by Juan Manuel Santos on 24/06/18.
//  Copyright © 2018 Juan Manuel Santos. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var _login_button: UIButton!
    @IBOutlet weak var _username: UITextField!
    @IBOutlet weak var _password: UITextField!
    
    
    

    override func viewDidLoad() {
        let preferences = UserDefaults.standard
        
        if(preferences.object(forKey: "session") != nil){
            LoginDone()
        }
        else{
            LoginToDo()
        }
        
       
    }

    @IBAction func LoginButton(_ sender: Any) {
        if(_login_button.titleLabel?.text == "Logout"){
            let preferences = UserDefaults.standard
            preferences.removeObject(forKey: "session")
            
            LoginToDo()
            return
        }
        
        
        let username = _username.text
        let password = _password.text
        
        if(username == "" || password == "" )
        {
            return
        }
        DoLogin(username!, password!)
    }
    
    func DoLogin(_ username:String, _ psw:String)
    {
        let url = URL(string: "http://206.189.196.39/controltraffic/api/users/login?username=caghp&password=123456")
        let session = URLSession.shared
        
        let request = NSMutableURLRequest(url: url!)
        request.httpMethod = "POST"
        
        let paramToSend = "username=" + username + "&password=" + psw
        request.httpBody = paramToSend.data(using: String.Encoding.utf8)
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: {
        (data, response, error) in
            
            guard let _:Data = data else
            {
                return
                
            }
            let json:Any?
            
            do{
                json = try JSONSerialization.jsonObject(with: data!, options: [])
            }
            catch
            {
                return
                
            }
            guard let server_response = json as? NSDictionary else{
                return
            }
            
            if let data_block = server_response["data"] as? NSDictionary{
                if let session_data = data_block["session"] as? String{
                    let preferences = UserDefaults.standard
                    preferences.set(session_data, forKey: "session")
                    
                    DispatchQueue.main.async(
                        execute:self.LoginDone
                    )
                }
            }
            
            
        })
        task.resume()
    }
    
    func LoginToDo(){
        _username.isEnabled = true
        _password.isEnabled = true
        
        _login_button.setTitle("Login", for: .normal)
    }
    
    func LoginDone(){
        _username.isEnabled = false
        _password.isEnabled = false
        
        _login_button.setTitle("Logout", for: .normal)
    }
    

}
