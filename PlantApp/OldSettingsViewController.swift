//  SettingsViewController.swift
//  PlantApp
//
//  Created by Leung Yuet Yi on 16-07-2021.
//

import UIKit
import AVFoundation

class OldSettingsViewController: UIViewController {

    var bgPlayer:AVAudioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let soundFilePath:String = Bundle.main.path(forResource: "sean", ofType: "mp3")!
        let fileURL:URL = URL(fileURLWithPath: soundFilePath)
        do{
            bgPlayer = try AVAudioPlayer(contentsOf: fileURL)
            bgPlayer.volume = 0.5
            bgPlayer.numberOfLoops = -1
            bgPlayer.play()
        }catch {
            print("error rading mp3")
        }
        
        
    }
    
    @IBAction func musicOnOff(_ sender: UISwitch) {
        if(sender.isOn) {
            bgPlayer.play()
        } else {
        
         bgPlayer.stop()
    }
    
}
    
    @IBAction func updateVolume(_ sender: UISlider) { bgPlayer.volume = sender.value
    }
   
    
}
