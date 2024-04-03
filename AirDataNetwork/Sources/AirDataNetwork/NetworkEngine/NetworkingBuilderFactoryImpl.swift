//
//  NetworkingBuilderFactoryImpl.swift
//  
//
//  Created by Alin Petrus on 29.03.2024.
//

import Foundation

public struct NetworkingBuilderFactoryImpl: NetworkingBuilderFactory {
    
    public init() {}
    
    public func urlBuilder() -> URLBuilder {
        URLBuilderImpl()
    }
    
    public func urlRequestBuilder() -> URLRequestBuilder {
        URLRequestBuilderImpl()
    }
    
}
