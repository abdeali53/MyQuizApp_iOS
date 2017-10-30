//
//  QuizViewController.swift
//  MyQuizApp
//
//  Created by user131660 on 10/28/17.
//  Copyright © 2017 user131660. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    @IBOutlet weak var lblHIghScore: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblQuestionNo: UILabel!
    @IBOutlet weak var lblQuestion: UILabel!
    @IBOutlet weak var btnOption1: UIButton!
    @IBOutlet weak var btnOption2: UIButton!
    @IBOutlet weak var btnOption3: UIButton!
    @IBOutlet weak var btnOption4: UIButton!
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var lblScore: UILabel!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var progressBar: UIView!
    var seconds = 30
    var timer = Timer()
    var isTimerRunning = true
    
    let questionnaire = QuestionnaireViewModel().loadQuestion()
    var pickedAnswer : String = ""
    var questionNumber : Int = 0
    var score : Int = 0
    var isSoundOn : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        runTimer()
        lblHighScore.text = "High Score: " + String(MyResultViewModel.highScore())
        self.questionNumber = 0
        self.score = 0
        btnOption1.layer.cornerRadius = 10
        btnOption2.layer.cornerRadius = 10
        btnOption3.layer.cornerRadius = 10
        btnOption4.layer.cornerRadius = 10
        btnNext.layer.cornerRadius = 10
        lblTime.text = "0"
        nextQuestion()
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

    @IBAction func btnAnswer_Click(_ sender: UIButton) {
        pickedAnswer = (sender.titleLabel?.text)!
        self.initialiseButtonColor()
        sender.backgroundColor = UIColor.yellow
    }
}
