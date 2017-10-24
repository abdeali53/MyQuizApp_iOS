//
//  QuestionnaireViewModel.swift
//  MyQuizApp
//
//  Created by user131660 on 10/24/17.
//  Copyright © 2017 user131660. All rights reserved.
//

import Foundation
class QuestionnaireViewModel {
    var questionText : String!
    var options : [String]!
    var correctAnswer : String!
    
    init(){
        
    }
    func loadQuestion()  {
        var myEnglishArray: [QuestionnaireViewModel]!
        var bundle = Bundle.main.path(forResource: "QuizData", ofType: "plist")
        var dict = NSMutableArray(contentsOfFile: bundle!)
        //var mydict = dict
        for v in dict as! [QuestionnaireViewModel] {
        
            
        }
    }
}
