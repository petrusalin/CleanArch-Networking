//
//  URLBuilderImpl.swift
//
//
//  Created by Alin Petrus on 19.01.2024.
//

import Foundation
import OSLog

public struct URLBuilderImpl: URLBuilder {
    private var basePath: String?
    private var endpoint: String?
    private var queryParameters: [String: Any] = [:]
    
    public init() {}
    
    // MARK: - Public
    
    public func with(basePath: String) -> Self {
        var copy = self
        copy.basePath = basePath
        
        return copy
    }
    
    public func with(endPointPath: String) -> Self {
        var copy = self
        copy.endpoint = endPointPath
        
        return copy
    }
    
    public func with(queryParameterKey key: String, parameterValue: Any) -> Self {
        var copy = self
        copy.queryParameters[key] = parameterValue
        
        return copy
    }
    
    public func with(queryParameters: [String: Any]) -> Self {
        var copy = self
        queryParameters.forEach { key, value in
            copy.queryParameters[key] = value
        }
        
        return copy
    }
    
    public func build() throws -> URL {
        guard let basePath, let endpoint,
              let baseUrl = URL(string: basePath) else {
            throw NetworkError.badResourcePath
        }
        
        let url = baseUrl.appending(path: endpoint)
        
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        let queryItems = try self.queryItems()
        
        if !queryItems.isEmpty {
            components?.queryItems = queryItems
        }
        
        guard let completeUrl = components?.url else {
            throw NetworkError.badUrl
        }
        
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
    
}
