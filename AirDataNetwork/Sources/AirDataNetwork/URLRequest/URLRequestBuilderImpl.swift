//
//  URLRequestBuilderImpl.swift
//
//
//  Created by Alin Petrus on 19.01.2024.
//

import Foundation

public final class URLRequestBuilderImpl: URLRequestBuilder {
    private var url: URL?
    private var method: HTTPMethod?
    private var headers: [String: String] = [:]
    private var body: Data?
    private var configuration: URLRequestConfiguration = URLRequestConfigurationImpl()
    
    public init() {}
    
    // MARK: - Public
    
    public func with(url: URL) -> Self {
        self.url = url
        
        return self
    }
    
    public func with(method: HTTPMethod) -> Self {
        self.method = method
        
        return self
    }
    
    public func with(headerKey: String, headerValue: String) -> Self {
        self.headers[headerKey] = headerValue
        
        return self
    }
    
    public func with(headers: [String: String]) -> Self {
        headers.forEach { (key, value) in
            self.headers[key] = value
        }
        
        return self
    }
    
    public func with(body: Data?) -> Self {
        self.body = body
        
        return self
    }
    
    public func with(configuration: URLRequestConfiguration) -> Self {
        self.configuration = configuration
        
        return self
    }
    
    public func build() throws -> URLRequest {
        guard let url else {
            throw NetworkError.missingUrl
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpBody = body
        
        if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
            urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        
        if urlRequest.value(forHTTPHeaderField: "Accept") == nil {
            urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        }
        
        self.configureRequest(&urlRequest)
        
        self.reset()
        
        return urlRequest
    }
    
    // MARK: - Private
    
    private func reset() {
        self.url = nil
        self.method = nil
        self.headers = [:]
        self.body = nil
        self.configuration = URLRequestConfigurationImpl()
    }
    
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
