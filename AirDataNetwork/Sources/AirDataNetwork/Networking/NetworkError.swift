//
//  NetworkError.swift
//
//
//  Created by Alin Petrus on 19.01.2024.
//

import Foundation

public enum NetworkError: Error {
    case generic
    case internalServerError
    case noDataConnection
    case badResourcePath
    case badInput
    case invalidResponse
    case cancelled
    case missingUrl
    case badUrl
    case queryCreation
    case decoding
    case encoding
    case alreadyExecuting
}
