//
//  HTTPClient.swift
//  SpontaneousBibleVerses
//
//  Created by Christopher Villanueva on 2/25/19.
//  Copyright © 2019 Christopher Villanueva. All rights reserved.
//

import Foundation

class HTTPClient {

    func makeUrlRequest(forVerse verse: String, callback: @escaping (_ data: Data?, _ error: Error?) -> Void) {

        guard let verseUrl = URL(string: Constants.baesApiUrlString + verse) else {
            print("Could not create URL from baseApiUrl string")
            return
        }
        var urlRequest = URLRequest(url: verseUrl)
        urlRequest.setValue(Constants.apiKey, forHTTPHeaderField: "api-key")
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in

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
