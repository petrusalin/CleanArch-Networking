//
//  LoadableStateViewModel.swift
//  AirDataNetworkDemo
//
//  Created by Alin Petrus on 19.01.2024.
//

import Foundation

/// Protocol that defines the requirements for a loadable view model, like the state and the load function
@MainActor
public protocol LoadableStateViewModel<Output, Failure>: ObservableObject  {
    /// Associated type for the loaded data type
    associatedtype Output: Equatable
    /// Associated type for the load failure data type
    associatedtype Failure: LocalizedError
    
    /// The state of the view model
    var state: LoadState<Output, Failure> { get }
    
    /// Function that does the loading
    func load()
}
