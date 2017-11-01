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
    @IBOutlet weak var btnSound: UIBarButtonItem!
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
        lblHIghScore.text = "High Score: " + String(MyResultViewModel.highScore())
        lblScore.text = "Score: " + String(score)
        self.questionNumber = 0
        self.score = 0
        self.btnTurnOn_Click(btnSound)
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
    
    @IBAction func btnNext_Click(_ sender: UIButton) {
        goToNextQuestion()
    }
    
    @IBAction func btnTurnOn_Click(_ sender: UIBarButtonItem) {
        self.isSoundOn = !self.isSoundOn
        if(isSoundOn){
            let img = UIImage(named: "ic_volume_up")
            sender.image = img
        }
        else{
            let img = UIImage(named: "ic_volume_off")
            sender.image = img
            TextToSpeech.stopSpeech()
        }
    }
    
    @IBAction func quit_Click(_ sender: UIBarButtonItem) {
        self.performSegue(withIdentifier: "navigateToInstruction", sender: self)
    }
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(QuestionnaireViewController.updateTimer)), userInfo: nil, repeats: true)
        
    }
    @objc func updateTimer() {
        seconds -= 1
        if(seconds == 0){
            goToNextQuestion()
        }
        else if(seconds < 0){
            lblTime.text = ""
        }
        else if(seconds < 5)
        {
            lblTime.textColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        }
        else if(seconds > 5){
            lblTime.textColor = #colorLiteral(red: 0.6074399948, green: 0.7690245509, blue: 0.01989133283, alpha: 1)
        }
        lblTime.text = "Timer: " + String(seconds) + "sec"
    }
    
    func nextQuestion() {
        TextToSpeech.synth.stopSpeaking(at: .immediate)
        if questionNumber < 10 {
            progressBar.frame.size.width = (view.frame.size.width / 10) * CGFloat(questionNumber)
            progressLabel.text = String(questionNumber) + "/10"
            // TextToSpeech.stopSpeech()
            lblQuestionNo.text = "Question No \(self.questionNumber+1)"
            lblQuestion.text = questionnaire[questionNumber].questionText
            btnOption1.setTitle(questionnaire[questionNumber].options[0], for: .normal)
            btnOption2.setTitle(questionnaire[questionNumber].options[1], for: .normal)
            btnOption3.setTitle(questionnaire[questionNumber].options[2], for: .normal)
            btnOption4.setTitle(questionnaire[questionNumber].options[3], for: .normal)
            if(isSoundOn){
                TextToSpeech.textToSpeecg(text: questionnaire[questionNumber].questionText)
                TextToSpeech.arrayToSpeech(options: questionnaire[questionNumber].options)
            }
            
        }
        else {
            let alert = UIAlertController(title: "Result", message: "Your score is \(self.score). Do you want to start over?", preferredStyle: .alert)
            
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: { UIAlertAction in
                self.startOver()
            })
            
            alert.addAction(restartAction)
            MyResultViewModel.addScore(score: self.score)
            present(alert, animated: true, completion: nil)
        }
        
    }
    //This method will check if the user has got the right answer.
    func checkAnswer()  {
        if(questionNumber < 10){
            let correctAnswer = questionnaire[questionNumber].correctAnswer
            if correctAnswer == pickedAnswer {
                if (btnOption1.titleLabel?.text == correctAnswer){
                    btnOption1.backgroundColor = UIColor.green
                }
                else if (btnOption2.titleLabel?.text == correctAnswer){
                    btnOption2.backgroundColor = UIColor.green
                }
                else if (btnOption3.titleLabel?.text == correctAnswer){
                    btnOption3.backgroundColor = UIColor.green
                }
                else if (btnOption4.titleLabel?.text == correctAnswer){
                    btnOption4.backgroundColor = UIColor.green
                }
                score = score + 1
            }
            else {
                if (btnOption1.titleLabel?.text == pickedAnswer){
                    btnOption1.backgroundColor = UIColor.red
                }
                else if (btnOption2.titleLabel?.text == pickedAnswer){
                    btnOption2.backgroundColor = UIColor.red
                }
                else if (btnOption3.titleLabel?.text == pickedAnswer){
                    btnOption3.backgroundColor = UIColor.red
                }
                else if (btnOption4.titleLabel?.text == pickedAnswer){
                    btnOption4.backgroundColor = UIColor.red
                }
                
            }
            if (btnOption1.titleLabel?.text == correctAnswer){
                btnOption1.backgroundColor = UIColor.green
            }
            else if (btnOption2.titleLabel?.text == correctAnswer){
                btnOption2.backgroundColor = UIColor.green
            }
            else if (btnOption3.titleLabel?.text == correctAnswer){
                btnOption3.backgroundColor = UIColor.green
            }
            else if (btnOption4.titleLabel?.text == correctAnswer){
                btnOption4.backgroundColor = UIColor.green
            }
            lblScore.text = "Score: " + String(score)
        }
    }
    
    
    func startOver() {
        self.viewDidLoad()
        //  questionNumber = 0
        ///score = 0
        //nextQuestion()
        
    }
    
    func initialiseButtonColor()  {
        btnOption1.backgroundColor = UIColor.white
        btnOption2.backgroundColor = UIColor.white
        btnOption3.backgroundColor = UIColor.white
        btnOption4.backgroundColor = UIColor.white
    }
    func goToNextQuestion() {
        self.checkAnswer()
        self.seconds = 31
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
            self.initialiseButtonColor()
            self.questionNumber = self.questionNumber + 1
            self.nextQuestion()
            if(self.questionNumber == 9){
                self.btnNext.titleLabel?.text = "End"
            }
            
        })
    }
}
