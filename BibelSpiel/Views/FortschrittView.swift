//
//  FortschrittView.swift
//  BibelSpiel
//
//  Created by Tobias Meisinger on 18.04.20.
//  Copyright © 2020 meitosoft. All rights reserved.
//

import SwiftUI

struct FortschrittView: View {

    @FetchRequest(entity: Fortschritt.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Fortschritt.datum, ascending: true)]) var gespeicherteFortschritte: FetchedResults<Fortschritt>
    @State var gefiltert = [Fortschritt]()
    @State var ungefilter = [Fortschritt]()
    
    @EnvironmentObject var globals: Globals
    @ObservedObject var settings = Settings()
    
    let hoehe = CGFloat(545)
    let hoeheHintergrundUeberschrift = CGFloat(60)
    let breite = CGFloat(625)
    
    @State var showHighscore = false
    @State var bibelteilInt = 0
    @State var schwierigkeitsgradInt = 0
    
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor.init(named: "Dunkel")
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.init(named: "Hell") as Any], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.init(named: "Dunkel") as Any], for: .normal)
    }
    
    
    var body: some View {
        
        ZStack {
            Color.init("HintergrundTransparent")
            
            // MARK: Fenster
            RoundedRectangle(cornerRadius: 20, style: .circular)
                .fill(Color("Hell"))
                .frame(width: self.breite, height: self.hoehe, alignment: .center)
                .shadow(color: Color("Schatten"), radius: 5, x: 5, y: 5)
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color("Dunkel"), lineWidth: 4))
            
            
            // MARK: Überschrift Text und Hintergrund
            ZStack() {
                HStack {
                    Text("\(TxtBaustein(language: self.settings.language, phrase: "fortschritt").uppercased())")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(Color("Hell"))
                        .padding(.top, 15)
                        .padding(.bottom, 15)
                }.frame(width: self.breite, height: self.hoeheHintergrundUeberschrift, alignment: .center)
                    .background(Color("Dunkel"))
                    .offset(x: 0, y: -220)
            }
            
            
            // MARK: Fensterinhalt
            HStack {
                Text("\(TxtBaustein(language: self.settings.language, phrase: "spieler"))")
                    .fontWeight(.bold)
                    .font(.title)
                    .foregroundColor(Color("Dunkel"))
                
                Spacer()
                
                Text("\(self.settings.aktuellerSpielerName)")
                    .font(.title)
                    .foregroundColor(Color("Dunkel"))
            }.frame(width: 500, height: 30)
                .offset(y: -150)
            
            
            HStack {
                Text("\(TxtBaustein(language: self.settings.language, phrase: "spieleGesamt")): ")
                    .fontWeight(.bold)
                    .font(.title)
                    .foregroundColor(Color("Dunkel"))
                
                Spacer()
                
                Text("\(self.gefiltert.count)")
                    .font(.title)
                    .font(.title)
                    .foregroundColor(Color("Dunkel"))
            }.frame(width: 500, height: 30)
                .offset(y: -110)
             
            
            // MARK: Picker
            HStack {
                Picker(selection: self.$bibelteilInt, label: Text("")) {
                    Text("\(TxtBaustein(language: self.settings.language, phrase: "hebraeischeSchriftenAbk"))").tag(1)
                    Text("\(TxtBaustein(language: self.settings.language, phrase: "christlichGriechischeSchriftenAbk"))").tag(2)
                    Text("\(TxtBaustein(language: self.settings.language, phrase: "kompletteBibelAbk"))").tag(3)
                    Text("\(TxtBaustein(language: self.settings.language, phrase: "alle"))").tag(0)
                }.pickerStyle(SegmentedPickerStyle())
                .frame(width: 270)
                
                Picker(selection: self.$schwierigkeitsgradInt, label: Text("")) {
                    Text("\(TxtBaustein(language: self.settings.language, phrase: "einfach"))").tag(1)
                    Text("\(TxtBaustein(language: self.settings.language, phrase: "mittel"))").tag(2)
                    Text("\(TxtBaustein(language: self.settings.language, phrase: "schwer"))").tag(3)
                    Text("\(TxtBaustein(language: self.settings.language, phrase: "alle"))").tag(0)
                }.pickerStyle(SegmentedPickerStyle())
                .frame(width: 270)
            }.offset(y: -60)
            
            
            // MARK: Highscore / Fortschritt
//            Button(action: {
//                self.showHighscore.toggle()
//            }) {
//                Text("\(self.showHighscore ? TxtBaustein(language: self.settings.language, phrase: "spieler") : TxtBaustein(language: self.settings.language, phrase: "alle"))")
//                    .font(.title)
//                    .bold()
//                    .foregroundColor(Color("Dunkel"))
//            }.offset(x: -230, y: 220)

            
            FortschrittFilterView(aktuellerSpielerName: "", bibelteil: self.bibelteilInt, schwierigkeitsgrad: self.schwierigkeitsgradInt)
                .frame(width: 500, height: 200)
                .offset(y: 70)
            
            
//            if self.showHighscore {
//                FortschrittFilterView(aktuellerSpielerName: self.settings.aktuellerSpielerName, bibelteil: self.globals.bibelteil, schwierigkeitsgrad: self.showSchwierigkeitsgrad)
//                    .frame(width: 500, height: 160)
//                    .offset(y: 90)
//            } else {
//                FortschrittListeView(gefiltert: $gefiltert)
//                .frame(width: 500, height: 200)
//                .offset(y: 70)
//            }
            
            
            // MARK: Button
            HStack {
                ButtonVariabelView(txtBaustein: "zurueck", breite: 200, fontBold: true, uppercase: true)
                    .offset(y: 220)
                    .padding()
            }
            
        }.onAppear() {
            self.gefiltert = self.gespeicherteFortschritte.filter { $0.spieler?.name == "\(self.settings.aktuellerSpielerName)" }
            self.globals.berechneDurchschnitte(gefiltert: self.gefiltert)
            self.ungefilter.append(contentsOf: self.gespeicherteFortschritte)
            
            self.bibelteilInt = self.globals.bibelteil
            self.schwierigkeitsgradInt = self.globals.schwierigkeitsgrad 
        }
    }
}





struct FortschrittView_Previews: PreviewProvider {
    static var previews: some View {
        FortschrittView()
            .environmentObject(Globals(language: 0))
            .previewLayout(.fixed(width: 1024, height: 768))
    }
}
