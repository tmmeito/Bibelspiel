//
//  SpielEinstellungenView.swift
//  BibelSpiel
//
//  Created by Tobias Meisinger on 17.04.20.
//  Copyright © 2020 meitosoft. All rights reserved.
//

import SwiftUI

struct SpielEinstellungenView: View {
    
    @EnvironmentObject var globals: Globals
    @ObservedObject var settings = Settings()
    
    let hoehe = CGFloat(545)
    let hoeheHintergrundUeberschrift = CGFloat(60)
    let breite = CGFloat(625)
    
    @State var showNeuerSpieler = false
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor.init(named: "Dunkel")
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.init(named: "Hell") as Any], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.init(named: "Dunkel") as Any], for: .normal)
    }
    
    
    var body: some View {
        
        ZStack {
            Color.init("HintergrundTransparent")
            ZStack {
                // Fenster
                RoundedRectangle(cornerRadius: 20, style: .circular)
                    .fill(Color("Hell"))
                    .frame(width: self.breite, height: self.hoehe, alignment: .center)
                    .shadow(color: Color("Schatten"), radius: 5, x: 5, y: 5)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color("Dunkel"), lineWidth: 4))
                
                // Überschrift Text und Hintergrund
                ZStack() {
                    HStack {
                        Text("\(TxtBaustein(language: self.settings.language, phrase: "spielEinstellungen").uppercased())")
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(Color("Hell"))
                            .padding(.top, 15)
                            .padding(.bottom, 15)
                    }.frame(width: self.breite, height: self.hoeheHintergrundUeberschrift, alignment: .center)
                        .background(Color("Dunkel"))
                        .offset(x: 0, y: -220)
                }
                
                // Fensterinhalt
                Einstellungen(showNeuerSpieler: self.$showNeuerSpieler)
                    .padding(.top, 20)
                    .frame(width: 500, height: 30)
                    .offset(y: self.showNeuerSpieler ? -70 : -10)
                
                // Button
                HStack {
                    ButtonVariabelView(txtBaustein: "zurueck", breite: 200, fontBold: true, uppercase: true)
                        .offset(y: 200)
                        .padding()
                    
                    if self.globals.position != 2 {
                        ButtonVariabelView(txtBaustein: "spielende", breite: 200, fontBold: false, uppercase: false)
                            .offset(y: 200)
                            .padding()
                    }
                }
                
                if self.globals.position == 7 {
                    SpielBeendenView()
                }
            }//.offset(y: self.showNeuerSpieler ? -150 : 0)
        }
    }
}


struct Einstellungen: View {
    
