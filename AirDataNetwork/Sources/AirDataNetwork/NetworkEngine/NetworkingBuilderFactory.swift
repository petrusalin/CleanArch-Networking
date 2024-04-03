//
//  NetworkingBuilderFactory.swift
//
//
//  Created by Alin Petrus on 26.03.2024.
//

import Foundation

public protocol NetworkingBuilderFactory {
    
    func urlBuilder() -> URLBuilder
    func urlRequestBuilder() -> URLRequestBuilder
    
}
