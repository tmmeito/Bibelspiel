//
//  SpielView.swift
//  BibelSpiel
//
//  Created by Tobias Meisinger on 11.04.20.
//  Copyright © 2020 meitosoft. All rights reserved.
//

import SwiftUI

struct SpielView: View {
    
    @EnvironmentObject var globals: Globals
    @ObservedObject var settings = Settings()
    
    let positionX: CGFloat = 1.22
    
    var body: some View {
        
        GeometryReader { geometry in
            
            ZStack {
                Color.init("Hintergrund")
                
                VStack {
                    Kopfzeile(txtBaustein: "reihenfolgeBibelbuecher")
                        .frame(height: geometry.size.height * 0.21)
                    
                    Spacer()
                }.padding(.top, 35)
                
                
                if self.settings.selectedAuswahlleiste == 0 { // rechts
                    SpielFortschrittView()
                        .position(x: UIScreen.main.bounds.width * 0.345, y: UIScreen.main.bounds.height * 0.515)

                    BibelbuecherAuswahlView()
                        .position(x: geometry.size.width * positionX, y: geometry.size.height * 0.765)
                        
                }
                else if self.settings.selectedAuswahlleiste == 1 {  // links
                    SpielFortschrittView()
                        .position(x: UIScreen.main.bounds.width * 0.645, y: UIScreen.main.bounds.height * 0.515)
                    BibelbuecherAuswahlView()
                        .position(x: UIScreen.main.bounds.width * 0.149, y: UIScreen.main.bounds.height * 0.515)
                }
                
                StatusbarView()
                    .position(x: geometry.size.width * positionX, y: geometry.size.height * 1.31)
                    
                BalkenView(txtBaustein: "zeit")
                    .position(x: geometry.size.width * 0.895, y: geometry.size.height * 1.31)
                
                BalkenView(txtBaustein: "fortschritt")
                    .position(x: geometry.size.width * 0.895, y: geometry.size.height * 1.37)
                
                HStack(spacing: 20) {
                    HilfeView()
                    
                    HStack {
                        VStack(alignment: .leading, spacing: -3) {
                            if self.globals.hilfeVorhanden {
                                Text("\(TxtBaustein(language: self.settings.language, phrase: "hilfeAnzeigenTxt_1")) \(self.globals.hilfePunkte) \(TxtBaustein(language: self.settings.language, phrase: "hilfeAnzeigenTxt_2")) \(self.settings.language == 0 ? TxtBaustein(language: self.settings.language, phrase: "hilfeAnzeigenTxt_3") : "")\(self.globals.cheatHilfe ? "." : "")")
                                    .font(.title)
                                    .bold()
                                    .lineLimit(2)
                                    .foregroundColor(Color("Dunkel"))
                                    .allowsTightening(true)
                                    .minimumScaleFactor(0.7)
                            } else {
                                Text("\(TxtBaustein(language: self.settings.language, phrase: "hilfeAnzeigenTxt_keine"))")
                                    .font(.title)
                                    .bold()
                                    .lineLimit(2)
                                    .foregroundColor(Color("Dunkel"))
                                    .allowsTightening(true)
                                    .minimumScaleFactor(0.7)
                            }
                        }
                        Spacer()
                    }.frame(width: UIScreen.main.bounds.width * 0.28, height: UIScreen.main.bounds.height * 0.23) // 290 80
                }.position(x: UIScreen.main.bounds.width * 0.2, y: UIScreen.main.bounds.height * 0.845)
                
                
                if self.globals.hilfeAnzeigen {
                    Fusszeile()
                        .frame(height: UIScreen.main.bounds.height * 0.091)
                        .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height * 0.96)
                } else {
                    Fusszeile()
                        .frame(height: UIScreen.main.bounds.height * 0.007)
                        .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height * 0.96)
                }
                
                
                
                if self.globals.position == 8 {
                    SpielEndeView(bibelteil: self.globals.bibelteil, schwierigkeitsgrad: self.globals.schwierigkeitsgrad)
                } else if self.globals.position == 6 || self.globals.position == 7 {
                   SpielEinstellungenView()
                }

            }
        }
    }
}


struct SpielView_Previews: PreviewProvider {
    static var previews: some View {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        return SpielView()
            .environmentObject(Globals(language: 0))
            .environment(\.managedObjectContext, context)
            .previewLayout(.fixed(width: 1024, height: 768))
    }
}
