//
//  MyResultViewModel.swift
//  MyQuizApp
//
//  Created by MacStudent on 2017-10-27.
//  Copyright © 2017 user131660. All rights reserved.
//

import Foundation

class MyResultViewModel{
    var attemptNumber : Int!
    var score : Int!
    var attemptDate : Date = Date()
    init(){
    }
    
   static func listOfResults() -> [MyResultViewModel] {
   var lstResult = [MyResultViewModel] ()
    var paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) as Array
    let documentPath = paths[0] as String
    let path = documentPath.appending("Scoreboard")
    
    let fileManager = FileManager.default
    
    if !fileManager.fileExists(atPath: path) {
        if let bundlePath = Bundle.main.path(forResource: "Scoreboard", ofType: "plist") {
            do {
                try fileManager.copyItem(at: URL(fileURLWithPath: bundlePath), to: URL(fileURLWithPath: path))
            } catch {
                print("copy failure")
            }
        }
        else {
            print("product plist not found")
        }
    }
    else {
        print("file product plist already exist at path")
    }
    if (NSMutableArray(contentsOfFile: path) != nil){
    let  listQuizResult = NSMutableArray(contentsOfFile: path)!
    
    
    
    if (listQuizResult.count != 0 ){
        for value in listQuizResult {
                let  result = MyResultViewModel()
                result.attemptNumber = (value as! NSDictionary).value(forKey: "attemptNumber") as! Int
                result.score = (value as! NSDictionary).value(forKey: "score") as! Int
                result.attemptDate = (value as! NSDictionary).value(forKey: "attemptDate") as! Date
                lstResult.append(result)
            }
        }
    }
        return lstResult
    }
    
   static func highScore() -> Int{
        var score = 0
        let lstResult = self.listOfResults()
        if (lstResult.count != 0){
            score = lstResult.map{$0.score}.max()!
        }
        return score
    }
    
    static func attempId() -> Int{
        var score = 0
        let lstResult = self.listOfResults()
        if (lstResult.count != 0){
            score = lstResult.map{$0.attemptNumber}.max()!
        }
        return score + 1
    }
    
    static func addScore(score : Int){
        var array = NSMutableArray()
        
        var paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) as Array
        let documentPath = paths[0] as String
        let path = documentPath.appending("Scoreboard")
        
        let fileManager = FileManager.default
        
        if !fileManager.fileExists(atPath: path) {
            if let bundlePath = Bundle.main.path(forResource: "Scoreboard", ofType: "plist") {
                array = NSMutableArray(contentsOfFile: bundlePath)!
                do {
                    try fileManager.copyItem(at: URL(fileURLWithPath: bundlePath), to: URL(fileURLWithPath: path))
                } catch {
                    print("copy failure")
                }
                
                
                let dictProduct = NSMutableDictionary()
                dictProduct["attemptNumber"] = self.attempId()
                dictProduct["score"] = score
                dictProduct["attemptDate"] = Date()
                array.add(dictProduct)
                array.write(toFile: path, atomically: true)
        
            }
            else {
                print("product plist not found")
            }
        }
        else {
            print("file product plist already exist at path")
            if(NSMutableArray(contentsOfFile: path) != nil){
            array = NSMutableArray(contentsOfFile: path)!
            }
            let dictProduct = NSMutableDictionary()
            dictProduct["attemptNumber"] = self.attempId()
            dictProduct["score"] = score
            dictProduct["attemptDate"] = Date()
            array.add(dictProduct)
            array.write(toFile: path, atomically: true)
            
        
        }
        
       
        
        
    }
    
    
}

