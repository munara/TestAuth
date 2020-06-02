//
//  ResponseObject.swift
//  TestAuth
//
//  Created by Munara on 6/1/20.
//  Copyright © 2020 Munara. All rights reserved.
//

import Foundation

struct ResponseObject: Codable{
    let login: String
    let identifier: String
    let accessToken: String
    
    enum CodingKeys: String, CodingKey {
        case login
        case identifier = "id"
        case accessToken = "access_token"
    }
    init(from decoder: Decoder) throws {
        let contaner = try decoder.container(keyedBy: CodingKeys.self)
        login = try contaner.decode(String.self, forKey: .login)
        identifier = try contaner.decode(String.self, forKey: .identifier)
        accessToken = try contaner.decode(String.self, forKey: .accessToken)
    }
}
