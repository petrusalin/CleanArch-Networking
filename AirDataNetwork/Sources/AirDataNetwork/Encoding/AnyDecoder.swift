//
//  AnyDecoder.swift
//
//
//  Created by Alin Petrus on 19.01.2024.
//

import Foundation

public protocol AnyDecoder {
    func decode<T: Decodable>(data: Data) throws -> T
}

extension PropertyListDecoder: AnyDecoder {
    
    public func decode<T: Decodable>(data: Data) throws -> T {
        try decode(T.self, from: data)
    }
    
}

extension JSONDecoder: AnyDecoder {
    
    public func decode<T: Decodable>(data: Data) throws -> T {
        try decode(T.self, from: data)
    }
    
}

extension Data {
    
    public func decoded<T: Decodable>(using decoder: AnyDecoder = JSONDecoder()) throws -> T {
        return try decoder.decode(data: self)
    }
    
}

extension Decodable {
    
    public static func fromDictionary(_ dictionary: [String: Any], 
                                      using decoder: AnyDecoder = JSONDecoder()) throws -> Self {
        let data = try JSONSerialization.data(withJSONObject: dictionary, options: [.fragmentsAllowed])
        
        return try data.decoded(using: decoder)
    }
    
}
