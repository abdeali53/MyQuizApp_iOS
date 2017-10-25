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
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var progressBar: UIView!
    @IBOutlet weak var btnOption4: UIButton!
    @IBOutlet weak var btnOption2: UIButton!
    @IBOutlet weak var btnOption3: UIButton!
    @IBOutlet weak var bntOption1: UIButton!
    
    
    let questionnaire = QuestionnaireViewModel().loadQuestion()
    var pickedAnswer : String = ""
    var questionNumber : Int = 0
    var score : Int = 0
    var isSoundOn : Bool = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bntOption1.layer.cornerRadius = 5
        btnOption2.layer.cornerRadius = 5
        btnOption3.layer.cornerRadius = 5
        btnOption4.layer.cornerRadius = 5
        
        updateUI()
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
    @IBAction func btnLogout(_ sender: UIButton) {
        
    }
    
    @IBAction func btnAnswer(_ sender: UIButton) {
       pickedAnswer = (sender.titleLabel?.text)!
        bntOption1.backgroundColor = UIColor.white
        btnOption2.backgroundColor = UIColor.white
        btnOption3.backgroundColor = UIColor.white
        btnOption4.backgroundColor = UIColor.white
        sender.backgroundColor = UIColor.yellow
        
    }
    
    
    
    @IBAction func btnNextQuestion(_ sender: UIButton) {
        checkAnswer()
        
        questionNumber = questionNumber + 1
        
        updateUI()
    }
    
    @IBAction func btnTurnOnOffSound(_ sender: UIButton) {
    }

    
    
    func updateUI() {
        
        progressBar.frame.size.width = (view.frame.size.width / 10) * CGFloat(questionNumber)
        
        progressLabel.text = String(questionNumber) + "/10"
        
        scoreLabel.text = "Score: " + String(score)
        
        nextQuestion()
    }
    func nextQuestion() {
        
        if questionNumber < 10 {
            lblQuestionNo.text = "Question No \(self.questionNumber+1)"
            lblQuestionText.text = questionnaire[questionNumber].questionText
            bntOption1.setTitle(questionnaire[questionNumber].options[0], for: .normal)
            btnOption2.setTitle(questionnaire[questionNumber].options[1], for: .normal)
            btnOption3.setTitle(questionnaire[questionNumber].options[2], for: .normal)
            btnOption4.setTitle(questionnaire[questionNumber].options[3], for: .normal)
            TextToSpeech.textToSpeecg(text: questionnaire[questionNumber].questionText)
            TextToSpeech.arrayToSpeech(options: questionnaire[questionNumber].options)
            
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
    //This method will check if the user has got the right answer.
    func checkAnswer() {
        
        let correctAnswer = questionnaire[questionNumber].correctAnswer
        
        if correctAnswer == pickedAnswer {
            
            //ProgressHUD.showSuccess("Correct!")
            
            score = score + 1
        }
        else {
            
           // ProgressHUD.showError("Wrong!")
        }
    }
    
    //This method will wipe the board clean, so that users can retake the quiz.
    func startOver() {
        
        questionNumber = 0
        score = 0
        
        updateUI()
        
    }
    
    
}
