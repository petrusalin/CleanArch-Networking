//
//  LoadingView.swift
//  AirDataNetworkDemo
//
//  Created by Alin Petrus on 19.01.2024.
//

import SwiftUI

@MainActor
struct LoadingView: View {
    let title: String
    
    var body: some View {
        VStack {
            Spacer()
            ProgressView {
                Text(self.title)
            }
            .controlSize(.large)
            .progressViewStyle(CircularProgressViewStyle())
            Spacer()
        }
    }
    
    init(title: String = "Loading...") {
        self.title = title
    }
}

