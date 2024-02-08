//
//  URLBuilderImpl.swift
//
//
//  Created by Alin Petrus on 19.01.2024.
//

import Foundation

public final class URLBuilderImpl: URLBuilder {
    private var basePath: String?
    private var endpoint: String?
    private var queryParameters: [String: Any] = [:]
    
    public init() {}
    
    // MARK: - Public
    
    public func with(basePath: String) -> Self {
        self.basePath = basePath
        
        return self
    }
    
    public func with(endPointPath: String) -> Self {
        self.endpoint = endPointPath
        
        return self
    }
    
    public func with(queryParameterKey key: String, parameterValue: Any) -> Self {
        self.queryParameters[key] = parameterValue
        
        return self
    }
    
    public func with(queryParameters: [String: Any]) -> Self {
        queryParameters.forEach { (key, value) in
            self.queryParameters[key] = value
        }
        
        return self
    }
    
    public func build() throws -> URL {
        guard let basePath, let endpoint,
                let baseUrl = URL(string: basePath),
              let url = URL(string: endpoint, relativeTo: baseUrl) else {
            throw NetworkError.badResourcePath
        }
       
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        components?.queryItems = try self.queryItems()
        
        guard let completeUrl = components?.url else {
            throw NetworkError.badUrl
        }
        
        self.reset()
        
        return completeUrl
    }
    
    // MARK: - Private
    
    private func queryItems() throws -> [URLQueryItem] {
        try queryParameters.map { key, value in
            if let parameter = value as? String {
                return URLQueryItem(name: key, value: parameter)
            } else if let paramater = value as? Int {
                return URLQueryItem(name: key, value: String(paramater))
            } else if let parameter = value as? Bool {
                return URLQueryItem(name: key, value: String(parameter))
            } else if let parameter = value as? Double {
                return URLQueryItem(name: key, value: String(parameter))
            } else {
                throw NetworkError.queryCreation
            }
        }
    }
    
    private func reset() {
        self.basePath = nil
        self.endpoint = nil
        self.queryParameters = [:]
    }
    
}
