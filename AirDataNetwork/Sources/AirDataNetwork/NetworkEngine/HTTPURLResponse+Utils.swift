//
//  HTTPURLResponse+Utils.swift
//
//
//  Created by Alin Petrus on 26.03.2024.
//

import Foundation

extension HTTPURLResponse {
    var isSuccess: Bool { statusCode >= 200 && statusCode <= 299 }

    var responseError: NetworkError? {
        guard !self.isSuccess else { return nil }
        
        return statusCode >= 500 && statusCode <= 599 ? .internalServerError : .generic
    }
}
