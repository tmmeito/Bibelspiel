//
//  ContentView.swift
//  BibelSpiel
//
//  Created by Tobias Meisinger on 04.04.20.
//  Copyright © 2020 meitosoft. All rights reserved.
//

import SwiftUI

struct StartView: View {
    
    @Environment(\.managedObjectContext) var moc
    //@Environment(\.horizontalSizeClass) var sizeClass
    //@Environment(\.sizeCategory) var sizeCategory
    @EnvironmentObject var globals: Globals
    @ObservedObject var settings = Settings()
    
    @State var showSpielvorbereitungen = false
    
    var body: some View {
        
        GeometryReader { geo in
            
            ZStack {
                Color.init("Hintergrund")
                
                VStack {
                    Kopfzeile(txtBaustein: "willkommen")
                        .frame(height: geo.size.height * 0.21)
                    
                    Spacer()
                    
                    
                    ButtonGrossView(txtBaustein: "neuesSpiel", fontBold: true)
                            .padding(.bottom, geo.size.height * 0.07)
                        
                    ButtonVariabelView(txtBaustein: "fortschritt", breite: 300, cornerRadius: 20, largeTitle: true, fontBold: false, uppercase: false)
                    
                    
                    Spacer()
                    
                    Fusszeile()
                        .frame(height: geo.size.height * 0.09)
                        .padding(.bottom, geo.size.height * 0.045)
                    
                }.padding(.top, 35)
                
                
                
                if self.globals.position == 2 {
                    Color.init("HintergrundTransparent")
                        //.opacity(self.globals.showEinstellungen ? 1.0 : 0.0)
                    
                    SpielEinstellungenView()
                        //.offset(x: self.globals.showEinstellungen ? 0 : -geo.size.width, y: 0)
                        //.animation(Animation.easeInOut(duration: 1))
                }
                 
                
                if self.globals.position == 3 {
                    SpielvorbereitungenView()
                }
                
                if self.globals.position == 4 {
                    FortschrittView()
                }
                
                
                if self.globals.position == 5 || self.globals.position == 8 || self.globals.position == 6 || self.globals.position == 7 {
                    SpielView()
                }
                
                if self.globals.position == 9 {
                    SpracheWaehlenView()
                }
                
                if self.globals.position == 10 {
                    WillkommenView()
                }
                
            }.edgesIgnoringSafeArea(.all)
                .onAppear() {
                    //print("\(self.sizeClass!) \(self.sizeCategory)")
                    
                    // Erster Start
                    if !self.settings.ersterStart {
                        // Sprache wählen und Anleitung anzeigen
                        self.globals.position = 9
                        
                        // Lautstärke setzen
                        self.settings.selectedSoundVolume = 0.1
                        
                        // Testspieler anlegen
                        let spieler = Spieler(context: self.moc)
                        spieler.name = "Spieler 1"
                        spieler.id = UUID()
                        self.settings.aktuellerSpielerName = spieler.name!
                        try! self.moc.save()
                        self.settings.ersterStart = true
                        
                    }
                }
            .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) { _ in
                // Enter background
            }
            .onReceive(NotificationCenter.default.publisher(for: UIApplication.keyboardWillShowNotification)) { _ in
                // Show Keyboard
            }
        }.edgesIgnoringSafeArea(.all)
        
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        return StartView()
            .environmentObject(Globals(language: 0))
            .environment(\.managedObjectContext, context)
            .previewLayout(.fixed(width: 1024, height: 768)) // ipad 9.7
            
            
        
    }
}
