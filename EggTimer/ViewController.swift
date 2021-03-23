//
//  ViewController.swift
//  EggTimer
//
//  Created by Adnan Sarker on 23/03/2021.
//

import UIKit

let softTime = 6
let mediumTime = 7
let hardTime = 12

class ViewController: UIViewController {
    
    var timer: Timer?
    
    let eggTime = ["Soft": softTime, "Medium" : mediumTime, "Hard" : hardTime]
    
    var timeLeft = 0
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        let hardness = sender.currentTitle!
        timeLeft = eggTime[hardness]! * 60;
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ttimer), userInfo: nil, repeats: true)
    
    }
    
    @objc func ttimer (){
        timeLeft -= 1
        titleLabel.text = " \(timeLeft) seconds left"
        
        if timeLeft<=0 {
            titleLabel.text = "DONE"
            
            timer?.invalidate()
            timer = nil
        }
    }
    

}
