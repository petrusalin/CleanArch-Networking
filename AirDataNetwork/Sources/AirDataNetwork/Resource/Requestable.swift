//
//  Requestable.swift
//  
//
//  Created by Alin Petrus on 19.01.2024.
//

import Foundation

public protocol Requestable: Resource {
    var method: HTTPMethod { get }
    var queryParameters: Codable? { get }
    var bodyParameters: Encodable? { get }
    
    var decoder: AnyDecoder { get }
    var encoder: AnyEncoder { get }
    
    var contentType: String { get }
    
    var configuration: URLRequestConfiguration { get }
}

extension Requestable {
    
    public var contentType: String {
        if self.decoder is JSONDecoder {
            return "application/json"
        } else {
            fatalError("Add contentType")
        }
    }
    
    public var configuration: URLRequestConfiguration {
        return URLRequestConfigurationImpl()
    }
    
}
