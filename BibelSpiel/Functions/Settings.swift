//
//  Settings.swift
//  BibelSpiel
//
//  Created by Tobias Meisinger on 09.04.20.
//  Copyright © 2020 meitosoft. All rights reserved.
//

import Foundation

class Settings: ObservableObject {
    
    @Published var ersterStart: Bool = UserDefaults.standard.bool(forKey: "ersterStart") {
        didSet {
            UserDefaults.standard.set(self.ersterStart, forKey: "ersterStart")
        }
    }
    
    @Published var language: Int = UserDefaults.standard.integer(forKey: "language") {  // 1- deutsch  2- mazedonisch  3- english  4- romani
        didSet {
            UserDefaults.standard.set(self.language, forKey: "language")
        }
    }
    
    @Published var selectedSound: Int = UserDefaults.standard.integer(forKey: "selectedSound") {
        didSet {
            UserDefaults.standard.set(self.selectedSound, forKey: "selectedSound")
        }
    }
    
    @Published var selectedSoundVolume: Float = UserDefaults.standard.float(forKey: "selectedSoundVolume") {
        didSet {
            UserDefaults.standard.set(self.selectedSoundVolume, forKey: "selectedSoundVolume")
        }
    }
    
    @Published var selectedAuswahlleiste: Int = UserDefaults.standard.integer(forKey: "selectedAuswahlleiste") {
        didSet {
            UserDefaults.standard.set(self.selectedAuswahlleiste, forKey: "selectedAuswahlleiste")
        }
    }
    
    @Published var selectedZeit: Int = UserDefaults.standard.integer(forKey: "selectedZeit") {
        didSet {
            UserDefaults.standard.set(self.selectedZeit, forKey: "selectedZeit")
        }
    }
    
    @Published var aktuellerSpielerName: String = UserDefaults.standard.string(forKey: "aktuellerSpielerName") ?? "" {
        didSet {
            UserDefaults.standard.set(self.aktuellerSpielerName, forKey: "aktuellerSpielerName")
        }
    }
    
}
