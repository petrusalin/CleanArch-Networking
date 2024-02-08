//
//  NetworkEngineImpl.swift
//
//
//  Created by Alin Petrus on 19.01.2024.
//

import Foundation

public actor NetworkEngineImpl: NetworkEngine {
    private let urlBuilder: URLBuilder
    private let requestBuilder: URLRequestBuilder
    private let session: URLSession
    private let basePath: String
    private let requestsInProgress: [String: Int] = [:]
    
    public init(basePath: String,
                urlBuilder: URLBuilder = URLBuilderImpl(),
                requestBuilder: URLRequestBuilder = URLRequestBuilderImpl(),
                session: URLSession = URLSession.shared) {
        self.session = session
        self.basePath = basePath
        self.urlBuilder = urlBuilder
        self.requestBuilder = requestBuilder
    }
    
    public func send<T: Decodable>(_ request: Requestable) async throws -> T {
        let urlRequest = try self.requestBuilder.urlRequest(forRequestable: request,
                                                            basePath: self.basePath,
                                                            urlBuilder: self.urlBuilder,
                                                            headers: [:])
        
        let data = try await self.session.data(for: urlRequest).0
        
        return try request.decoder.decode(data: data)
    }
    
    public func cancel<T: Requestable>(_ request: T) async throws {
        let urlRequest = try self.requestBuilder.urlRequest(forRequestable: request,
                                                            basePath: self.basePath,
                                                            urlBuilder: self.urlBuilder,
                                                            headers: [:])
        
        await task(forRequest: urlRequest)?.cancel()
    }
    
    public func cancelAllRequests() async {
        await withCheckedContinuation { continuation in
            self.session.getAllTasks { tasks in
                tasks.forEach { task in
                    task.cancel()
                }
            }
            
            continuation.resume()
        }
    }
    
    // MARK: - Private
    
    private func task(forRequest urlRequest: URLRequest) async -> URLSessionTask? {
        await withCheckedContinuation { continuation in
            self.session.getAllTasks { tasks in
                let task = tasks.first { $0.originalRequest?.url == urlRequest.url && $0.originalRequest?.httpMethod == urlRequest.httpMethod }
                
                continuation.resume(with: .success(task))
            }
        }
    }
}
