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
    
    var password: String
    init(){
        self.username = ""
        self.password = ""
    }
        
    
    init(username : String, password: String) {
        self.username = username
        self.password = password
    }
    func loadLoginCredential(isRemember : Bool) -> LoginViewModel {
        self.username = "Ali"
        self.password = "Ali"
        return self
    }
    func isRememberCredential() -> Bool {
        var paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) as Array
        let documentPath = paths[0] as String
        let path = documentPath.appending("QuizInfo")
        
     
       
        
        //print("load productlist.plist is \(arrayProducts.description)")
        return true
    }
    
}
