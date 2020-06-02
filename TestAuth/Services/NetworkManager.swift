//
//  NetworkManager.swift
//  TestAuth
//
//  Created by Munara on 6/1/20.
//  Copyright © 2020 Munara. All rights reserved.
//

import Foundation
enum APIError: Error {
    case responseError
    case decodingError
}
class NetworkManager {
    
    static let shared = NetworkManager()
    let resourceURL: URL
    private init() {
        let resourceString = "http://37.140.199.187:3000/auth/login"
        guard let resourceURL = URL(string: resourceString) else {fatalError("URL is not founded")}
        self.resourceURL = resourceURL
        
    }
    func signin(with login: String, password: String, completion: @escaping(Result<ResponseObject, APIError>) -> Void) {
       
       
        var urlRequest = URLRequest(url: resourceURL)
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let json: [String: Any] = ["username": login,
                                    "password": password]
        urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: json)
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { data, response, _ in
            guard let httpResponse = response as? HTTPURLResponse,
                httpResponse.statusCode == 201,
            let jsonData = data else {
                    completion(.failure(.responseError))
                    return
            }
            do {
                let responseData = try JSONDecoder().decode(ResponseObject.self, from: jsonData)
                completion(.success(responseData))
            } catch {
                completion(.failure(.decodingError))
            }
        }
        dataTask.resume()
       
    }

}
