//
//  Verse.swift
//  SpontaneousBibleVerses
//
//  Created by Christopher Villanueva on 2/24/19.
//  Copyright © 2019 Christopher Villanueva. All rights reserved.
//

import Foundation

enum VerseEnum: String, BaseEnum {
    case Matthew_11_1 = "MAT.11.1"
    case Matthew_11_2 = "MAT.11.2"
    case Romans_12_2 = "ROM.12.2"
    case First_Corinthians_13_4 = "1CO.13.4"
    var urlSuffix: String {
        return "verses/" + self.rawValue
    }
}

struct Verse: Codable {
    var data: VerseData
    var bibleId: String {
        return data.bibleId
    }
    var bookId: String {
        return data.bookId
    }
    var chapterId: String {
        return data.bookId
    }
    var content: String {
        return data.content
    }
}

struct VerseData: Codable {
    let bibleId: String
    let bookId: String
    let chapterId: String
    let content: String
}
