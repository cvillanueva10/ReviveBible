//
//  Chapter.swift
//  ReviveBible
//
//  Created by Christopher Villanueva on 3/22/19.
//  Copyright © 2019 Christopher Villanueva. All rights reserved.
//

import Foundation

enum ChapterEnum: String, BaseEnum {
    case Genesis_1 = "GEN.1"
    case Genesis_2 = "GEN.2"

    var urlSuffix: String {
        return  "chapters/" + self.rawValue
    }
}

struct Chapter: Codable {
    let data: ChapterData
    var bookId: String {
        return data.bookId
    }
    var reference: String {
        return data.reference
    }
    var content: String {
        return data.content
    }

}

struct ChapterData: Codable {
    let bookId: String
    let reference: String
    let content: String
}
