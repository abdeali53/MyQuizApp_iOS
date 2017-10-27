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
    init(){
    }
    
   static func listOfResults() -> [MyResultViewModel] {
        var lstResult = [MyResultViewModel] ()
        let bundle = Bundle.main.path(forResource: "QuizResult", ofType: "plist")
        let listQuizResult = NSMutableArray(contentsOfFile: bundle!)
        if (listQuizResult?.count != 0 && listQuizResult != nil){
        for value in listQuizResult! {
                let  result = MyResultViewModel()
                result.attemptNumber = (value as! NSDictionary).value(forKey: "attemptNumber") as! Int
                result.score = (value as! NSDictionary).value(forKey: "score") as! Int
                lstResult.append(result)
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
        let bundle = Bundle.main.path(forResource: "QuizResult", ofType: "plist")
        
        //var paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) as Array
        //let documentPath = paths[0] as String
        //let path = documentPath.appending("QuizResult")
        
       
            print("file product plist already exist at path")
        array = NSMutableArray(contentsOfFile: bundle!)!
            let dictProduct = NSMutableDictionary()
            dictProduct["attemptNumber"] = score
            dictProduct["score"] = self.attempId()
            array.add(dictProduct)
        array.write(toFile: bundle!, atomically: true)
        
    }
    
}

