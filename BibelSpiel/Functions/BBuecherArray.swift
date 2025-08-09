//
//  BBuecherArray.swift
//  BibelSpiel
//
//  Created by Tobias Meisinger on 12.04.20.
//  Copyright © 2020 meitosoft. All rights reserved.
//

import Foundation

func BBuecherArray(spracheID: Int) -> [Bibelbuch] {
    
    // bibelteil: 1- hebr  2- chr  3- kompl
    // spracheID: 0- deutsch  1- mazedonisch  2- english  3- romani
    
    var buecherArray = [Bibelbuch]()
    
    
    if spracheID == 0 {
        buecherArray.append(createBibelbuch(reihenfolgeNr: 1, kurz: "1Mo", lang: "1. Mose"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 2, kurz: "2Mo", lang: "2. Mose"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 3, kurz: "3Mo", lang: "3. Mose"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 4, kurz: "4Mo", lang: "4. Mose"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 5, kurz: "5Mo", lang: "5. Mose"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 6, kurz: "Jos", lang: "Josua"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 7, kurz: "Ri", lang: "Richter"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 8, kurz: "Ru", lang: "Ruth"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 9, kurz: "1Sa", lang: "1. Samuel"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 10, kurz: "2Sa", lang: "2. Samuel"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 11, kurz: "1Kö", lang: "1. Könige"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 12, kurz: "2Kö", lang: "2. Könige"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 13, kurz: "1Ch", lang: "1. Chronika"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 14, kurz: "2Ch", lang: "2. Chronika"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 15, kurz: "Esr", lang: "Esra"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 16, kurz: "Ne", lang: "Nehemia"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 17, kurz: "Est", lang: "Esther"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 18, kurz: "Hi", lang: "Hiob"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 19, kurz: "Ps", lang: "Psalmen"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 20, kurz: "Spr", lang: "Sprüche"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 21, kurz: "Pr", lang: "Prediger"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 22, kurz: "Hoh", lang: "Hohes Lied"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 23, kurz: "Jes", lang: "Jesaja"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 24, kurz: "Jer", lang: "Jeremia"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 25, kurz: "Klg", lang: "Klagelieder"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 26, kurz: "Hes", lang: "Hesekiel"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 27, kurz: "Da", lang: "Daniel"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 28, kurz: "Hos", lang: "Hosea"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 29, kurz: "Joel", lang: "Joel"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 30, kurz: "Am", lang: "Amos"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 31, kurz: "Ob", lang: "Obadja"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 32, kurz: "Jon", lang: "Jona"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 33, kurz: "Mi", lang: "Micha"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 34, kurz: "Nah", lang: "Nahum"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 35, kurz: "Hab", lang: "Habakuk"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 36, kurz: "Ze", lang: "Zephanja"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 37, kurz: "Hag", lang: "Haggai"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 38, kurz: "Sach", lang: "Sacharja"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 39, kurz: "Mal", lang: "Maleachi"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 40, kurz: "Mat", lang: "Matthäus"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 41, kurz: "Mar", lang: "Markus"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 42, kurz: "Luk", lang: "Lukas"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 43, kurz: "Joh", lang: "Johannes"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 44, kurz: "Apg", lang: "Apostelgeschichte"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 45, kurz: "Rö", lang: "Römer"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 46, kurz: "1Ko", lang: "1. Korinther"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 47, kurz: "2Ko", lang: "2. Korinther"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 48, kurz: "Gal", lang: "Galater"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 49, kurz: "Eph", lang: "Epheser"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 50, kurz: "Php", lang: "Philipper"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 51, kurz: "Kol", lang: "Kolosser"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 52, kurz: "1Th", lang: "1. Thessalonicher"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 53, kurz: "2Th", lang: "2. Thessalonicher"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 54, kurz: "1Ti", lang: "1. Timotheus"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 55, kurz: "2Ti", lang: "2. Timotheus"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 56, kurz: "Tit", lang: "Titus"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 57, kurz: "Phm", lang: "Philemon"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 58, kurz: "Heb", lang: "Hebräer"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 59, kurz: "Jak", lang: "Jakobus"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 60, kurz: "1Pe", lang: "1. Petrus"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 61, kurz: "2Pe", lang: "2. Petrus"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 62, kurz: "1Jo", lang: "1. Johannes"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 63, kurz: "2Jo", lang: "2. Johannes"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 64, kurz: "3Jo", lang: "3. Johannes"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 65, kurz: "Jud", lang: "Judas"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 66, kurz: "Off", lang: "Offenbarung"))
        
    } else if spracheID == 1 {
        buecherArray.append(createBibelbuch(reihenfolgeNr: 1, kurz: "1Мо", lang: "1. Мојсеева"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 2, kurz: "2Мо", lang: "2. Мојсеева"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 3, kurz: "3Mo", lang: "3. Мојсеева"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 4, kurz: "4Mo", lang: "4. Мојсеева"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 5, kurz: "5Mo", lang: "5. Мојсеева"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 6, kurz: "ИсН", lang: "Исус Навин"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 7, kurz: "Су", lang: "Судиите"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 8, kurz: "Рут", lang: "Рут"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 9, kurz: "1Са", lang: "1. Самоилова"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 10, kurz: "2Са", lang: "2. Самоилова"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 11, kurz: "1Ца", lang: "1. Царевите"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 12, kurz: "2Ца", lang: "2. Царевите"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 13, kurz: "1Ле", lang: "1. Летописи"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 14, kurz: "2Ле", lang: "2. Летописи"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 15, kurz: "Езр", lang: "Езра"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 16, kurz: "Не", lang: "Неемија"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 17, kurz: "Ес", lang: "Естира"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 18, kurz: "Јов", lang: "Јов"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 19, kurz: "Пс", lang: "Псалми"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 20, kurz: "Из", lang: "Изреки"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 21, kurz: "Про", lang: "Проповедник"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 22, kurz: "Пнп", lang: "Песна над песните"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 23, kurz: "Иса", lang: "Исаија"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 24, kurz: "Ере", lang: "Еремија"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 25, kurz: "Пл", lang: "Плач Еремин"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 26, kurz: "Езе", lang: "Езекиел"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 27, kurz: "Да", lang: "Даниел"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 28, kurz: "Ос", lang: "Осија"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 29, kurz: "Јл", lang: "Јоил"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 30, kurz: "Ам", lang: "Амос"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 31, kurz: "Авд", lang: "Авдија"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 32, kurz: "Јон", lang: "Јона"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 33, kurz: "Мх", lang: "Михеј"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 34, kurz: "На", lang: "Наум"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 35, kurz: "Авк", lang: "Авакум"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 36, kurz: "Сф", lang: "Софонија"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 37, kurz: "Аг", lang: "Агеј"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 38, kurz: "Зх", lang: "Захарија"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 39, kurz: "Мл", lang: "Малахија"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 40, kurz: "Мт", lang: "Матеј"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 41, kurz: "Мр", lang: "Марко"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 42, kurz: "Лк", lang: "Лука"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 43, kurz: "Јвн", lang: "Јован"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 44, kurz: "Де", lang: "Дела на апостолите"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 45, kurz: "Ри", lang: "Римјаните"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 46, kurz: "1Ко", lang: "1. Коринќаните"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 47, kurz: "2Ко", lang: "2. Коринќаните"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 48, kurz: "Га", lang: "Галатите"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 49, kurz: "Еф", lang: "Ефешаните"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 50, kurz: "Фп", lang: "Филипјаните"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 51, kurz: "Кол", lang: "Колошаните"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 52, kurz: "1Со", lang: "1. Солуњаните"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 53, kurz: "2Со", lang: "2. Солуњаните"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 54, kurz: "1Ти", lang: "1. Тимотеј"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 55, kurz: "2Ти", lang: "2. Тимотеј"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 56, kurz: "Тит", lang: "Тит"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 57, kurz: "Фм", lang: "Филимон"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 58, kurz: "Ев", lang: "Евреите"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 59, kurz: "Јк", lang: "Јаков"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 60, kurz: "1Пе", lang: "1. Петрово"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 61, kurz: "2Пе", lang: "2. Петрово"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 62, kurz: "1Јо", lang: "1. Јованово"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 63, kurz: "2Јо", lang: "2. Јованово"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 64, kurz: "3Јо", lang: "3. Јованово"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 65, kurz: "Ју", lang: "Јуда"))
        buecherArray.append(createBibelbuch(reihenfolgeNr: 66, kurz: "От", lang: "Откровение"))
    }
    
    
    return buecherArray
}



func createBibelbuch(reihenfolgeNr: Int, kurz: String, lang: String) -> Bibelbuch {
    
    var buch = Bibelbuch()
    buch.reihenfolgeNr = reihenfolgeNr
    buch.kurz = kurz
    buch.lang = lang
    
    return buch
}
