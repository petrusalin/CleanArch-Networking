//
//  NetworkEngineImpl.swift
//
//
//  Created by Alin Petrus on 19.01.2024.
//

import Foundation

public final class NetworkEngineImpl: NetworkEngine {
    private let builderFactory: NetworkingBuilderFactory
    private let session: URLSession
    private let serverURL: String
    private let headers: [String: String]
    
    public init(serverURL: String,
                builderFactory: NetworkingBuilderFactory = NetworkingBuilderFactoryImpl(),
                session: URLSession = URLSession.shared,
                headers: [String: String] = [:]) {
        self.session = session
        self.serverURL = serverURL
        self.builderFactory = builderFactory
        self.headers = headers
    }
    
    public func send<T: Decodable>(_ request: Requestable) async throws -> T {
        let urlBuilder = self.builderFactory.urlBuilder()
        let urlRequestBuilder = self.builderFactory.urlRequestBuilder()
        let allHeaders = request.headers.merging(self.headers) { old, _ in old }
        let urlRequest = try urlRequestBuilder.urlRequest(forRequestable: request,
                                                          basePath: self.serverURL,
                                                          urlBuilder: urlBuilder,
                                                          headers: allHeaders)
        let response = try await self.session.data(for: urlRequest)
        
        guard let httpResponse = response.1 as? HTTPURLResponse else {
            throw NetworkError.generic
        }
        
        if let error = httpResponse.responseError {
            throw error
        }
        
        return try request.decoder.decode(data: response.0)
    }
    
    public func cancel<T: Requestable>(_ request: T) async throws {
        let urlBuilder = self.builderFactory.urlBuilder()
        let urlRequestBuilder = self.builderFactory.urlRequestBuilder()
        
        let urlRequest = try urlRequestBuilder.urlRequest(forRequestable: request,
                                                          basePath: self.serverURL,
                                                          urlBuilder: urlBuilder,
                                                          headers: [:])
        
        await self.task(forRequest: urlRequest)?.cancel()
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
                let task = tasks.first {
                    $0.originalRequest?.url == urlRequest.url &&
                    $0.originalRequest?.httpMethod == urlRequest.httpMethod
                }
                
                continuation.resume(with: .success(task))
            }
        }
    }
    
    deinit {
        self.session.invalidateAndCancel()
    }
    
}
