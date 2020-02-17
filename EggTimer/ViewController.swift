//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let softTime = 5;
    let mediumTime = 7;
    let hardTime = 12;
    let eggTimes = ["Soft": 5, "Medium": 7, "Hard": 12]

    var secondsPassed = 0;
    var totalTime = 0;
    var timer = Timer();
    
    var player: AVAudioPlayer!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer ), userInfo: nil, repeats: true)
        
        totalTime = eggTimes[sender.currentTitle!]!
        secondsPassed = 0;
        titleLabel.text = sender.currentTitle!;
    
    }
   
    
    @objc func updateTimer()
    {
        if secondsPassed <= totalTime {
            progressBar.progress = Float(secondsPassed)/Float(totalTime);
            secondsPassed+=1;
            
        } else {
            timer.invalidate();
            titleLabel.text = "Done!";
            playSound();
        }
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()

    }
    
}
