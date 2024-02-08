//
//  URLRequestConfiguration.swift
//
//
//  Created by Alin Petrus on 19.01.2024.
//

import Foundation

public protocol URLRequestConfiguration {
    var timeoutInterval: TimeInterval { get }
    var cachePolicy: URLRequest.CachePolicy { get }
    var serviceType: URLRequest.NetworkServiceType { get }
    var options: URLRequestOptions { get }
}
