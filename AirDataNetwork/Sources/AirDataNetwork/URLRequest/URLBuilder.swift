//
//  URLBuilder.swift
//
//
//  Created by Alin Petrus on 19.01.2024.
//

import Foundation

public protocol URLBuilder {
    
    func with(basePath: String) -> Self
    func with(endPointPath: String) -> Self
    func with(queryParameterKey key: String, parameterValue: Any) -> Self
    func with(queryParameters: [String: Any]) -> Self
    
    func build() throws -> URL
    
}

extension URLBuilder {
    
    public func url(forRequestable requestable: Requestable, basePath: String) throws -> URL {
        try self
            .with(basePath: basePath)
            .with(endPointPath: requestable.path)
            .with(queryParameters: try requestable.queryParameters?.asDictionary() ?? [:])
            .build()
    }
    
}
