//
//  URLRequestBuilderImpl.swift
//
//
//  Created by Alin Petrus on 19.01.2024.
//

import Foundation
import OSLog

public struct URLRequestBuilderImpl: URLRequestBuilder {
    private var url: URL?
    private var method: HTTPMethod?
    private var headers: [String: String] = [:]
    private var body: Data?
    private var configuration: URLRequestConfiguration = URLRequestConfigurationImpl()
    
    public init() {}
    
    // MARK: - Public
    
    public func with(url: URL) -> Self {
        var copy = self
        copy.url = url
        
        return copy
    }
    
    public func with(method: HTTPMethod) -> Self {
        var copy = self
        copy.method = method
        
        return copy
    }
    
    public func with(headerKey: String, headerValue: String) -> Self {
        var copy = self
        copy.headers[headerKey] = headerValue
        
        return copy
    }
    
    public func with(headers: [String: String]) -> Self {
        var copy = self
        headers.forEach { key, value in
            copy.headers[key] = value
        }
        
        return copy
    }
    
    public func with(body: Data?) -> Self {
        var copy = self
        copy.body = body
        
        return copy
    }
    
    public func with(configuration: URLRequestConfiguration) -> Self {
        var copy = self
        copy.configuration = configuration
        
        return copy
    }
    
    public func build() throws -> URLRequest {
        guard let url else {
            throw NetworkError.missingUrl
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpBody = self.body
        
        self.headers.forEach { key, value in
            urlRequest.setValue(value, forHTTPHeaderField: key)
        }
        
        if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
            urlRequest.setValue(HTTPContentType.json.rawValue, forHTTPHeaderField: "Content-Type")
        }
        
        if urlRequest.value(forHTTPHeaderField: "Accept") == nil {
            urlRequest.setValue(HTTPContentType.json.rawValue, forHTTPHeaderField: "Accept")
        }
        
        self.configureRequest(&urlRequest)
        
        Logger.networkLogger.debug("Built url request: \(urlRequest)")
        
        return urlRequest
    }
    
    // MARK: - Private
    
    private func configureRequest(_ urlRequest: inout URLRequest) {
        urlRequest.timeoutInterval = configuration.timeoutInterval
        urlRequest.cachePolicy = configuration.cachePolicy
        urlRequest.allowsCellularAccess = configuration.options.contains(.allowsCellularAccess)
        urlRequest.allowsExpensiveNetworkAccess = configuration.options.contains(.allowsExpensiveNetworkAccess)
        urlRequest.allowsConstrainedNetworkAccess = configuration.options.contains(.allowsConstrainedNetworkAccess)
        urlRequest.assumesHTTP3Capable = configuration.options.contains(.assumeHTTP3Capable)
        urlRequest.httpShouldHandleCookies = configuration.options.contains(.httpShouldHandleCookies)
        urlRequest.httpShouldUsePipelining = configuration.options.contains(.httpShouldUsePipelining)
        urlRequest.networkServiceType = configuration.serviceType
    }
    
}
