//
//  Globals.swift
//  BibelSpiel
//
//  Created by Tobias Meisinger on 06.04.20.
//  Copyright © 2020 meitosoft. All rights reserved.
//

import Foundation
import SwiftUI

class Globals: ObservableObject {

    @Published var showEinstellungen: Bool
    @Published var showSpielvorbereitungen: Bool
    @Published var spielAktiv: Bool
    @Published var timerAktiv: Bool
    @Published var bibelteil: Int  // 1- hebr., 2- chr., 3- komplett
    @Published var schwierigkeitsgrad: Int // 1- einfach, 2- mittel, 3- schwer
    @Published var vorhandeneBBuecherArray: [Bibelbuch]
    @Published var vorhandeneBBuecherArrayCache: [Bibelbuch] // für die Auswahl (3, 5, alle)
    @Published var gewaehlteBBuecherArray: [Bibelbuch]
    @Published var falschGewaehlteBBuecherArray: [Bibelbuch]
    @Published var fehler: Int
    @Published var fortschrittLoeschen: Bool
    @Published var punkte: Int
    @Published var punkteCache: Int 
    @Published var fortschritt: Int  // Prozentzahl der richtig gewählten Bucher im Vergleich zu allen zu erratenden
    @Published var breiteAnzeigeFortschritt: CGFloat
    @Published var hilfePunkte: Int
    @Published var hilfeAnzeigen: Bool
    @Published var hilfeVorhanden: Bool  // nur dann wird Button Hilfe aktiviert
    @Published var hilfeArt: Int
    @Published var hilfeTxt: String // wird in Leiste unten angezeigt
    @Published var hilfeVerwandt: Int
    @Published var spielStartDatum: Date
    @Published var spielStartDatumInt: Int  // Spielzeit in Sek Int
    @Published var spieldauerEinfach1: Int
    @Published var spieldauerEinfach2: Int
    @Published var spieldauerEinfach3: Int
    @Published var spieldauerMittel1: Int
    @Published var spieldauerMittel2: Int
    @Published var spieldauerMittel3: Int
    @Published var spieldauerSchwer1: Int
    @Published var spieldauerSchwer2: Int
    @Published var spieldauerSchwer3: Int
    @Published var spieldauerDurchschnitteArray: [Int]
    @Published var letztesGespeichertesSpielId: UUID
    @Published var position: Int  // 1: willkommen  2: Einstellungen  3: Spielvorbereitung  4: Fortschritt  5: Spiel  6: Spieleinstellungen  7: Spiel beenden  8: Spielende  9: AnleitungStart
    @Published var cheatReihenfolgeBB: Bool  // double tap auf Spielvorbereitungen text
    @Published var cheatNaechstesBB: Bool  // double tap auf Bitte wählen
    @Published var cheatHilfe: Bool  // double tap auf Bitte wählen
    
    
    init(language: Int) {
        self.showEinstellungen = false
        self.showSpielvorbereitungen = false
        self.bibelteil = 3
        self.schwierigkeitsgrad = 0
        self.spielAktiv = false
        self.timerAktiv = false
        self.vorhandeneBBuecherArray = [Bibelbuch]()
        self.vorhandeneBBuecherArrayCache = [Bibelbuch]()
        self.gewaehlteBBuecherArray = [Bibelbuch]()
        self.falschGewaehlteBBuecherArray = [Bibelbuch]()
        self.fehler = 0
        self.fortschrittLoeschen = true
        self.punkte = 0
        self.punkteCache = 0
        self.fortschritt = 0
        self.breiteAnzeigeFortschritt = 0
        self.hilfePunkte = 0
        self.hilfeAnzeigen = false
        self.hilfeVorhanden = false
        self.hilfeArt = 1
        self.hilfeTxt = ""
        self.hilfeVerwandt = 0
        self.spielStartDatum = Date()
        self.spielStartDatumInt = 0
        self.spieldauerEinfach1 = 200
        self.spieldauerEinfach2 = 100
        self.spieldauerEinfach3 = 300
        self.spieldauerMittel1 = 320
        self.spieldauerMittel2 = 160
        self.spieldauerMittel3 = 480
        self.spieldauerSchwer1 = 460
        self.spieldauerSchwer2 = 220
        self.spieldauerSchwer3 = 680
        self.spieldauerDurchschnitteArray = [Int]()
        self.letztesGespeichertesSpielId = UUID()
        self.position = 1
        self.cheatReihenfolgeBB = false
        self.cheatNaechstesBB = false
        self.cheatHilfe = false
    }

    
    func calculateBreiteAnzeigeFortschritt(breite: CGFloat) -> CGFloat {
        
        return CGFloat(Int(breite - 14) * self.fortschritt / 100)

    }
    
    
    func calculateBreiteAnzeigeZeit(breite: CGFloat) -> CGFloat {

        let referenz = spieldauerReferenz()
        guard referenz > 0 else { return 0 }

        return CalculateBreiteAnzeigeZeit(breite: breite, spielStartDatumInt: self.spielStartDatumInt, spieldauerReferenz: referenz)
    }
    
    
    func spieldauerReferenz() -> Int {
        
        var dauer: Int = 0
        
        if self.schwierigkeitsgrad == 1 {
            
            switch self.bibelteil {
            case 1:
                dauer = self.spieldauerEinfach1
            case 2:
                dauer = self.spieldauerEinfach2
            case 3:
                dauer = self.spieldauerEinfach3
            default:
                dauer = self.spieldauerEinfach1
            }
            
        } else if self.schwierigkeitsgrad == 2 {
            
            switch self.bibelteil {
            case 1:
                dauer = self.spieldauerMittel1
            case 2:
                dauer = self.spieldauerMittel2
            case 3:
                dauer = self.spieldauerMittel3
            default:
                dauer = self.spieldauerMittel1
            }
        } else if self.schwierigkeitsgrad == 3 {
            
            switch self.bibelteil {
            case 1:
                dauer = self.spieldauerSchwer1
            case 2:
                dauer = self.spieldauerSchwer2
            case 3:
                dauer = self.spieldauerSchwer3
            default:
                dauer = self.spieldauerSchwer1
            }
        }
        
        return dauer
    }
    
    
    func calculatePluspunkte() -> Int {  // wieviele Punkte für jede richtige Auswahl je nach Schwierigkeitsgrad
        
        var punkte: Int = 0
        
        if self.schwierigkeitsgrad == 1 {  // leicht
            
            switch self.bibelteil {
            case 1:
                punkte = 20
            case 2:
                punkte = 20
            case 3:
                punkte = 50
            default:
                punkte = 10
            }
            
        } else if self.schwierigkeitsgrad == 2 {  // mittel
            
            switch self.bibelteil {
            case 1:
                punkte = 50
            case 2:
                punkte = 50
            case 3:
                punkte = 100
            default:
                punkte = 20
            }
        } else if self.schwierigkeitsgrad == 3 {  // schwer
            
            switch self.bibelteil {
            case 1:
                punkte = 100
            case 2:
                punkte = 100
            case 3:
                punkte = 150
            default:
                punkte = 50
            }
        }
        
        return punkte
    }
    
    
    func calculateMinuspunkte() -> Int {  // wieviele Punkte für jede richtige Auswahl je nach Schwierigkeitsgrad
        
        var punkte: Int = 0
        
        if self.schwierigkeitsgrad == 1 {  // leicht
            
            switch self.bibelteil {
            case 1:
                punkte = 30
            case 2:
                punkte = 60
            case 3:
                punkte = 90
            default:
                punkte = 20
            }
            
        } else if self.schwierigkeitsgrad == 2 {  // mittel
            
            switch self.bibelteil {
            case 1:
                punkte = 90
            case 2:
                punkte = 120
            case 3:
                punkte = 150
            default:
                punkte = 40
            }
        } else if self.schwierigkeitsgrad == 3 {  // schwer
            
            switch self.bibelteil {
            case 1:
                punkte = 200
            case 2:
                punkte = 400
            case 3:
                punkte = 600
            default:
                punkte = 100
            }
        }
        
        return punkte
    }
    
    
    func calculateHilfepunkte() -> Int {  // wieviele Punkte für Hilfe je nach Schwierigkeitsgrad
        
        var punkte: Int = 0
        
        if self.schwierigkeitsgrad == 1 {  // leicht
            
            switch self.bibelteil {
            case 1:
                punkte = 20
            case 2:
                punkte = 40
            case 3:
                punkte = 60
            default:
                punkte = 10
            }
            
        } else if self.schwierigkeitsgrad == 2 {  // mittel
            
            switch self.bibelteil {
            case 1:
                punkte = 60
            case 2:
                punkte = 80
            case 3:
                punkte = 100
            default:
                punkte = 20
            }
        } else if self.schwierigkeitsgrad == 3 {  // schwer
            
            switch self.bibelteil {
            case 1:
                punkte = 150
            case 2:
                punkte = 300
            case 3:
                punkte = 450
            default:
                punkte = 50
            }
        }
        
        return punkte
    }
    
    
    func calculateMinuspunkteZeit() -> Int {  // wieviel Punkteabzug für jede Sek wenn Zeit abgelaufen
        
        var punkte: Int = 0
        let leicht = 600
        let mittel = 300
        let schwer = 150
        
        if self.schwierigkeitsgrad == 1 {  // leicht: 200% plus
            
            switch self.bibelteil {
            case 1:
                
                punkte = (self.calculatePluspunkte() * 39) / (self.spieldauerEinfach1 * leicht / 100 )
            case 2:
                punkte = (self.calculatePluspunkte() * 27) / (self.spieldauerEinfach2 * leicht / 100)
            case 3:
                punkte = (self.calculatePluspunkte() * 66) / (self.spieldauerEinfach3 * leicht / 100)
            default:
                punkte = (self.calculatePluspunkte() * 66) / (self.spieldauerEinfach1 * leicht / 100)
            }
            
        } else if self.schwierigkeitsgrad == 2 {  // mittel: 100% plus
            
            switch self.bibelteil {
            case 1:
                punkte = (self.calculatePluspunkte() * 39) / (self.spieldauerMittel1 * mittel / 100)
            case 2:
                punkte = (self.calculatePluspunkte() * 27) / (self.spieldauerMittel2 * mittel / 100)
            case 3:
                punkte = (self.calculatePluspunkte() * 66) / (self.spieldauerMittel3 * mittel / 100)
            default:
                punkte = (self.calculatePluspunkte() * 66) / (self.spieldauerMittel1 * mittel / 100)
            }
        } else if self.schwierigkeitsgrad == 3 {  // schwer: 50% plus
            
            switch self.bibelteil {
            case 1:
                punkte = (self.calculatePluspunkte() * 39) / (self.spieldauerSchwer1 * schwer / 100)
            case 2:
                punkte = (self.calculatePluspunkte() * 27) / (self.spieldauerSchwer2 * schwer / 100)
            case 3:
                punkte = (self.calculatePluspunkte() * 66) / (self.spieldauerSchwer3 * schwer / 100)
            default:
                punkte = (self.calculatePluspunkte() * 66) / (self.spieldauerSchwer1 * schwer / 100)
            }
        }
        
        return punkte
    }
    
    
    func calculatePluspunkteZeit() -> Int {  // wieviel Punkte Gutschrift für jede Sek wenn Zeit abgelaufen
        
        var punkte: Double = 0
        let leicht = 200
        let mittel = 100
        let schwer = 50
        
        if self.schwierigkeitsgrad == 1 {  // leicht: 200% plus
            
            switch self.bibelteil {
            case 1:
                punkte = Double(self.calculatePluspunkte() * 39) / Double((self.spieldauerEinfach1 * leicht / 100))
            case 2:
                punkte = Double(self.calculatePluspunkte() * 27) / Double(self.spieldauerEinfach2 * leicht / 100)
            case 3:
                punkte = Double(self.calculatePluspunkte() * 66) / Double(self.spieldauerEinfach3 * leicht / 100)
            default:
                punkte = Double(self.calculatePluspunkte() * 66) / Double(self.spieldauerEinfach1 * leicht / 100)
            }
            
        } else if self.schwierigkeitsgrad == 2 {  // mittel: 100% plus
            
            switch self.bibelteil {
            case 1:
                punkte = Double(self.calculatePluspunkte() * 39) / Double(self.spieldauerMittel1 * mittel / 100)
            case 2:
                punkte = Double(self.calculatePluspunkte() * 27) / Double(self.spieldauerMittel2 * mittel / 100)
            case 3:
                punkte = Double(self.calculatePluspunkte() * 66) / Double(self.spieldauerMittel3 * mittel / 100)
            default:
                punkte = Double(self.calculatePluspunkte() * 66) / Double(self.spieldauerMittel1 * mittel / 100)
            }
        } else if self.schwierigkeitsgrad == 3 {  // schwer: 50% plus
            
            switch self.bibelteil {
            case 1:
                punkte = Double(self.calculatePluspunkte() * 39) / Double(self.spieldauerSchwer1 * schwer / 100)
            case 2:
                punkte = Double(self.calculatePluspunkte() * 27) / Double(self.spieldauerSchwer2 * schwer / 100)
            case 3:
                punkte = Double(self.calculatePluspunkte() * 66) / Double(self.spieldauerSchwer3 * schwer / 100)
            default:
                punkte = Double(self.calculatePluspunkte() * 66) / Double(self.spieldauerSchwer1 * schwer / 100)
            }
        }
        
        punkte = round(punkte)
        return Int(punkte)
    }
    
    
    func berechneDurchschnitte(gefiltert: [Fortschritt]) {
        
        var ergebnisseArray = [Int]()
        
        let hebEinfach = gefiltert.filter { $0.bibelteil == 1 && $0.schwierigkeitsgrad == 1 }
        let hebMittel = gefiltert.filter { $0.bibelteil == 1 && $0.schwierigkeitsgrad == 2 }
        let hebSchwer = gefiltert.filter { $0.bibelteil == 1 && $0.schwierigkeitsgrad == 3 }
        
        let chrEinfach = gefiltert.filter { $0.bibelteil == 2 && $0.schwierigkeitsgrad == 1 }
        let chrMittel = gefiltert.filter { $0.bibelteil == 2 && $0.schwierigkeitsgrad == 2 }
        let chrSchwer = gefiltert.filter { $0.bibelteil == 2 && $0.schwierigkeitsgrad == 3 }
        
        let komplEinfach = gefiltert.filter { $0.bibelteil == 3 && $0.schwierigkeitsgrad == 1 }
        let komplMittel = gefiltert.filter { $0.bibelteil == 3 && $0.schwierigkeitsgrad == 2 }
        let komplSchwer = gefiltert.filter { $0.bibelteil == 3 && $0.schwierigkeitsgrad == 3 }
        
        // Durchschnitte berechnen
        ergebnisseArray.append(berechneDurchschnitt(gefilterte: hebEinfach))
        ergebnisseArray.append(berechneDurchschnitt(gefilterte: hebMittel))
        ergebnisseArray.append(berechneDurchschnitt(gefilterte: hebSchwer))
        
        ergebnisseArray.append(berechneDurchschnitt(gefilterte: chrEinfach))
        ergebnisseArray.append(berechneDurchschnitt(gefilterte: chrMittel))
        ergebnisseArray.append(berechneDurchschnitt(gefilterte: chrSchwer))
        
        ergebnisseArray.append(berechneDurchschnitt(gefilterte: komplEinfach))
        ergebnisseArray.append(berechneDurchschnitt(gefilterte: komplMittel))
        ergebnisseArray.append(berechneDurchschnitt(gefilterte: komplSchwer))

        self.spieldauerDurchschnitteArray.removeAll()
        self.spieldauerDurchschnitteArray = ergebnisseArray
        
    }
    
    
    func berechneDurchschnitt(gefilterte: [Fortschritt]) -> Int {
        
        var durchschn = 0
        
        for spiel in gefilterte {
            durchschn += Int(spiel.spieldauer)
        }
        
        if durchschn > 0 {
            durchschn = durchschn / gefilterte.count
        }
        
        return durchschn
    }
    
    
    func prepareCache() {
        
        // das nächste Bibelbuch hinzufügen
        self.vorhandeneBBuecherArrayCache = self.vorhandeneBBuecherArray.filter { $0.reihenfolgeNr == self.gewaehlteBBuecherArray.count + 1 }
        
        // die restlichen vorhandenen Bibelbücher durchmischen
        let shuffeledCache = self.vorhandeneBBuecherArray.filter({ $0.reihenfolgeNr != self.gewaehlteBBuecherArray.count + 1 }).shuffled()
        
        // aus gemischten Bibelbüchern noch x auswählen und Cache hinzufügen
       
        if self.schwierigkeitsgrad == 1 {
            
            if self.vorhandeneBBuecherArray.count >= 3 {
                self.vorhandeneBBuecherArrayCache.append(shuffeledCache[0])
                self.vorhandeneBBuecherArrayCache.append(shuffeledCache[1])
                if !self.cheatReihenfolgeBB {
                    self.vorhandeneBBuecherArrayCache.shuffle()
                }
                
            } else if self.vorhandeneBBuecherArray.count == 2 {
                self.vorhandeneBBuecherArrayCache.append(shuffeledCache[0])
                if !self.cheatReihenfolgeBB {
                    self.vorhandeneBBuecherArrayCache.shuffle()
                }
            }
            
        } else if self.schwierigkeitsgrad == 2 {
            
            if self.vorhandeneBBuecherArray.count >= 7 {
                for i in 0...5 {
                    self.vorhandeneBBuecherArrayCache.append(shuffeledCache[i])
                }
            }  else if self.vorhandeneBBuecherArray.count == 6 {
                for i in 0...4 {
                    self.vorhandeneBBuecherArrayCache.append(shuffeledCache[i])
                }
            }  else if self.vorhandeneBBuecherArray.count == 5 {
                for i in 0...3 {
                    self.vorhandeneBBuecherArrayCache.append(shuffeledCache[i])
                }
            }  else if self.vorhandeneBBuecherArray.count == 4 {
                for i in 0...2 {
                    self.vorhandeneBBuecherArrayCache.append(shuffeledCache[i])
                }
            }  else if self.vorhandeneBBuecherArray.count == 3 {
                for i in 0...1 {
                    self.vorhandeneBBuecherArrayCache.append(shuffeledCache[i])
                }
            }  else if self.vorhandeneBBuecherArray.count == 2 {
                self.vorhandeneBBuecherArrayCache.append(shuffeledCache[0])
            }
            
            if !self.cheatReihenfolgeBB {
                self.vorhandeneBBuecherArrayCache.shuffle()
            }
            
        } else {
            self.vorhandeneBBuecherArrayCache = self.vorhandeneBBuecherArray
        }
        
    }
    
    
    func zeitString (sekundenInt : Int) -> String {
        
        //let (h,m,s) = (sekundenInt / 3600, (sekundenInt % 3600) / 60, (sekundenInt % 3600) % 60)
        let (m,s) = ((sekundenInt % 3600) / 60, (sekundenInt % 3600) % 60)
        let null = "0"
        let minuten = String(m)
        let sekunden = String(s)
        return "\(minuten):\(s < 10 ? null + sekunden : sekunden)"
    }
    
    
    func buttonActions(txtBaustein: String) {
        
        // SPRACHE WÄHLEN
        if self.position == 9 { // von Sprache wählen
            self.position = 10  // zu AnleitungStart
        }
        
        // ANLEITUNGSTART
        else if self.position == 10 { // von AnleitungStart
            self.position = 1  // zu Start
        }
        
        // EINSTELLUNGEN
        else if self.position == 2 { // von Einstellungen
            self.position = 1  // zu Start
        } else if self.position == 1 && txtBaustein == "fortschritt" {  // von Einstellungen
            self.position = 4  // zu Fortschritt
        }
        
        // FORTSCHRITT
        else if self.position == 4 {  // von Fortschritt
            self.position = 1  // zu Start
        }
            
        // SPIELVORBEREITUNGEN
        else if self.position == 3 { // von Spielvorbereitung
            
        } else if self.position == 6 && txtBaustein != "spielende" { // von Spieleinstellungen
            self.position = 5  // zu Spiel
        } else if self.position == 6 && txtBaustein == "spielende" { // von Spieleinstellungen
            self.position = 7  // zu Spiel beenden
        }
        
        // SPIEL BEENDEN?
        else if self.position == 7 && txtBaustein == "ja" {  // von Spiel beenden
            self.timerAktiv = false
            self.hilfeAnzeigen = false
            self.position = 1  // zu Start
        }
        
        else if self.position == 7 && txtBaustein == "nein" {  // von Spiel beenden
            self.position = 6  // zu Spieleinstellungen
        }
        
        // SPIEL BEENDET
        else if self.position == 8 {  // von Spielende
            self.position = 1  // zu Start
        }
    }
    
    
    // MARK: - Spielstart
    func spielStart(settings: Settings) {
        
        self.spielStartDatum = Date()
        self.spielStartDatumInt = 0
        self.gewaehlteBBuecherArray.removeAll()
        self.fehler = 0
        self.punkte = 0
        self.fortschritt = 0
        self.hilfePunkte = self.calculateHilfepunkte()
        
        // Arrays vorbereiten
        if self.bibelteil == 1 {
            
            if self.cheatReihenfolgeBB {
                self.vorhandeneBBuecherArray = BBuecherArray(spracheID: settings.language)
                    .filter { $0.reihenfolgeNr <= 39 }
            } else {
                self.vorhandeneBBuecherArray = BBuecherArray(spracheID: settings.language)
                .filter { $0.reihenfolgeNr <= 39 }
                .shuffled()
            }
            
            self.prepareCache()
            
            
        } else if self.bibelteil == 2 {
            
            if self.cheatReihenfolgeBB {
                self.vorhandeneBBuecherArray = BBuecherArray(spracheID: settings.language)
                .filter { $0.reihenfolgeNr > 39 }
            } else {
                self.vorhandeneBBuecherArray = BBuecherArray(spracheID: settings.language)
                .filter { $0.reihenfolgeNr > 39 }
                .shuffled()
            }
                
            self.vorhandeneBBuecherArrayCache = self.vorhandeneBBuecherArray

            self.gewaehlteBBuecherArray.append(contentsOf: BBuecherArray(spracheID: settings.language)
                .filter { $0.reihenfolgeNr <= 39 })
            
            self.prepareCache()
            
            
        } else if self.bibelteil == 3 {
            
            if self.cheatReihenfolgeBB {
                self.vorhandeneBBuecherArray = BBuecherArray(spracheID: settings.language)
            } else {
                self.vorhandeneBBuecherArray = BBuecherArray(spracheID: settings.language)
                    .shuffled()
            }
            
            self.prepareCache()
        }
        
    }
    
    // MARK: - Hilfe auswählen // Hilfe vorhanden?
    func hilfeAuswaehlen(language: Int, hilfeArt: Int) {
        
        // hilfeArt - 1: Bibelverse, 2: Text, 3: Schreiber
        var hilfeTxt = ""
            
        if hilfeArt == 1 {
            let array = BibelverseArray(spracheID: language)
            let texteFuerBB = array.filter { $0.reihenfolgeNr == self.gewaehlteBBuecherArray.count + 1 }
            
            hilfeTxt = texteFuerBB.randomElement()?.txt ?? ""
            
            if hilfeTxt != "" {
                self.hilfeVorhanden = true
            } else {
                self.hilfeVorhanden = false
            }
        }
        
        self.hilfeTxt = hilfeTxt
    }
    
    
    
    // MARK: - Spiel zu Ende
    func spielEnde() {
        self.timerAktiv = false
        self.hilfeAnzeigen = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.position = 8
        }
    }

}