    @ObservedObject var settings = Settings()
    @EnvironmentObject var globals: Globals
    @Binding var showNeuerSpieler: Bool
    @State var showCredits = false
    @State var countShowCredits = 0
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 35) {
            if self.showNeuerSpieler == false {
                ZStack {
                    HStack {
                        Text("\(TxtBaustein(language: self.settings.language, phrase: "soundeffekte")): ")
                            .bold()
                        Spacer()
                        
                        Picker(selection: self.$settings.selectedSound, label: Text("")) {
                            Text("\(TxtBaustein(language: self.settings.language, phrase: "aus"))").tag(0)
                            Text("\(TxtBaustein(language: self.settings.language, phrase: "an"))").tag(1)
                        }.pickerStyle(SegmentedPickerStyle())
                            .frame(width: 155)
                    }.frame(width: 500, height: 30)
                    
                    
                    if self.settings.selectedSound == 1 && self.showCredits {
                        ShowCredits()
                            .offset(y: -60)
                            .onAppear() {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                                    withAnimation(.linear) {
                                        self.showCredits = false
                                    }
                                }
                        }
                    }
                    
                }.onAppear() {
                    withAnimation(
                        Animation.linear
                        .delay(1)
                    ) {
                        if self.countShowCredits == 0 {
                            self.showCredits = true
                            self.countShowCredits += 1
                        }
                    }
                }
            }
            
            if self.showNeuerSpieler == false {
                HStack {
                    Text("\(TxtBaustein(language: self.settings.language, phrase: "auswahlleisteBibelbuecher")): ")
                        .bold()
                    Spacer()
                    
                    Picker(selection: self.$settings.selectedAuswahlleiste, label: Text("")) {
                        Text("\(TxtBaustein(language: self.settings.language, phrase: "links"))").tag(1)
                        Text("\(TxtBaustein(language: self.settings.language, phrase: "rechts"))").tag(0)
                    }.pickerStyle(SegmentedPickerStyle())
                        .frame(width: 130)
                }.frame(width: 500, height: 30)
            }
            
            if self.showNeuerSpieler == false {
                if self.globals.position == 2 {
                    HStack {
                        Text("\(TxtBaustein(language: self.settings.language, phrase: "sprache")): ")
                            .bold()
                        Spacer()
                        
                        Picker(selection: self.$settings.language, label: Text("")) {
                            Text("\(TxtBaustein(language: self.settings.language, phrase: "sprDeutsch"))").tag(0)
                            Text("\(TxtBaustein(language: self.settings.language, phrase: "sprMazedonisch"))").tag(1)
                        }.pickerStyle(SegmentedPickerStyle())
                            .frame(width: 200)
                    }.frame(width: 500, height: 30)
                }
                
            }
            
            
            //            if self.globals.position == 2 {
            //                HStack {
            //                    Text("\(TxtBaustein(language: self.settings.language, phrase: "durchschnittlicheZeit"))")
            //                        .fontWeight(.bold)
            //                        .font(.title)
            //                        .foregroundColor(Color("Dunkel"))
            //
            //                    Spacer()
            //
            //                    Picker(selection: self.$settings.selectedZeit, label: Text("")) {
            //                        Text("\(TxtBaustein(language: self.settings.language, phrase: "aus"))").tag(0)
            //                        Text("\(TxtBaustein(language: self.settings.language, phrase: "an"))").tag(1)
            //                    }.pickerStyle(SegmentedPickerStyle())
            //                        .frame(width: 130)
            //                }.frame(width: 500, height: 30)
            //            }
            
            
            if self.globals.position == 2 {
                HStack {
                    Text("\(TxtBaustein(language: self.settings.language, phrase: "spieler"))")
                        .font(.title)
                        .fontWeight(.bold)
                        .font(.title)
                        .foregroundColor(Color("Dunkel"))
                    
                    Button(action: {
                        if self.settings.selectedSound == 1 {
                            PlaySound(sound: "select", type: "mp3", volume: self.settings.selectedSoundVolume)
                        }
                        withAnimation(.linear) {
                            self.showNeuerSpieler.toggle()
                        }
                    }) {
                        Image(systemName: "chevron.down")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20)
                            .foregroundColor(Color.init("Dunkel"))
                            .padding(.leading, 10)
                            .rotationEffect(Angle(degrees: self.showNeuerSpieler ? 0 : -180))
                    }
                    Spacer()
                    
                    Text("\(self.settings.aktuellerSpielerName)")
                        .font(.title)
                        .foregroundColor(Color("Dunkel"))
                }.frame(width: 500, height: 30)
                    .offset(y: self.showNeuerSpieler ? 25 : 0)
            }
            
            if self.showNeuerSpieler {
                EinstellungenSpielerView(settings: self.settings).transition(.opacity)
            }
            
            
        }.font(.title)
            .foregroundColor(Color.init("Dunkel"))
            .offset(y: -10)
    }
    
}




struct ShowCredits: View {
    
    var body: some View {
        
        Text("Sound effects obtained from https://www.zapsplat.com")
            .font(.body)
            .foregroundColor(Color.init("Dunkel"))
    }
}


struct SpielEinstellungenView_Previews: PreviewProvider {
    static var previews: some View {
        SpielEinstellungenView()
            .environmentObject(Globals(language: 0))
            .previewLayout(.fixed(width: 1024, height: 768))
    }
}
