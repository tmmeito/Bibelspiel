//
//  TimerView.swift
//  BibelSpiel
//
//  Created by Tobias Meisinger on 14.04.20.
//  Copyright © 2020 meitosoft. All rights reserved.
//

import SwiftUI

struct TimerView: View {
    
    @EnvironmentObject var globals: Globals
    @Binding var timerInt: Int  // für Anzeigenbreite
    @State var nowDate: Date = Date()
    @State var spielDauerReferenzInt = 0
    
    let referenceDate: Date
    @State var timer: Timer?
    
    var body: some View {
        
        ZStack {
            Text("\(self.istTimerAktiv())")
            Text("\(self.timerInt > self.spielDauerReferenzInt ? "+": "")\(self.timerInt > self.spielDauerReferenzInt ? self.globals.zeitString(sekundenInt: self.timerInt - self.spielDauerReferenzInt) : self.globals.zeitString(sekundenInt: self.spielDauerReferenzInt - self.timerInt))")  // countUpString(from: referenceDate)
                .font(.subheadline)
                .bold()
                .foregroundColor(Color.init("Dunkel"))
            
        }.onAppear() {
            self.globals.timerAktiv = true
            self.spielDauerReferenzInt = self.globals.spieldauerReferenz()
            self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                //self.timerInt += 1
                self.timerUp()
            }
            self.timer?.tolerance = 0.3
            RunLoop.current.add(self.timer!, forMode: RunLoop.Mode.common)
        }
    }
    
    
    func timerUp() {
        // Timer läuft
        self.timerInt += 1
        
        // wenn Zeit abgelaufen ist, jede x Sekunde Punkte abziehen
        if self.timerInt > self.spielDauerReferenzInt {
            if self.globals.punkte - self.globals.calculateMinuspunkteZeit() > 0 {
                self.globals.punkte -= self.globals.calculateMinuspunkteZeit()
            } else {
                self.globals.punkte = 0
            }
        }
    }
    
    
    func countUpString(from date: Date) -> String {
        let calendar = Calendar(identifier: .gregorian)
        let components = calendar
            .dateComponents([.minute, .second],
                            from: referenceDate,
                            to: nowDate)
        return String(format: "%02d:%02d",
                      components.minute ?? 00,
                      components.second ?? 00)
    }
    
    
    func istTimerAktiv() -> String {
        
        if self.globals.timerAktiv {
            return ""
        } else {
            self.timer?.invalidate()
            if self.globals.spielStartDatumInt == 0 {
                self.globals.spielStartDatumInt = self.timerInt
            } 
            return ""
        }
    }
    
}


struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView(timerInt: .constant(5), referenceDate: Date())
            .environmentObject(Globals(language: 0))
            .previewLayout(.fixed(width: 1024, height: 768))
    }
}
