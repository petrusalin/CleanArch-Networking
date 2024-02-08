//
//  URLRequestOptions.swift
//
//
//  Created by Alin Petrus on 19.01.2024.
//

import Foundation

public struct URLRequestOptions: OptionSet {
    public let rawValue: Int
    
    public static let allowsCellularAccess = Self(rawValue: 1 << 0)
    public static let allowsConstrainedNetworkAccess = Self(rawValue: 1 << 1)
    public static let allowsExpensiveNetworkAccess = Self(rawValue: 1 << 2)
    public static let assumeHTTP3Capable = Self(rawValue: 1 << 3)
    public static let httpShouldHandleCookies = Self(rawValue: 1 << 4)
    public static let httpShouldUsePipelining = Self(rawValue: 1 << 5)
    
    public static let standard: Self = [allowsCellularAccess, .allowsConstrainedNetworkAccess, .allowsExpensiveNetworkAccess]
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
}
