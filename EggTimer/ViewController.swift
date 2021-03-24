//
//  ViewController.swift
//  EggTimer
//
//  Created by Adnan Sarker on 23/03/2021.
//

import UIKit
import AVFoundation
//boil time taken
let softTime = 6
let mediumTime = 7
let hardTime = 12

class ViewController: UIViewController {
    
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var player: AVAudioPlayer!
    
    var timer: Timer?
    
    let eggTime = ["Soft": softTime, "Medium" : mediumTime, "Hard" : hardTime]
    
    var timeLeft = 0;
    var timeFlag = 0;
    

    @IBAction func buttonPressed(_ sender: UIButton) {
        
        timer?.invalidate()
        let hardness = sender.currentTitle!
        timeLeft = eggTime[hardness]! * 60;// split into second
        timeFlag = timeLeft
        //set timer
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ttimer), userInfo: nil, repeats: true)
    
    }

    
    @objc func ttimer (){
        
        timeLeft -= 1
        //var x = timeFlag - timeLeft
        titleLabel.text = " \(timeLeft) seconds left"
        
        if timeLeft<=0 {
            titleLabel.text = "DONE"
            
            timer?.invalidate()
            timer = nil
            progressView.progress = 0
            // after finishing countdown, alarm will be played
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }
        else {
            progressView.progress = Float(timeFlag - timeLeft)/Float(timeFlag)
        }
    }
    

}
