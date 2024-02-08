//
//  LoadStateView.swift
//  AirDataNetworkDemo
//
//  Created by Alin Petrus on 19.01.2024.
//

import SwiftUI

/// Generic view that uses a `LoadStateViewModel` to encapsulate the load and state handling boilerplate code when using a view model
struct LoadStateView<ViewModel: LoadableStateViewModel, Content: View>: View {
    
    // MARK: - Properties
    
    @ObservedObject private var viewModel: ViewModel
    private let content: () -> Content
    private let showsProgressHud: Bool
    
    var body: some View {
        switch viewModel.state {
        case .idle:
            idleView()
        case .loading:
            LoadingView()
                .frame(maxHeight: .infinity)
        case .loaded:
            content()
        case .error(let error):
            errorView(error: error)
        }
    }
    
    // MARK: - Initializer
    
    init(viewModel: ViewModel,
         showsProgressHud: Bool = true,
         @ViewBuilder content: @escaping () -> Content) {
        self.viewModel = viewModel
        self.content = content
        self.showsProgressHud = showsProgressHud
    }
    
    // MARK: - Private
    
    private func idleView() -> some View {
        content()
            .onAppear(perform: viewModel.load)
    }
    
    private func errorView(error: LocalizedError) -> some View {
        VStack {
            Spacer()
            Text(error.localizedDescription)
            Spacer()
        }
    }
    
}

