//
//  ViewController.swift
//  VoiceID
//
//  Created by Xiao Zheng on 7/6/16.
//  Copyright © 2016 Make School. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!

    let synth = AVSpeechSynthesizer()
    var myUtterance = AVSpeechUtterance(string: "")
    
//    var rate: Float!
//    
//    var pitch: Float!
//    
//    var volume: Float!
    
//    func registerDefaultSettings() {
//        rate = AVSpeechUtteranceDefaultSpeechRate
//        pitch = 1.0
//        volume = 1.0
//        
//        let defaultSpeechSettings: Dictionary<NSObject, AnyObject> = ["rate": rate, "pitch": pitch, "volume": volume]
//        
//        //NSUserDefaults.standardUserDefaults().registerDefaults(defaultSpeechSettings)
//    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func textToSpeech(sender: AnyObject) {
        
        myUtterance = AVSpeechUtterance(string: textView.text)
        myUtterance.rate = 0.5
        myUtterance.pitchMultiplier = 0.25
        synth.speakUtterance(myUtterance)
    }

}

