//
//  TxtBaustein.swift
//  BibelSpiel
//
//  Created by Tobias Meisinger on 05.04.20.
//  Copyright © 2020 meitosoft. All rights reserved.
//

import Foundation

func TxtBaustein(language: Int, phrase: String) -> String {

    var strg = ""
        
    switch phrase {
        
        case "alle":
            if language == 0 {strg = "alle"}
            else if language == 1 {strg = "сите"}
        
        case "an":
            if language == 0 {strg = "An"}
            else if language == 1 {strg = "Вклучено"}
        
        case "anleitung":
            if language == 0 {strg = "Anleitung"}
            else if language == 1 {strg = "Упатства"}
        
        case "anleitungStart":
            if language == 0 {strg = "Herzlich Willkommen zum BibelSpiel! \n\nZugriff zu den Spieleinstellungen erlangst du über das Logo oben links. Dort kannst du auch deinen Namen eintragen. \n\nNEUES SPIEL - hier beginnst du eine neue Runde. \n\nFORTSCHRITT - hier siehst du die Punkte, die du in den verschiedenen Kategorien bisher erreicht hast. Auch andere Spieler werden aufgefüht. Du kannst die Kategorien über die Schieberegler ändern."}
            else if language == 1 {strg = "Добредојде до играта BibelSpiel! \n\nГоре лево можеш да влезеш во подесувањата. Таму можеш и да го внесиш твоето име. \n\nНОВА ИГРА - таму можеш за започнеш нова рунда на играта. \n\nНАПРЕДОК - таму ќе ги видиш поените што ги имаш добиено во различните категории. Таму се наведени и резултати на други играчи. Категориите можеш да ги смениш."}
        
        case "aufPlatz":
            if language == 0 {strg = "Du bist auf Platz"}
            else if language == 1 {strg = "Ти си на место број"}
        
        case "aus":
            if language == 0 {strg = "Aus"}
            else if language == 1 {strg = "Исклучено"}
        
        case "auswahlleisteBibelbuecher":
            if language == 0 {strg = "Auswahlleiste Bibelbücher"}
            else if language == 1 {strg = "Бирање библиски книги"}
        
        case "bibelteil":
            if language == 0 {strg = "Bibelteil"}
            else if language == 1 {strg = "Дел"}
        
        case "christlichGriechischeSchriften":
            if language == 0 {strg = "Christlich Griechische Schriften"}
            else if language == 1 {strg = "Грчките списи"}
        
        case "christlichGriechischeSchriftenAbk":
            if language == 0 {strg = "CHR"}
            else if language == 1 {strg = "ГС"}
        
        case "drei":
            if language == 0 {strg = "drei"}
            else if language == 1 {strg = "три"}
        
        case "durchschnittlicheZeit":
            if language == 0 {strg = "Durchschnittliche Zeit"}
            else if language == 1 {strg = "Просечно време"}
        
        case "einfach":
            if language == 0 {strg = "EINFACH"}
            else if language == 1 {strg = "ЛЕСНО"}
        
        case "einstellungen":
            if language == 0 {strg = "EINSTELLUNGEN"}
            else if language == 1 {strg = "ПОДЕСУВАЊА"}
        
        case "fehler":
            if language == 0 {strg = "Fehler"}
            else if language == 1 {strg = "Грешки"}
        
        case "fortschritt":
            if language == 0 {strg = "Fortschritt"}
            else if language == 1 {strg = "Напредок"}
        
        case "fuenf":
            if language == 0 {strg = "fünf"}
            else if language == 1 {strg = "пет"}
        
        case "gesamt":
            if language == 0 {strg = "Gesamt"}
            else if language == 1 {strg = "Вкупно"}
        
        case "hebraeischeSchriften":
            if language == 0 {strg = "Hebräische Schriften"}
            else if language == 1 {strg = "Хебрејски списи"}
        
        case "hebraeischeSchriftenAbk":
            if language == 0 {strg = "HEB"}
            else if language == 1 {strg = "ХЕБ"}
        
        case "hilfe":
            if language == 0 {strg = "Hilfe"}
            else if language == 1 {strg = "Помош"}
        
        case "hilfeAnzeigenTxt_1":
            if language == 0 {strg = "Hilfe für"}
            else if language == 1 {strg = "Покажи помош за"}
        
        case "hilfeAnzeigenTxt_2":
            if language == 0 {strg = "Punkte"}
            else if language == 1 {strg = "поени"}
        
        case "hilfeAnzeigenTxt_3":
            if language == 0 {strg = "anzeigen"}
            else if language == 1 {strg = ""}
        
        case "hilfeAnzeigenTxt_keine":
            if language == 0 {strg = "Keine Hilfe vorhanden"}
            else if language == 1 {strg = "Нема помош"}
        
        case "ja":
            if language == 0 {strg = "Ja"}
            else if language == 1 {strg = "Да"}
        
        case "kompletteBibel":
            if language == 0 {strg = "Komplette Bibel"}
            else if language == 1 {strg = "Цела Библија"}
        
        case "kompletteBibelAbk":
            if language == 0 {strg = "KOMPL"}
            else if language == 1 {strg = "ЦЕЛА"}
        
        case "links":
            if language == 0 {strg = "Links"}
            else if language == 1 {strg = "Лево"}
        
        case "mittel":
            if language == 0 {strg = "MITTEL"}
            else if language == 1 {strg = "СРЕДНО"}
        
        case "naechsteBibelbuch":
            if language == 0 {strg = "Bitte wählen"}
            else if language == 1 {strg = "Избери"}
        
        case "nein":
            if language == 0 {strg = "Nein"}
            else if language == 1 {strg = "Не"}
        
        case "neuerSpieler":
            if language == 0 {strg = "Neuer Spieler"}
            else if language == 1 {strg = "Нов играч"}
            
        case "neuesSpiel":
            if language == 0 {strg = "NEUES SPIEL"}
            else if language == 1 {strg = "НОВА ИГРА"}
        
        case "punkte":
            if language == 0 {strg = "Punkte"}
            else if language == 1 {strg = "Поени"}
        
        case "rechts":
            if language == 0 {strg = "Rechts"}
            else if language == 1 {strg = "Десно"}
        
        case "reihenfolgeBibelbuecher":
            if language == 0 {strg = "Reihenfolge der Bibelbücher"}
            else if language == 1 {strg = "Редоследот на библиските книги"}
        
        case "referenzzeit":
            if language == 0 {strg = "Referenzzeit"}
            else if language == 1 {strg = "Просечно време"}
        
        case "schwer":
            if language == 0 {strg = "SCHWER"}
            else if language == 1 {strg = "ТЕШКО"}
        
        case "schwierigkeit":
            if language == 0 {strg = "Level"}
            else if language == 1 {strg = "Ниво"}
        
        case "schwierigkeitsgradTxt_1":
            if language == 0 {strg = "Wähle die Reihenfolge der Bibelbücher aus. Du bekommst "}
            else if language == 1 {strg = "Нареди ги библиските книги по ред. Ќе добиеш "}
        
        case "schwierigkeitsgradTxt_2":
            if language == 0 {strg = " Bibelbücher zur Auswahl angezeigt."}
            else if language == 1 {strg = " библиски книги за избор."}
        
        case "sieben":
            if language == 0 {strg = "sieben"}
            else if language == 1 {strg = "седум"}
        
        case "soundeffekte":
            if language == 0 {strg = "Soundeffekte"}
            else if language == 1 {strg = "Звук"}
        
        case "spielBeenden":
            if language == 0 {strg = "Spiel beenden"}
            else if language == 1 {strg = "Прекини ја играва"}
        
        case "spielBeendenTxt":
            if language == 0 {strg = "Möchstest Du das Spiel wirklich beenden?"}
            else if language == 1 {strg = "Дали навистина сакаш да ја прекинеш играва?"}
        
        case "spieleGesamt":
            if language == 0 {strg = "Spiele gesamt"}
            else if language == 1 {strg = "Вкупно игри"}
        
        case "spielEinstellungen":
            if language == 0 {strg = "Spieleinstellungen"}
            else if language == 1 {strg = "Подесувања на играва"}
        
        case "spielende":
            if language == 0 {strg = "Spielende"}
            else if language == 1 {strg = "Крај на играта"}
        
        case "spieler":
            if language == 0 {strg = "Spieler"}
            else if language == 1 {strg = "Играч"}
        
        case "spielvorbereitungen":
            if language == 0 {strg = "Spielvorbereitungen"}
            else if language == 1 {strg = "Спремај ја играта"}
        
        case "sprache":
            if language == 0 {strg = "Sprache"}
            else if language == 1 {strg = "Јазик"}
        
        case "spracheWaehlen":
            if language == 0 {strg = "Bitte wähle eine Sprache"}
            else if language == 1 {strg = "Избери јазик"}
        
        case "sprDeutsch":
            if language == 0 {strg = "Deutsch"}
            else if language == 1 {strg = "Германски"}
        
        case "sprEnglisch":
            if language == 0 {strg = "Englisch"}
            else if language == 1 {strg = "Англиски"}
        
        case "sprMazedonisch":
            if language == 0 {strg = "Mazedonisch"}
            else if language == 1 {strg = "Македонски"}
        
        case "sprRomani":
            if language == 0 {strg = "Romani"}
            else if language == 1 {strg = "Ромски"}
        
        case "waehleSchwierigkeitsgrad":
            if language == 0 {strg = "Bitte wähle deinen Schwierigkeitsgrad aus"}
            else if language == 1 {strg = "Избери го нивото на играта"}
        
        case "weiter":
            if language == 0 {strg = "WEITER"}
            else if language == 1 {strg = "ПРОДОЛЖИ"}
        
        case "willkommen":
            if language == 0 {strg = "Herzlich Willkommen!"}
            else if language == 1 {strg = "Добредојде!"}
        
        case "zeit":
            if language == 0 {strg = "Zeit"}
            else if language == 1 {strg = "Време"}
        
        case "zeitbonus":
            if language == 0 {strg = "Zeitbonus"}
            else if language == 1 {strg = "Бонус"}

        case "zurueck":
            if language == 0 {strg = "ZURÜCK"}
            else if language == 1 {strg = "НАЗАД"}
        
       default:
            strg = ""
        
    }
            
    return strg
    
}
