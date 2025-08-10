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
    @ObservedObject var settings = Settings.shared

    let positionX: CGFloat = 1.22

    private var hilfeText: String {
        if globals.hilfeVorhanden {
            return "\(TxtBaustein(language: settings.language, phrase: "hilfeAnzeigenTxt_1")) \(globals.hilfePunkte) \(TxtBaustein(language: settings.language, phrase: "hilfeAnzeigenTxt_2")) \(settings.language == 0 ? TxtBaustein(language: settings.language, phrase: "hilfeAnzeigenTxt_3") : "")\(globals.cheatHilfe ? "." : "")"
        } else {
            return "\(TxtBaustein(language: settings.language, phrase: "hilfeAnzeigenTxt_keine"))"
        }
    }

    private var auswahlMultipliers: (fortschritt: CGFloat, bibel: CGFloat) {
        settings.selectedAuswahlleiste == 0
            ? (0.345, positionX)
            : (0.645, 0.149)
    }

    var body: some View {

        GeometryReader { geometry in

            ZStack {
                Color.init("Hintergrund")

                VStack {
                    Kopfzeile(txtBaustein: "reihenfolgeBibelbuecher")
                        .frame(height: geometry.size.height * 0.21)

                    Spacer()
                }.padding(.top, 35)

                SpielFortschrittView()
                    .position(x: geometry.size.width * auswahlMultipliers.fortschritt, y: geometry.size.height * 0.515)

                BibelbuecherAuswahlView()
                    .position(x: geometry.size.width * auswahlMultipliers.bibel, y: geometry.size.height * 0.765)

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
                            Text(hilfeText)
                                .font(.title)
                                .bold()
                                .lineLimit(2)
                                .foregroundColor(Color("Dunkel"))
                                .allowsTightening(true)
                                .minimumScaleFactor(0.7)
                        }
                        Spacer()
                    }.frame(width: UIScreen.main.bounds.width * 0.28, height: UIScreen.main.bounds.height * 0.23) // 290 80
                }.position(x: UIScreen.main.bounds.width * 0.2, y: UIScreen.main.bounds.height * 0.845)


                Fusszeile()
                    .frame(height: UIScreen.main.bounds.height * (globals.hilfeAnzeigen ? 0.091 : 0.007))
                    .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height * 0.96)


                switch self.globals.position {
                case 8:
                    SpielEndeView(bibelteil: self.globals.bibelteil, schwierigkeitsgrad: self.globals.schwierigkeitsgrad)
                case 6, 7:
                   SpielEinstellungenView()
                default:
                    EmptyView()
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

