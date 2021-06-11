//
//  API.swift
//  flightapp
//
//  Created by Onur Mavitas on 11.06.2021.
//

import Foundation

class API {
    
    func performRequest(completionHandler: @escaping ((FlightResponse) -> Void)) {
        
        guard let url = URL(string: Constants.baseUrl + Constants.apiKey) else { return }
        
            let config = URLSessionConfiguration.default
            config.waitsForConnectivity = true
            config.timeoutIntervalForResource = 20
            
            let session = URLSession(configuration: config)
            
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print("Error")
                    return
                }
                
                if let safeData = data {
                    let decoder = JSONDecoder()
                    do {
                        let decodedModel = try decoder.decode(FlightResponse.self, from: safeData)
                        DispatchQueue.main.async {
                            completionHandler(decodedModel)
                        }
                        print("Decoded Successfully")
                    } catch {
                        print("Decoding Error")
                    }
                } else {
                    print("Response Error")
                }
        }
            task.resume()
    }
}

