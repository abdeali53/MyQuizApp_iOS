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
    
    func loadQuestion() -> [QuestionnaireViewModel] {
        var listQuestion = [QuestionnaireViewModel] ()
        let bundle = Bundle.main.path(forResource: "QuizData", ofType: "plist")
        let listQuizData = NSMutableArray(contentsOfFile: bundle!)
        var count = 0
        for value in (listQuizData?.shuffled())! {
            if(count < 10){
            let  ques = QuestionnaireViewModel()
                ques.correctAnswer = (value as! NSDictionary).value(forKey: "correctAnswer") as! String
                ques.options = (value as! NSDictionary).value(forKey: "options") as! [String]
                ques.questionText = (value as! NSDictionary).value(forKey: "questionText") as! String
                listQuestion.append(ques)
                count += 1
            }
            else{
                break
            }
            
        }
        return listQuestion
    }
    
 
    
}


extension MutableCollection {
    /// Shuffles the contents of this collection.
    mutating func shuffle() {
        let c = count
        guard c > 1 else { return }
        
        for (firstUnshuffled, unshuffledCount) in zip(indices, stride(from: c, to: 1, by: -1)) {
            let d: IndexDistance = numericCast(arc4random_uniform(numericCast(unshuffledCount)))
            let i = index(firstUnshuffled, offsetBy: d)
            swapAt(firstUnshuffled, i)
        }
    }
}
extension Sequence {
    /// Returns an array with the contents of this sequence, shuffled.
    func shuffled() -> [Element] {
        var result = Array(self)
        result.shuffle()
        return result
    }
}
