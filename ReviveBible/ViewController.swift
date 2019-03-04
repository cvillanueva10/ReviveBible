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
        let timeRange = buildTimeRangeFromComponents()
        let startTime = timeRange.0
        let endTime = timeRange.1
        generateRandomTimes(from: startTime, to: endTime)
    }
    
    private func buildTimeRangeFromComponents() -> (Date, Date) {
        let calendar = Calendar(identifier: .gregorian)
        var startTimeComponents = DateComponents()
        startTimeComponents.hour = 15
        startTimeComponents.minute = 10
        var endTimeComponents = DateComponents()
        endTimeComponents.hour = 19
        endTimeComponents.minute = 10
        guard let startTime = calendar.date(from: startTimeComponents),
            let endTime = calendar.date(from: endTimeComponents) else {
                fatalError("Time ranges failed to load")
        }
        return (startTime, endTime)
    }
    
    func fetchVerses(from verseStrings: [String]){
        let httpClient = HTTPClient()
        for verse in verseStrings {
            let verseUrl = verse
            httpClient.makeUrlRequest(forVerse: verseUrl) { (data, error) in
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
    
    private func generateRandomTimes(from startTime: Date, to endTime: Date) {
        let timeWindow = endTime.timeIntervalSince(startTime)
        let randomAmountOfOccurences = Int.random(in: 2..<6)
        for _ in 0..<randomAmountOfOccurences {
            let randomOffset = Double.random(in: 0..<timeWindow)
            print(randomOffset)
            let randomDate = Date(timeInterval: randomOffset, since: startTime)
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMMM dd EEEE hh:mm a"
            let randomDateString = dateFormatter.string(from: randomDate)
            print(randomDateString)
        }
    }
    
    private func printVerses(verses: [Verse]) {
        for v in verses {
            print(v.bookId)
            print(v.content)
        }
    }
}
