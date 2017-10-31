//
//  ViewController.swift
//  MyQuizApp
//
//  Created by user131660 on 10/23/17.
//  Copyright © 2017 user131660. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var swRemember: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
//        let ques = QuestionnaireViewModel()
//        ques.loadQuestion()
        var login = LoginViewModel()
        swRemember.isOn = login.checkIsRememberCredential()
        if swRemember.isOn == true {
           login = login.loadLoginCredential(isRemember: true)
            txtUsername.text = login.username
            txtPassword.text = login.password
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
                navigate()
            }
            else{
                Alert(title: "Error", message: "Username or Password is incorrect.")
            }
        }
        else{
            Alert(title: "Error", message: "Please enter login details.")
        }
    }
}

extension LoginViewController{
    func Alert(title: String, message : String)  {
    let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
    self.present(alert, animated: true, completion: nil)
    }
    func navigate () {
        self.performSegue(withIdentifier: "navigateToHome", sender: self)
    }
}
