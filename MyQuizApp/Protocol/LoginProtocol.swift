//
//  LoginProtocol.swift
//  MyQuizApp
//
//  Created by user131660 on 10/23/17.
//  Copyright © 2017 user131660. All rights reserved.
//

import Foundation

protocol ILogin
{
    var username : String {set get}
    var password : String {set get}
    
    //mutating func authenticateUser(loginInfo : ILogin) -> Bool
}
extension ILogin {
  mutating  func authenticate(loginInfo : ILogin) -> Bool {
        if (loginInfo.username == "admin" && loginInfo.password == "admin@123"){
            return true
        }
        else{
            return false
        }
    }
}
