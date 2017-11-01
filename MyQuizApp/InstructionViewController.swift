//
//  InstructionViewController.swift
//  MyQuizApp
//
//  Created by MacStudent on 2017-10-31.
//  Copyright © 2017 user131660. All rights reserved.
//

import UIKit

class InstructionViewController: UIViewController {

    @IBOutlet weak var webInstruction: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadMyHeml()
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
    func  loadMyHeml()
    {
        let localfilePath = Bundle.main.url(forResource: "instruction", withExtension: "html")
        let myRequest =  URLRequest(url: localfilePath!)
        webInstruction.loadRequest(myRequest)
    }
}
