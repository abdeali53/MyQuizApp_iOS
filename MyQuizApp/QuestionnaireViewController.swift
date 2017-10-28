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
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var lblHighScore: UILabel!
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
        bntOption1.layer.cornerRadius = 5
        btnOption2.layer.cornerRadius = 5
        btnOption3.layer.cornerRadius = 5
        btnOption4.layer.cornerRadius = 5
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
   
    @IBAction func btnLogout(_ sender: UIBarButtonItem) {
        
    }
    
    @IBAction func btnAnswer(_ sender: UIButton) {
        pickedAnswer = (sender.titleLabel?.text)!
        self.initialiseButtonColor()
        sender.backgroundColor = UIColor.yellow
    }
    
    @IBAction func btnTurnOnOff(_ sender: UIBarButtonItem) {
        isSoundOn = !isSoundOn
        if(isSoundOn){
            let img = UIImage(named: "ic_volume_up")
            sender.image = img
        }
        else{
            let img = UIImage(named: "ic_volume_off")
            sender.image = img
        }
    }
    
    @IBAction func btnNextQuestion(_ sender: UIButton) {
       goToNextQuestion()
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
        lblTime.text = "Timer: " + String(seconds) + "sec"
    }
    
    func nextQuestion() {
        TextToSpeech.synth.stopSpeaking(at: .immediate)
        if questionNumber < 10 {
            progressBar.frame.size.width = (view.frame.size.width / 10) * CGFloat(questionNumber)
            progressLabel.text = String(questionNumber) + "/10"
           // TextToSpeech.stopSpeech()
            lblQuestionNo.text = "Question No \(self.questionNumber+1)"
            lblQuestionText.text = questionnaire[questionNumber].questionText
            bntOption1.setTitle(questionnaire[questionNumber].options[0], for: .normal)
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
            if (bntOption1.titleLabel?.text == correctAnswer){
                bntOption1.backgroundColor = UIColor.green
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
            if (bntOption1.titleLabel?.text == pickedAnswer){
                bntOption1.backgroundColor = UIColor.red
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
        if (bntOption1.titleLabel?.text == correctAnswer){
            bntOption1.backgroundColor = UIColor.green
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
        scoreLabel.text = "Score: " + String(score)
        }
    }
    

    func startOver() {
        self.viewDidLoad()
      //  questionNumber = 0
        ///score = 0
        //nextQuestion()
        
    }
    
    func initialiseButtonColor()  {
        bntOption1.backgroundColor = UIColor.white
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
                self.btnNext.titleLabel?.text = "Finish"
            }
            
        })
    }    
}
