//
//  URLRequestBuilder.swift
//
//
//  Created by Alin Petrus on 19.01.2024.
//

import Foundation

public protocol URLRequestBuilder {
    
    func with(url: URL) -> Self
    func with(method: HTTPMethod) -> Self
    func with(headerKey: String, headerValue: String) -> Self
    func with(headers: [String: String]) -> Self
    func with(body: Data?) -> Self
    func with(configuration: URLRequestConfiguration) -> Self
    
    func build() throws -> URLRequest
}

extension URLRequestBuilder {
    
    public func urlRequest(forRequestable requestable: Requestable,
                           basePath: String,
                           urlBuilder: URLBuilder,
                           headers: [String: String]) throws -> URLRequest {
        try self
            .with(url: try urlBuilder.url(forRequestable: requestable, basePath: basePath))
            .with(method: requestable.method)
            .with(headerKey: "Content-Type", headerValue: requestable.contentType)
            .with(headers: headers)
            .with(body: try requestable.bodyParameters?.encoded(using: requestable.encoder))
            .with(configuration: requestable.configuration)
            .build()
    }
}
