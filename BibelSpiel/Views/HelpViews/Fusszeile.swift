//
//  Fusszeile.swift
//  BibelSpiel
//
//  Created by Tobias Meisinger on 05.04.20.
//  Copyright © 2020 meitosoft. All rights reserved.
//

import SwiftUI

struct Fusszeile: View {
    
    @EnvironmentObject var globals: Globals
    @ObservedObject var settings = Settings()
    
    var body: some View {
        
        VStack {
            Spacer()
            HStack {
                Spacer()
                
                Text(self.wasAnzeigen())
                    .foregroundColor(Color("Hell"))
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .lineLimit(3)
                    .allowsTightening(true)
                    .minimumScaleFactor(0.8)
                
                Spacer()
            }
            Spacer()
        }.background(Color("Dunkel"))
    }
    
    
    func wasAnzeigen() -> String {
        
        var txt = " "
        
        if self.globals.hilfeAnzeigen {
            txt = self.globals.hilfeTxt
        } else if self.globals.position == 1 {
            //txt = "\(self.settings.aktuellerSpielerName)"
        }
        
        return txt
        
    }
    
}


struct Fusszeile_Previews: PreviewProvider {
    static var previews: some View {
        Fusszeile()
            .environmentObject(Globals(language: 0))
            .previewLayout(.fixed(width: 1024, height: 768))
            //.environment(\.sizeCategory, .large)
    }
}
