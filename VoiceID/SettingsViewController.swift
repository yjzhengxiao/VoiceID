//
//  SettingViewController.swift
//  VoiceID
//
//  Created by Xiao Zheng on 7/6/16.
//  Copyright © 2016 Make School. All rights reserved.
//

import UIKit
import AVFoundation

protocol SettingsViewControllerDelegate {
    func didSaveSettings()
}

class SettingsViewController: UIViewController {
    
    //@IBOutlet weak var tbSettings: UITableView!

    @IBOutlet weak var pitchSlider: UISlider!
    @IBOutlet weak var rateSlider: UISlider!

    var delegate: SettingsViewControllerDelegate!
    
    let speechSettings = NSUserDefaults.standardUserDefaults()

    var pitch: Float!
    var rate: Float!
    var preferredVoiceLanguageCode: String! = "en-gb"
    //var minionLanguage = "Bello, Me want banana, Tulaliloo ti amo, Tank yu, Poopaye!"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //tbSettings.delegate = self
        rate = speechSettings.valueForKey("rate") as! Float
        pitch = speechSettings.valueForKey("pitch") as! Float
        
        print(AVSpeechSynthesisVoice.speechVoices())
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveSettings(sender: AnyObject) {
        NSUserDefaults.standardUserDefaults().setFloat(rate, forKey: "rate")
        NSUserDefaults.standardUserDefaults().setFloat(pitch, forKey: "pitch")
        NSUserDefaults.standardUserDefaults().setObject(preferredVoiceLanguageCode, forKey: "languageCode")
        //NSUserDefaults.standardUserDefaults().setObject(minionLanguage, forKey: "minionLanguage")
        NSUserDefaults.standardUserDefaults().synchronize()
        
        self.delegate.didSaveSettings()
        
        //navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func pitchSliderValueChanged(sender: AnyObject) {
        let currentValue1 = Float(pitchSlider.value)
        print("Slider changing to \(currentValue1) ?")
        pitch = currentValue1
    }
    
    
    @IBAction func rateSliderValueChanged(sender: AnyObject) {
        let currentValue2 = Float(rateSlider.value)
        print("Slider changing to \(currentValue2) ?")
        rate = currentValue2
    }
    
    
    @IBAction func pressMinionButton(sender: AnyObject) {
        print("Minion Button Pressed")
        rate = 0.6
        pitch = 4.0
        preferredVoiceLanguageCode = "ko-KR"
    }
    
    
    @IBAction func pressRobotButton(sender: AnyObject) {
        print("Robot Button Pressed")
        rate = 0.8
        pitch = 1.0
        preferredVoiceLanguageCode = "en-gb"
    }
    
    
    @IBAction func pressEvilVoiceButton(sender: AnyObject) {
        print("Evil Button Pressed")
        rate = 0.2
        pitch = 0.1
    }
    

}
