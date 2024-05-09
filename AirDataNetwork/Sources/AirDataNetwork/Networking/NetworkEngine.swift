//
//  NetworkEngine.swift
//
//
//  Created by Alin Petrus on 19.01.2024.
//

import Foundation

public protocol NetworkEngine {
    func send<T: Decodable>(_ request: Requestable) async throws -> T
    func cancel<T: Requestable>(_ request: T) async throws
    func cancelAllRequests() async
}
