//
//  AuthenticationService.swift
//  MobileID
//
//  Created by Akhil Vanka on 2/18/24.
//

import Combine
import SwiftData
import SwiftUI

struct oAuthCredentials: Decodable {
    var resourceOwnerKey: String
    var resourceOwnerSecret: String
}

@Model class User {
    var name: String
    @Attribute(.unique) var resourceKey: String
    var resourceSecret: String
    
    init(name: String, resourceKey: String, resourceSecret: String) {
        self.name = name
        self.resourceKey = resourceKey
        self.resourceSecret = resourceSecret
    }
    
    func updateName(name: String) {
        self.name = name
    }
}

class AuthenticationService: NSObject {
    func authenticateUser(username: String, password: String, finishedAuthentication: @escaping ((_ tokenStruct: Data) -> Void)) {
        guard let proxyURL = URL(string: "https://cbord.naus.app/authorize") else { return }
        let data: Data = "username=\(username)&password=\(password)&key=\(UIDevice.current.identifierForVendor?.uuidString ?? "")".data(using: .utf8)!
        var request : URLRequest = URLRequest(url: proxyURL)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField:"Content-Type");
        request.httpBody = data
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: request, completionHandler: { (data, response, error) in
            if let error = error {
                print(error) // TODO: Make Error Fail Notifcation
            } else if let data = data {
                finishedAuthentication(data)
            } else if response != nil {
              print("Got here somehow")
            }
        })
        task.resume()
    }
}

extension JSONDecoder {
    static let shared: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }()
}

extension Data {
    func decodedObject<T: Decodable>() throws -> T {
        try JSONDecoder.shared.decode(T.self, from: self)
    }
}
