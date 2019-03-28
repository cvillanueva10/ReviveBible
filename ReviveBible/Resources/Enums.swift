//
//  Constants.swift
//  SpontaneousBibleVerses
//
//  Created by Christopher Villanueva on 2/24/19.
//  Copyright © 2019 Christopher Villanueva. All rights reserved.
//

import Foundation

enum Constants {
    static let apiKey = "16eb1d9b3e9bea76e07b5fcc65afb207"
    static let baseApiUrlString = "https://api.scripture.api.bible/v1/bibles/"
    static let versesUrlString = "verses/"
    static let chaptersUrlString = "chapters/"
}

enum BibleVersionUrls: String {
    case kingJames = "de4e12af7f28f599-01/"
}
