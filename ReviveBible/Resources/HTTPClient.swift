//
//  HTTPClient.swift
//  SpontaneousBibleVerses
//
//  Created by Christopher Villanueva on 2/25/19.
//  Copyright © 2019 Christopher Villanueva. All rights reserved.
//

import Foundation

class HTTPClient {

    let settings = Settings.shared

    func buildUrlRequest(for scripture: BaseEnum, callback: @escaping (_ data: Data?, _ error: Error?) -> Void) {
        let urlString = Constants.baseApiUrlString + settings.bibleVersionUrl.description + scripture.urlSuffix
        guard let url = URL(string: urlString) else {
            print("Could not create URL from string")
            return
        }
        var urlRequest = URLRequest(url: url)
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
