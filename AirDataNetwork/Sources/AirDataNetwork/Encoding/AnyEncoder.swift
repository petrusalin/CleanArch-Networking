//
//  AnyEncoder.swift
//
//
//  Created by Alin Petrus on 19.01.2024.
//

import Foundation

public enum EncodingError: Error {
    case dictionaryConversionError
}

public protocol AnyEncoder {
    func encode<T: Encodable>(_ value: T) throws -> Data
}

extension JSONEncoder: AnyEncoder {}

extension PropertyListEncoder: AnyEncoder {}

extension Encodable {
    
    public func encoded(using encoder: AnyEncoder = JSONEncoder()) throws -> Data {
        return try encoder.encode(self)
    }
    
}

extension Encodable {
    
    public func asDictionary(using encoder: AnyEncoder = JSONEncoder()) throws -> [String: Any] {
        let data = try self.encoded(using: encoder)
        
        guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
            throw EncodingError.dictionaryConversionError
        }
        
        return dictionary
    }
    
}
