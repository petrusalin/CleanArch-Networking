//
//  PagedLoadableStateViewModel.swift
//
//
//  Created by Alin Petrus on 18.03.2024.
//

import Foundation

@MainActor
protocol PagedLoadableStateViewModel: LoadableStateViewModel {
    
    var canLoadMore: Bool { get }
    var isLoadingMore: Bool { get }
    
    func loadNextPage()

}
