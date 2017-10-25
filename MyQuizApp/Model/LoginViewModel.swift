//
//  LoginViewModel.swift
//  MyQuizApp
//
//  Created by user131660 on 10/23/17.
//  Copyright © 2017 user131660. All rights reserved.
//

import Foundation
class LoginViewModel : ILogin{
    var username: String
    var isRememberCredential : Bool = false
    var password: String
    init(){
        self.username = ""
        self.password = ""
    }
    init(username : String, password: String) {
        self.username = username
        self.password = password
    }
    init(username : String, password: String, isRememberCredential : Bool) {
        self.username = username
        self.password = password
        self.isRememberCredential = isRememberCredential
    }
    //To Load Login Info if true
    func loadLoginCredential(isRemember : Bool) -> LoginViewModel {
        //let loginInfo = readPlist()
        //self.username = loginInfo.value(forKey: "username") as! String
        //self.password = loginInfo.value(forKey: "password") as! String
        self.username = UserDefaults.standard.value(forKey: "username") as! String
        self.password = UserDefaults.standard.value(forKey: "password") as! String
        return self
    }
    // To check IsRemeber is true
    func checkIsRememberCredential() -> Bool {
        if let rememberCredential = UserDefaults.standard.value(forKey: "isRememberCredential"){
            isRememberCredential = rememberCredential as! Bool
        }
        return isRememberCredential
    }
    func addCredentials(loginInfo : LoginViewModel) {
        UserDefaults.standard.set(loginInfo.username, forKey: "username")
        UserDefaults.standard.set(loginInfo.password, forKey: "password")
        UserDefaults.standard.set(loginInfo.isRememberCredential, forKey: "isRememberCredential")
    }
    
    func removeCredentials(loginInfo : LoginViewModel) {
        UserDefaults.standard.removeSuite(named: "username")
        UserDefaults.standard.removeSuite(named: "password")
        UserDefaults.standard.set(loginInfo.isRememberCredential, forKey: "isRememberCredential")
    }
    //Read Data From PList
//    func readPlist() -> String {
//        var bundle = Bundle.main.path(forResource: "sa", ofType: "plist")
//        var dict = NSMutableArray(contentsOfFile: bundle!)
//        return (dict?.description)!
//    }
    
}
