//
//  LoadableStateViewModel.swift
//  AirDataNetworkDemo
//
//  Created by Alin Petrus on 19.01.2024.
//

import Foundation

@MainActor
public protocol LoadableStateViewModel<Output, Failure>: ObservableObject  {
    associatedtype Output: Equatable
    associatedtype Failure: LocalizedError
    
    var state: LoadState<Output, Failure> { get }
    
    func load()
}
