//
//  Settings.swift
//  ReviveBible
//
//  Created by Christopher Villanueva on 3/25/19.
//  Copyright © 2019 Christopher Villanueva. All rights reserved.
//

import Foundation

class Settings {

    static let shared = Settings()

    private(set) var bibleVersionUrl: BibleVersionUrls = .kingJames

    private init() { }

    func setBibleVersionUrl(as versionUrl: BibleVersionUrls) {
        self.bibleVersionUrl = versionUrl
    }

}
