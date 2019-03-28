//
//  Verse.swift
//  SpontaneousBibleVerses
//
//  Created by Christopher Villanueva on 2/24/19.
//  Copyright © 2019 Christopher Villanueva. All rights reserved.
//

import Foundation

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
