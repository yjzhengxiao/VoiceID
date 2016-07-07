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
    
    @IBOutlet weak var tbSettings: UITableView!
    
    var delegate: SettingsViewControllerDelegate!
    
    let speechSettings = NSUserDefaults.standardUserDefaults()
    
    var rate: Float!
    var pitch: Float!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rate = speechSettings.valueForKey("rate") as! Float
        pitch = speechSettings.valueForKey("pitch") as! Float
        
        print(AVSpeechSynthesisVoice.speechVoices())
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    

}
