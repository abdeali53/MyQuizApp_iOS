//
//  InstructionViewController.swift
//  MyQuizApp
//
//  Created by user131660 on 10/24/17.
//  Copyright © 2017 user131660. All rights reserved.
//

import UIKit

class InstructionViewController: UIViewController {

    @IBOutlet weak var lblTime: UILabel!
    var seconds = 5 //This variable will hold a starting value of seconds. It could be any amount above 0.
    var timer = Timer()
    var isTimerRunning = false //This will be used to make sure only one timer is created at a time.
    override func viewDidLoad() {
        super.viewDidLoad()
        runTimer()
//lblQuestion.sizeToFit()
//        lblQuestion.numberOfLines = 0
        
//        lblQuestion.text = ""
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
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(InstructionViewController.updateTimer)), userInfo: nil, repeats: true)
        
    }
    @objc func updateTimer() {
        seconds -= 1     //This will decrement(count down)the seconds.
        if(seconds == 0){
            print("dasda")
        }
        lblTime.text = String(seconds) //This will update the label.
    }
    
    @IBAction func btnStart(_ sender: UIButton) {
        self.performSegue(withIdentifier: "navigateToQuestionnaire", sender: self)
        
    }
    
}
