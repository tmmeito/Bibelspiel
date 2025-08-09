//
//  PlaySound.swift
//  BibelSpiel
//
//  Created by Tobias Meisinger on 23.04.20.
//  Copyright © 2020 meitosoft. All rights reserved.
//

import AVFoundation

var audioPlayer: AVAudioPlayer?

func PlaySound(sound: String, type: String, volume: Float) {
    
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
            audioPlayer?.volume = volume
        } catch {
            print("ERROR: Could not find and play sound file!")
        }
    }
}
