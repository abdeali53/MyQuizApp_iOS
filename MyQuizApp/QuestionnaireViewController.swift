//
//  QuestionnaireViewController.swift
//  MyQuizApp
//
//  Created by user131660 on 10/25/17.
//  Copyright © 2017 user131660. All rights reserved.
//

import UIKit

class QuestionnaireViewController: UIViewController {

    
    @IBOutlet weak var lblQuestionNo: UILabel!
    @IBOutlet weak var lblQuestionText: UILabel!
    
    let questionnaire = QuestionnaireViewModel().loadQuestion()
    var pickedAnswer : String = ""
    var questionNumber : Int = 0
    var score : Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func btnAnswer(_ sender: UIButton) {
        
    }
    
    func nextQuestion() {
        
        if questionNumber <= 10 {
            lblQuestionText.text = questionnaire[questionNumber].questionText
        }
//        else {
//            let alert = UIAlertController(title: "Awesome", message: "You've finished all the questions, do you want to start over?", preferredStyle: .alert)
//
//            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: { UIAlertAction in
//                self.startOver()
//            })
//
//            alert.addAction(restartAction)
//
//            present(alert, animated: true, completion: nil)
//        }
        
    }
    
    
}
