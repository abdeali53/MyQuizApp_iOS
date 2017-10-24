//
//  ViewController.swift
//  MyQuizApp
//
//  Created by user131660 on 10/23/17.
//  Copyright © 2017 user131660. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var swRemember: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        var login = LoginViewModel()
        swRemember.isOn = login.checkIsRememberCredential()
        if swRemember.isOn == true {
           login = login.loadLoginCredential(isRemember: true)
            txtUsername.text = login.username
            txtPassword.text = login.password
        }
        else{
            login = login.loadLoginCredential(isRemember: false)
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnLogin(_ sender: UIButton) {
        if(txtUsername.text != "" && txtPassword.text != ""){
            var login = LoginViewModel(username: txtUsername.text!, password: txtPassword.text!, isRememberCredential: swRemember.isOn)
            if(login.authenticate(loginInfo: login))
            {
                if swRemember.isOn{
                    login.addCredentials(loginInfo: login)
                }
                else{
                    login.removeCredentials(loginInfo: login)
                }
            }
            else{
                let alert = UIAlertController(title: "Error Message", message: "Username or Password incorrect", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
}
