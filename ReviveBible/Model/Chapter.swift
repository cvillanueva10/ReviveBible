//
//  Chapter.swift
//  ReviveBible
//
//  Created by Christopher Villanueva on 3/22/19.
//  Copyright © 2019 Christopher Villanueva. All rights reserved.
//

import Foundation

enum Chapters: String {
    case genOne = "GEN.1"
    case genTwo = "GEN.2"
}

struct Chapter: Codable {
    let chapterData: ChapterData
    var bookId: String {
        return chapterData.bookId
    }
    var reference: String {
        return chapterData.reference
    }
    var content: String {
        return chapterData.content
    }
}

struct ChapterData: Codable {
    let bookId: String
    let reference: String
    let content: String
}
