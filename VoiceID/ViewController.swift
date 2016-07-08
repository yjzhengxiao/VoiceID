//
//  ViewController.swift
//  VoiceID
//
//  Created by Xiao Zheng on 7/6/16.
//  Copyright © 2016 Make School. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVSpeechSynthesizerDelegate, SettingsViewControllerDelegate {
    
    @IBOutlet weak var textView: UITextView!

    let speechSynthesizer = AVSpeechSynthesizer()
    var myUtterance = AVSpeechUtterance(string: "")
    
    var rate: Float! = 0.5
    var pitch: Float! = 0.5
    var preferredVoiceLanguageCode: String!
    var minionLanguage = "ba,ba,baba, na,na, nana, babanana? pa? banana! "
    
    
    
    //pitch: The pitch multiplier acceptable values are between 0.5 and 2.0, where 1.0 is the default value.
    func registerDefaultSettings() {
        rate = AVSpeechUtteranceDefaultSpeechRate
        pitch = 1.0
        
        let defaultSpeechSettings: Dictionary<String, AnyObject> = ["rate": rate, "pitch": pitch]
        
        NSUserDefaults.standardUserDefaults().registerDefaults(defaultSpeechSettings)
    }
    
    func loadSettings() -> Bool {
        let userDefaults = NSUserDefaults.standardUserDefaults() as NSUserDefaults
        
        if let theRate: Float = userDefaults.valueForKey("rate") as? Float {
            rate = theRate
            pitch = userDefaults.valueForKey("pitch") as! Float
            
            return true
        }
        
        return false
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if !loadSettings() {
            registerDefaultSettings()
        }
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        view.addGestureRecognizer(tapGestureRecognizer)
        
        speechSynthesizer.delegate = self
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "voiceIDSegue" {
            let settingsViewController = segue.destinationViewController as! SettingsViewController
            print("segue")
            settingsViewController.delegate = self
        }
    }

    @IBAction func textToSpeech(sender: AnyObject) {
        let userDefaults = NSUserDefaults.standardUserDefaults() as NSUserDefaults
        let languageCode = userDefaults.valueForKey("languageCode") as? String!
        
        if languageCode != "ko-KR" { //es-ES
            myUtterance = AVSpeechUtterance(string: textView.text)
            myUtterance.rate = rate
            myUtterance.pitchMultiplier = pitch
            myUtterance.volume = 0.8
            NSUserDefaults.standardUserDefaults().setObject("en-au", forKey: "languageCode")
            speechSynthesizer.speakUtterance(myUtterance)
        } else {
            print("minion language!")
            myUtterance = AVSpeechUtterance(string: minionLanguage)
            myUtterance.rate = 0.6
            myUtterance.pitchMultiplier = 1.5
            myUtterance.volume = 0.9
            NSUserDefaults.standardUserDefaults().setObject("hi-IN", forKey: "languageCode")
            speechSynthesizer.speakUtterance(myUtterance)
        }
        
        
    }
    
    // MARK: SettingsViewControllerDelegate method implementation
    func didSaveSettings() {
        let settings = NSUserDefaults.standardUserDefaults() as NSUserDefaults!
        
        rate = settings.valueForKey("rate") as! Float
        pitch = settings.valueForKey("pitch") as! Float
        preferredVoiceLanguageCode = settings.objectForKey("languageCode") as! String
    }

    @IBAction func pressGirlVoiceButton(sender: AnyObject) {
        print("switch to girl voice")
        rate = 0.5
        pitch = 1.8
        NSUserDefaults.standardUserDefaults().setObject("en-us", forKey: "languageCode")
        NSUserDefaults.standardUserDefaults().synchronize()
        print(rate, pitch)
    }

    
    @IBAction func pressBoyVoiceButton(sender: AnyObject) {
        print("switch to boy voice")
        rate = 0.5
        pitch = 0.6
        NSUserDefaults.standardUserDefaults().setObject("en-gb", forKey: "languageCode")
        NSUserDefaults.standardUserDefaults().synchronize()
        print(rate, pitch)
    }
    
    
    


}

