//
//  Requestable.swift
//  
//
//  Created by Alin Petrus on 19.01.2024.
//

import Foundation
import OSLog

public protocol Requestable: Resource, CustomStringConvertible {
    var method: HTTPMethod { get }
    var queryParameters: Codable? { get }
    var bodyParameters: Encodable? { get }
    var headers: [String: String] { get }
    
    var decoder: AnyDecoder { get }
    var encoder: AnyEncoder { get }
    
    var contentType: HTTPContentType { get }
    
    var configuration: URLRequestConfiguration { get }
}

public extension Requestable {
    
    var description: String {
        """
        Requestable:
            path: \(self.path)
            method: \(self.method)
            queryParameters: \(String(describing: self.queryParameters))
            bodyParameters: \(String(describing: self.bodyParameters))
            headers: \(self.headers)
            contentType: \(self.contentType)
        """
    }
    
}

public extension Requestable {
    
    var contentType: HTTPContentType {
        if self.decoder is JSONDecoder {
            return .json
        } else {
            Logger.networkLogger.fault("Add content type to support content type: \(self.contentType.rawValue)")
            fatalError("Add contentType support for decoder \(self.decoder)")
        }
    }
    
    var configuration: URLRequestConfiguration {
        URLRequestConfigurationImpl()
    }
    
    var headers: [String: String] {
        [:]
    }
    
}
