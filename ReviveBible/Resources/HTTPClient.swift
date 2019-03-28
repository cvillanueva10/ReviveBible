//
//  HTTPClient.swift
//  SpontaneousBibleVerses
//
//  Created by Christopher Villanueva on 2/25/19.
//  Copyright © 2019 Christopher Villanueva. All rights reserved.
//

import Foundation

class HTTPClient {

    enum RequestType {
        case verse
        case chapter
    }

    private func buildBaseUrlString(of type: RequestType) -> String {
        let settings = Settings.shared
        var baseUrlString = Constants.baseApiUrlString + settings.bibleVersionUrl.rawValue
        switch type {
        case .verse:
            baseUrlString += Constants.versesUrlString
        case .chapter:
            baseUrlString += Constants.chaptersUrlString
        }
        return baseUrlString
    }

    func buildUrlRequest(forVerse verse: String, callback: @escaping (_ data: Data?, _ error: Error?) -> Void) {

        let baseUrlString = buildBaseUrlString(of: .verse)
        guard let verseUrl = URL(string: baseUrlString + verse) else {
            print("Could not create URL from string")
            return
        }
        var urlRequest = URLRequest(url: verseUrl)
        urlRequest.setValue(Constants.apiKey, forHTTPHeaderField: "api-key")
        send(urlRequest, with: callback)
    }

    func send(_ request: URLRequest, with callback: @escaping (_ data: Data?, _ error: Error?) -> Void) {
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print(error)
                return
            }
            guard let data = data else { return }
            callback(data, error)

        }
        task.resume()
    }



}
