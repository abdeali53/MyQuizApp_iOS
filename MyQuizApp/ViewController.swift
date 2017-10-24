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
        let login = LoginViewModel()
        swRemember.isOn = login.isRememberCredential()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnLogin(_ sender: UIButton) {
        if(txtUsername.text != "" && txtPassword.text != ""){
            var login = LoginViewModel(username: txtUsername.text!, password: txtPassword.text!)
            if(login.authenticate(loginInfo: login))
            {
                print("Login Successfully")
            }
            else{
                print("login unsuccessfully")
            }
        }
        
    }
    
}

