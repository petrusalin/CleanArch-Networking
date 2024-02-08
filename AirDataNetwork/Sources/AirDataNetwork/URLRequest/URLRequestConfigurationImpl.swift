//
//  URLRequestConfigurationImpl.swift
//
//
//  Created by Alin Petrus on 19.01.2024.
//

import Foundation

public struct URLRequestConfigurationImpl: URLRequestConfiguration {
    public let timeoutInterval: TimeInterval = 20.0
    public let cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy
    public let serviceType: URLRequest.NetworkServiceType = .default
    public let options: URLRequestOptions = .standard
}
