//
//  Resource.swift
//  
//
//  Created by Alin Petrus on 08.02.2024.
//

import Foundation
import AirDataNetwork

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
