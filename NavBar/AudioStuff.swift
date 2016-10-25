//
//  AudioStuff.swift
//  NavBar
//
//  Created by joey frenette on 2016-09-22.
//  Copyright © 2016 joey frenette. All rights reserved.
//

import AVFoundation

public var soundEffectPlayer: AVAudioPlayer?

public func playSoundEffect(_ filename: String) {
    let url = Bundle.main.url(forResource: filename, withExtension: nil)
    if (url == nil) {
        print("Could not find file: \(filename)")
        return
    }
    
    var error: NSError? = nil
    do {
        soundEffectPlayer = try AVAudioPlayer(contentsOf: url!)
    } catch let error1 as NSError {
        error = error1
        soundEffectPlayer = nil
    }
    if let player = soundEffectPlayer {
        player.numberOfLoops = 0
        player.prepareToPlay()
        player.play()
    } else {
        print("Could not create audio player: \(error!)")
    }
}

public func stopSoundEffect() {
    soundEffectPlayer?.stop()
}
