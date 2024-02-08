//
//  PostsAPI.swift
//  postsuikit
//
//  Created by Alin Petrus on 18.01.2024.
//

import Foundation
import AirDataNetwork
import Models

enum Resource: String, AirDataNetwork.Requestable {
    case posts
    
    var method: HTTPMethod {
        .get
    }
    
    var queryParameters: Codable? { return nil }
    
    var bodyParameters: Encodable? { return nil }
    
    var decoder: AirDataNetwork.AnyDecoder { JSONDecoder() }
    
    var encoder: AirDataNetwork.AnyEncoder { JSONEncoder() }
    
    var path: String { self.rawValue }
}

public protocol PostAPI {
    func requestPosts() async throws -> [Post]
}
