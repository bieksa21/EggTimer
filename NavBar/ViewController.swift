//
//  ViewController.swift
//  NavBar
//
//  Created by joey frenette on 2016-09-21.
//  Copyright © 2016 joey frenette. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var timer = Timer()
    @IBOutlet weak var displayedTime: UILabel!
    var time = 210
    
    var player = AVAudioPlayer()
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func Play(_ sender: UIBarButtonItem) {
    timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.processTimer), userInfo: nil, repeats: true)
        timer.fire()
    }
    
    @IBAction func Pause(_ sender: UIBarButtonItem) {
        timer.invalidate()
    }
    
    @IBAction func sub10(_ sender: UIBarButtonItem) {
        time-=10
        displayedTime.text = String(time)
    }

    @IBAction func add10(_ sender: UIBarButtonItem) {
        time+=10
        displayedTime.text = String(time)
    }
    
    @IBAction func Reset(_ sender: UIBarButtonItem) {
        timer.invalidate()
        time = 210
        displayedTime.text = String(time)
        player.stop()
        view.backgroundColor = UIColor.white
    }
    
    func processTimer() {
        time-=1
        displayedTime.text = String(time)
        
        if time <= 0 {
            displayedTime.text = "Well, your eggs are ready! 🍳"
            playAudio()
            view.backgroundColor = UIColor.blue
            timer.invalidate()
        }
    }
    
    //Plays attached audio file
    func playAudio() {
        
        let audioPath = Bundle.main.path(forResource: "Aloe Blacc - The Man", ofType: ".mp3")
        
        do {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
            player.play()
        } catch {
            print("There was an error playing your audio file.")
        }
    }


}

