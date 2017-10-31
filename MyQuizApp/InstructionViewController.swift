//
//  InstructionViewController.swift
//  MyQuizApp
//
//  Created by user131660 on 10/24/17.
//  Copyright © 2017 user131660. All rights reserved.
//

import UIKit

class InstructionViewController: UIViewController {

   
    var timer = Timer()
    var isTimerRunning = false //This will be used to make sure only one timer is created at a time.
    override func viewDidLoad() {
        super.viewDidLoad()
        
//lblQuestion.sizeToFit()
//        lblQuestion.numberOfLines = 0
        
//        lblQuestion.text = ""
        // Do any additional setup after loading the view.
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnScoreboard_Click(_ sender: Any) {
         
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBAction func btnStart(_ sender: UIButton) {
        self.performSegue(withIdentifier: "navigateToQuiz", sender: self)
        
    }
    
}
