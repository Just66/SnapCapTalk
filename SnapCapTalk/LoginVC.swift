//
//  LoginVC.swift
//  SnapCapTalk
//
//  Created by Dmytro Aprelenko on 16.04.17.
//  Copyright © 2017 Dmytro Aprelenko. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var emailText: RoundTextField!
    @IBOutlet weak var passwordText: RoundTextField!

   
    @IBAction func LoginBtn(_ sender: Any) {
        if let email = emailText.text, let pass = passwordText.text, (email.characters.count > 0 && pass.characters.count > 0) {
            
            AuthService.instance.login(email: email, password: pass, onCompletion: { (errMsg, data) in
                guard errMsg == nil else {
                    let alert = UIAlertController(title: "Error Authenication", message: errMsg, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                    return
                }
                
                self.dismiss(animated: true, completion: nil)
            })
            
        } else {
            let alert = UIAlertController(title: "Username and Password required", message: "You need to enter both of them", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OKay", style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
    
       
}
