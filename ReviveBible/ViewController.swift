//
//  ViewController.swift
//  SpontaneousBibleVerses
//
//  Created by Christopher Villanueva on 2/20/19.
//  Copyright © 2019 Christopher Villanueva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var verses: [Verse] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let verseStrings = ["MAT.11.1", "MAT.11.2", "ROM.12.2"]
        fetchVerses(from: verseStrings)
    }

    func fetchVerses(from verseStrings: [String]){
        let httpClient = HTTPClient()
        for verse in verseStrings {
            let verseUrl = verse
            httpClient.fetchVerseObjectFrom(fromVerse: verseUrl) { (data, error) in
                if let error = error {
                    NSLog("Error: \(error)")
                    return
                }
                guard let data = data else { return }
                guard let decodedVerse = try? JSONDecoder().decode(Verse.self, from: data) else { return }
                self.verses.append(decodedVerse)
                // printVerses // REFRESH UI
                // printVerses(verses: verses)
            }
        }
    }

    func printVerses(verses: [Verse]) {
        for v in verses {
            print(v.bookId)
            print(v.content)
        }

    }
}
