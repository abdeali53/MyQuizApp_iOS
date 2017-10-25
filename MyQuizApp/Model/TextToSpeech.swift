//
//  TextToSpeech.swift
//  MyQuizApp
//
//  Created by MacStudent on 2017-10-25.
//  Copyright © 2017 user131660. All rights reserved.
//

import Foundation
import AVFoundation
class TextToSpeech{
    static func textToSpeecg(text : String)  {
        let synth = AVSpeechSynthesizer()
        var myUtterance = AVSpeechUtterance(string: "")
        myUtterance = AVSpeechUtterance(string: text)
        myUtterance.rate = 0.5
        synth.stopSpeaking(at: .immediate)
        synth.speak(myUtterance)
    }
    static func stopSpeech(){
        let synth = AVSpeechSynthesizer()
        synth.stopSpeaking(at: .immediate)
    }
   static func arrayToSpeech(options : [String])  {
        let synth = AVSpeechSynthesizer()
        var myUtterance = AVSpeechUtterance(string: "")
        var text : String = ""
        for i in 0..<options.count{
            text += "Option \(i+1), \(options[i])"
        }
        
        myUtterance = AVSpeechUtterance(string: text)
        myUtterance.rate = 0.5
        synth.speak(myUtterance)
    }
}
